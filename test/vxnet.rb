#  +-------------------------------------------------------------------------
#  | Copyright (C) 2016 Yunify, Inc.
#  +-------------------------------------------------------------------------
#  | Licensed under the Apache License, Version 2.0 (the "License");
#  | you may not use this work except in compliance with the License.
#  | You may obtain a copy of the License in the LICENSE file, or at:
#  |
#  | http://www.apache.org/licenses/LICENSE-2.0
#  |
#  | Unless required by applicable law or agreed to in writing, software
#  | distributed under the License is distributed on an "AS IS" BASIS,
#  | WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  | See the License for the specific language governing permissions and
#  | limitations under the License.
#  +-------------------------------------------------------------------------

require 'qingcloud/sdk'

# ----------------------------------------------------------------------------
run_instances_output = nil

Given(/^vxnet a instance configuration:$/) do |configuration|
  @run_instance_configuration = configuration.hashes[0]
end

When(/^run vxnet instance$/) do
  run_instances_output = @instance_service.run_instances(
    image_id:      @run_instance_configuration['image_id'],
    instance_type: @run_instance_configuration['instance_type'],
    count:         @run_instance_configuration['count'],
    login_mode:    @run_instance_configuration['login_mode'],
    login_passwd:  @run_instance_configuration['login_passwd'],
  )
end

Then(/^run vxnet instance should get a job ID$/) do
  fail if run_instances_output[:job_id].empty?
end

Then(/^run vxnet instance should be sure that instance is running$/) do
  retries = invoke_with_retry_times(@test_config) do    
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [run_instances_output[:job_id]]
    ) 
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------
create_vxnets_output = nil

When(/^create vxnets$/) do
  create_vxnets_output = @vxnet_service.create_vxnets(
    vxnet_type: 1,
  )
end

Then(/^create vxnets should be successfull$/) do
  fail unless create_vxnets_output[:ret_code] == 0
end

Then(/^create vxnets should get (\d+) vxnets at least$/) do |count|
  fail unless create_vxnets_output[:vxnets].size >= count.to_i
end

# ----------------------------------------------------------------------------
describe_vxnets_output = nil

When(/^describe vxnets$/) do
  describe_vxnets_output = @vxnet_service.describe_vxnets
end

Then(/^describe vxnets should be successfull$/) do
  fail unless describe_vxnets_output[:ret_code] = 0
end

Then(/^describe vxnets should have the one I created$/) do
  fail unless describe_vxnets_output[:vxnet_set].any? { |z| z[:vxnet_id] == create_vxnets_output[:vxnets][0] }
end

# ----------------------------------------------------------------------------

modify_vxnet_attributes_output = nil 

Given(/^vxnet configuration:$/) do |configuration|
  @modify_vxnet_attributes_configuration = configuration.hashes[0]
end

When(/^modify vxnet attributes$/) do
  modify_vxnet_attributes_output = @vxnet_service.modify_vxnet_attributes(
    vxnet: create_vxnets_output[:vxnets][0],
    vxnet_name: @modify_vxnet_attributes_configuration[:vxnet_name],
    description: @modify_vxnet_attributes_configuration[:description],
  )
end

Then(/^modify vxnet attributes should be successfull$/) do
  fail unless modify_vxnet_attributes_output[:ret_code] == 0
end

Then(/^modify vxnet attributes should change the vxnet attributes$/) do
  describe_vxnets_output = @vxnet_service.describe_vxnets(vxnets: create_vxnets_output[:vxnets])
  vxnet_attributes = describe_vxnets_output[:vxnet_set][0]
  fail if vxnet_attributes[:vxnet_name] != @modify_vxnet_attributes_configuration['instance_name'] && vxnet_attributes[:description] != @modify_vxnet_attributes_configuration['description']
end

# ----------------------------------------------------------------------------
create_routers_output = nil 

When(/^create routers$/) do
  create_routers_output = @router_service.create_routers(
    vpc_network: '192.168.0.0/16'
  )
