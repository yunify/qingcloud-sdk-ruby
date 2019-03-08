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

Given(/^eip instance configuration:$/) do |configuration|
  @run_instance_configuration = configuration.hashes[0]
end

When(/^run eip instance$/) do
  run_instances_output = @instance_service.run_instances(
    image_id:      @run_instance_configuration['image_id'],
    instance_type: @run_instance_configuration['instance_type'],
    count:         @run_instance_configuration['count'],
    login_mode:    @run_instance_configuration['login_mode'],
    login_passwd:  @run_instance_configuration['login_passwd'],
  )
end

Then(/^run eip instance should get a job ID$/) do
  fail if run_instances_output[:job_id].empty?
end

Then(/^run eip instance be sure that instance is running$/) do
  retries = invoke_with_retry_times(@test_config) do    
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [run_instances_output[:job_id]],
    ) 
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------

allocate_eips_output = nil 

Given(/^eip configuration:$/) do |configuration|
  @allocate_eips_configuration = configuration.hashes[0]
end

When(/^allocate eips$/) do
  allocate_eips_output = @eip_service.allocate_eips(
    bandwidth: @allocate_eips_configuration['bandwidth'],
  )
end

Then(/^allocate eips should be success$/) do
  fail unless allocate_eips_output[:ret_code] == 0
end

# ----------------------------------------------------------------------------

describe_eips_output = nil 

When(/^describe eips$/) do
  describe_eips_output = @eip_service.describe_eips 
end

Then(/^describe eips should be success$/) do
  fail unless describe_eips_output[:ret_code] == 0
end

Then(/^describe eips will list all eips I have been allocated$/) do
  fail unless describe_eips_output[:eip_set].map { |z| z[:eip_id] }.include?(allocate_eips_output[:eips][0])
end

# ----------------------------------------------------------------------------

change_eips_bandwidth_output = nil 

Given(/^eip bandwidth configuration:$/) do |configuration|
  @change_eips_bandwidth_configuration = configuration.hashes[0]
end

When(/^change eips bandwidth$/) do
  invoke_with_retry_times(@test_config) do
    change_eips_bandwidth_output = @eip_service.change_eips_bandwidth(
      eips: allocate_eips_output[:eips],
      bandwidth: @change_eips_bandwidth_configuration['bandwidth'],
    )

    break if change_eips_bandwidth_output[:ret_code] == 0
  end
end

Then(/^change eips bandwidth should get a job ID$/) do
  fail if change_eips_bandwidth_output[:job_id].empty?
end

Then(/^change eips bandwidth will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do    
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [change_eips_bandwidth_output[:job_id]],
    ) 
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

Then(/^change eips bandwidth will change the bandwidth$/) do
  invoke_with_retry_times(@test_config) do  
    describe_eips_output = @eip_service.describe_eips(eips: allocate_eips_output[:eips])
    break if describe_eips_output[:ret_code] == 0
  end

  eip_attributes = describe_eips_output[:eip_set][0]
  fail if eip_attributes[:bandwidth] != @change_eips_bandwidth_configuration['bandwidth'].to_i
end

# ----------------------------------------------------------------------------

change_eips_billing_mode_output = nil 

Given(/^eip billing mode configuration:$/) do |configuration|
  @change_eips_billing_mode_configuration = configuration.hashes[0]
end

When(/^change eips billing mode$/) do
  change_eips_billing_mode_output = @eip_service.change_eips_billing_mode(
    eips: allocate_eips_output[:eips],
    billing_mode: @change_eips_billing_mode_configuration['billing_mode']
  )
end

Then(/^change eips billing mode should get a job ID$/) do
  fail if change_eips_billing_mode_output[:job_id].empty?
end

Then(/^change eips billing mode will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do    
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [change_eips_billing_mode_output[:job_id]],
    ) 
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

Then(/^change eips billing mode will change the billing mode$/) do
  invoke_with_retry_times(@test_config) do  
    describe_eips_output = @eip_service.describe_eips(eips: allocate_eips_output[:eips])
    break if describe_eips_output[:ret_code] == 0
  end

  eip_attributes = describe_eips_output[:eip_set][0]
  fail if eip_attributes[:billing_mode] != @change_eips_billing_mode_configuration['billing_mode']
end

# ----------------------------------------------------------------------------

change_eip_attributes_output = nil 

Given(/^eip attributes configuration:$/) do |configuration|
  @change_eip_attributes_configuration = configuration.hashes[0]
end

When(/^change eip attributes$/) do
  change_eip_attributes_output = @eip_service.modify_eip_attributes(
    eip: allocate_eips_output[:eips][0],
    eip_name: @change_eip_attributes_configuration['eip_name'],
    description: @change_eip_attributes_configuration['description']
  )
end

Then(/^change eip attributes should be success$/) do
  fail unless change_eip_attributes_output[:ret_code] == 0
end

Then(/^change eip attributes will change the name and description of eip$/) do
  invoke_with_retry_times(@test_config) do  
    describe_eips_output = @eip_service.describe_eips(eips: allocate_eips_output[:eips])
    break if describe_eips_output[:ret_code] == 0
  end

  eip_attributes = describe_eips_output[:eip_set][0]
  fail if eip_attributes[:eip_name] != @change_eip_attributes_configuration['eip_name'] && eip_attributes[:description] != @change_eip_attributes_configuration['description']
end