end

Then(/^create routers should get a job ID$/) do
  fail if create_routers_output[:job_id].empty?
end

Then(/^create routers will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do   
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [create_routers_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------

join_router_output = nil 

When(/^join router$/) do
  join_router_output = @router_service.join_router(
    vxnet: create_vxnets_output[:vxnets][0],
    router: create_routers_output[:routers][0],
    ip_network: '192.168.0.0/24'
  )
end

Then(/^join router should get a job ID$/) do
  fail if join_router_output[:job_id].empty?
end

Then(/^join router will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do   
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [join_router_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------

join_vxnet_output = nil

When(/^join vxnet$/) do
  # invoke_with_retry_times(@test_config) do   
    join_vxnet_output = @vxnet_service.join_vxnet(
      vxnet: create_vxnets_output[:vxnets][0],
      instances: run_instances_output[:instances],
    )

  #   break if join_vxnet_output[:ret_code] == 0
  # end
end

Then(/^join vxnet should get a job ID$/) do
  fail if join_vxnet_output[:job_id].empty?
end

Then(/^join vxnet will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do   
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [join_vxnet_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------

describe_vxnet_instances_output = nil 

When(/^describe vxnet instances$/) do
  describe_vxnet_instances_output = @vxnet_service.describe_vxnet_instances(
    vxnet: create_vxnets_output[:vxnets][0],
  )
end

Then(/^describe vxnet instances should be successfull$/) do
  fail unless describe_vxnet_instances_output[:ret_code] == 0
end

Then(/^describe vxnet instances should have the instance I created just before$/) do
  fail unless describe_vxnet_instances_output[:instance_set].any? { |z| z[:instance_id] == run_instances_output[:instances][0] }
end

# ----------------------------------------------------------------------------

leave_vxnet_output = nil

When(/^leave vxnet$/) do
  # invoke_with_retry_times(@test_config) do 
    leave_vxnet_output = @vxnet_service.leave_vxnet(
      vxnet: create_vxnets_output[:vxnets][0],
      instances: run_instances_output[:instances],
    )

  #   break if leave_vxnet_output[:ret_code] == 0
  # end
end

Then(/^leave vxnet should get a job ID$/) do
  fail if leave_vxnet_output[:job_id].empty?
end

Then(/^leave vxnet will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do   
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [leave_vxnet_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------

leave_router_output = nil 

When(/^leave router$/) do
  leave_router_output = @router_service.leave_router(
    vxnets: create_vxnets_output[:vxnets],
    router: create_routers_output[:routers][0],
  )
end

Then(/^leave router should get a job ID$/) do
  fail if leave_vxnet_output[:job_id].empty?
end

Then(/^leave router will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do   
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [leave_router_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------

delete_routers_output = nil 

When(/^delete routers$/) do
  delete_routers_output = @router_service.delete_routers(
    routers: create_routers_output[:routers],
  )
end

Then(/^delete routers should get a job ID$/) do
  fail if delete_routers_output[:job_id].empty?
end

Then(/^delete routers will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do   
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [delete_routers_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------

delete_vxnets_output = nil

When(/^delete vxnets$/) do
  delete_vxnets_output = @vxnet_service.delete_vxnets(
    vxnets: create_vxnets_output[:vxnets]
  )
end

Then(/^delete vxnets should be successfull$/) do
  fail unless delete_vxnets_output[:ret_code] == 0
end

# ----------------------------------------------------------------------------

terminate_instances_output = nil

When(/^remove vxnet instances$/) do
  invoke_with_retry_times(@test_config) do   
    terminate_instances_output = @instance_service.terminate_instances(
      instances: run_instances_output[:instances],
    )
    break if terminate_instances_output[:ret_code] == 0
  end
end

Then(/^remove vxnet instances should get a job ID$/) do
  fail if terminate_instances_output[:job_id].empty?
end