# ----------------------------------------------------------------------------
create_vxnets_output = nil

When(/^create eip vxnets$/) do
  create_vxnets_output = @vxnet_service.create_vxnets(
    vxnet_type: 1,
  )
end

Then(/^create eip vxnets should be successfull$/) do
  fail unless create_vxnets_output[:ret_code] == 0
end

Then(/^create eip vxnets should get (\d+) vxnets at least$/) do |count|
  fail unless create_vxnets_output[:vxnets].size >= count.to_i
end

# ----------------------------------------------------------------------------
create_routers_output = nil 

When(/^create eip routers$/) do
  create_routers_output = @router_service.create_routers(
    vpc_network: '192.168.0.0/16'
  )
end

Then(/^create eip routers should get a job ID$/) do
  fail if create_routers_output[:job_id].empty?
end

Then(/^create eip routers will be finished$/) do
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

When(/^join eip router$/) do
  join_router_output = @router_service.join_router(
    vxnet: create_vxnets_output[:vxnets][0],
    router: create_routers_output[:routers][0],
    ip_network: '192.168.0.0/24'
  )
end

Then(/^join eip router should get a job ID$/) do
  fail if join_router_output[:job_id].empty?
end

Then(/^join eip router will be finished$/) do
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

When(/^join eip vxnet$/) do
  # invoke_with_retry_times(@test_config) do   
    join_vxnet_output = @vxnet_service.join_vxnet(
      vxnet: create_vxnets_output[:vxnets][0],
      instances: run_instances_output[:instances],
    )

  #   break if join_vxnet_output[:ret_code] == 0
  # end
end

Then(/^join eip vxnet should get a job ID$/) do
  fail if join_vxnet_output[:job_id].empty?
end

Then(/^join eip vxnet will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do   
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [join_vxnet_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------

associate_eip_output = nil 

When(/^associate eip$/) do
  invoke_with_retry_times(@test_config) do  
    associate_eip_output = @eip_service.associate_eip(
      eip: allocate_eips_output[:eips][0],
      instance: run_instances_output[:instances][0],
    )
    break if associate_eip_output[:ret_code] == 0
  end
end

Then(/^associate eip should get a job ID$/) do
  fail if associate_eip_output[:job_id].empty?
end

Then(/^associate eip should be finished$/) do
  retries = invoke_with_retry_times(@test_config) do    
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [associate_eip_output[:job_id]],
    ) 
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------

dissociate_eip_output = nil 

When(/^dissociate eips$/) do
  invoke_with_retry_times(@test_config) do 
    dissociate_eip_output = @eip_service.dissociate_eips(
      eips: allocate_eips_output[:eips],
    )

    break if dissociate_eip_output[:ret_code] == 0
  end
end

Then(/^dissociate eips should get a job ID$/) do
  fail if dissociate_eip_output[:job_id].empty?
end

Then(/^dissociate eips will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do    
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [dissociate_eip_output[:job_id]],
    ) 
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------

leave_vxnet_output = nil

When(/^leave eip vxnet$/) do
  # invoke_with_retry_times(@test_config) do 
    leave_vxnet_output = @vxnet_service.leave_vxnet(
      vxnet: create_vxnets_output[:vxnets][0],
      instances: run_instances_output[:instances],
    )

  #   break if leave_vxnet_output[:ret_code] == 0
  # end
end

Then(/^leave eip vxnet should get a job ID$/) do
  fail if leave_vxnet_output[:job_id].empty?
end

Then(/^leave eip vxnet will be finished$/) do
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

When(/^leave eip router$/) do
  leave_router_output = @router_service.leave_router(
    vxnets: create_vxnets_output[:vxnets],
    router: create_routers_output[:routers][0],
  )
end

Then(/^leave eip router should get a job ID$/) do
  fail if leave_vxnet_output[:job_id].empty?
end

Then(/^leave eip router will be finished$/) do
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

When(/^delete eip routers$/) do
  delete_routers_output = @router_service.delete_routers(
    routers: create_routers_output[:routers],
  )
end

Then(/^delete eip routers should get a job ID$/) do
  fail if delete_routers_output[:job_id].empty?
end

Then(/^delete eip routers will be finished$/) do
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

When(/^delete eip vxnets$/) do
  delete_vxnets_output = @vxnet_service.delete_vxnets(
    vxnets: create_vxnets_output[:vxnets]
  )
end

Then(/^delete eip vxnets should be successfull$/) do
  fail unless delete_vxnets_output[:ret_code] == 0
end


# ----------------------------------------------------------------------------

release_eips_output = nil 

When(/^release eips$/) do
  invoke_with_retry_times(@test_config) do
    release_eips_output = @eip_service.release_eips(
      eips: allocate_eips_output[:eips],
    )

    break if release_eips_output[:ret_code] == 0
  end
end

Then(/^release eips should get a job ID$/) do
  fail if release_eips_output[:job_id].empty?
end

Then(/^release eips will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do    
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [release_eips_output[:job_id]],
    ) 
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------

terminate_instances_output = nil 

When(/^remove eip instances$/) do
  invoke_with_retry_times(@test_config) do   
    terminate_instances_output = @instance_service.terminate_instances(
      instances: run_instances_output[:instances],
    )
    break if terminate_instances_output[:ret_code] == 0
  end
end

Then(/^remove eip instances should get a job ID$/) do
  fail if terminate_instances_output[:job_id].empty?
end
