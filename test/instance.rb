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

Given(/^instance configuration:$/) do |configuration|
  @run_instance_configuration = configuration.hashes[0]
end

When(/^run instances$/) do
  run_instances_output = @instance_service.run_instances(
    image_id:      @run_instance_configuration['image_id'],
    instance_type: @run_instance_configuration['instance_type'],
    count:         @run_instance_configuration['count'],
    login_mode:    @run_instance_configuration['login_mode'],
    login_passwd:  @run_instance_configuration['login_passwd'],
  )
end

Then(/^run instances should get a job ID$/) do
  fail if run_instances_output[:job_id].empty?
end

Then(/^run instances will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do    
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [run_instances_output[:job_id]]
    ) 
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------
describe_instances_output = nil 

When(/^describe instances$/) do  
  describe_instances_output = @instance_service.describe_instances
end

Then(/^describe instances should get (\d+) instance at least$/) do |count|  
  fail unless describe_instances_output[:total_count] >= count.to_i
  fail unless describe_instances_output[:instance_set].size >= count.to_i
end

Then(/^describe instances should hava the instance I just created$/) do    
  fail unless describe_instances_output[:instance_set].any? { |a| run_instances_output[:instances].include? a[:instance_id] }
end

# ----------------------------------------------------------------------------
stop_instances_output = nil 

When(/^stop instances$/) do
  retries = invoke_with_retry_times(@test_config) do
    stop_instances_output = @instance_service.stop_instances(
      instances: run_instances_output[:instances],
    )
    break if stop_instances_output[:ret_code] == 0
  end 
end

Then(/^stop instances should get a job ID$/) do
  fail if stop_instances_output[:job_id].empty?
end

Then(/^stop instances will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do   
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [stop_instances_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------
start_instances_output = nil 

When(/^start instances$/) do
  invoke_with_retry_times(@test_config) do
    start_instances_output = @instance_service.start_instances(
      instances: run_instances_output[:instances],
    )
    break if start_instances_output[:ret_code] == 0
  end
end

Then(/^start instances should get a job ID$/) do
  fail if start_instances_output[:job_id].empty?
end

Then(/^start instances will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do   
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [start_instances_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------
restart_instances_output = nil 

When(/^restart instances$/) do
  invoke_with_retry_times(@test_config) do
    restart_instances_output = @instance_service.restart_instances(
      instances: run_instances_output[:instances],
    )
    break if restart_instances_output[:ret_code] == 0
  end
end

Then(/^restart instances should get a job ID$/) do
  fail if restart_instances_output[:job_id].empty?
end

Then(/^restart instances will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do   
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [restart_instances_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------
reset_instances_output = nil 

Given(/^reset instance configuration:$/) do |configuration|
  @reset_instance_configuration = configuration.hashes[0]
end

When(/^reset instances$/) do
  invoke_with_retry_times(@test_config) do
    reset_instances_output = @instance_service.reset_instances(
      instances: run_instances_output[:instances],
      login_mode:    @reset_instance_configuration['login_mode'],
      login_passwd:  @reset_instance_configuration['login_passwd'],
    )
    break if reset_instances_output[:ret_code] == 0
  end
end

Then(/^reset instances should get a job ID$/) do
  fail if reset_instances_output[:job_id].empty?
end

Then(/^reset instances will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do   
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [reset_instances_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------
modify_instance_attributes_output = nil 

Given(/^instance attributes:$/) do |configuration|
  @modify_instance_attributes_configuration = configuration.hashes[0]
end

When(/^modify instance attributes$/) do
  modify_instance_attributes_output = @instance_service.modify_instance_attributes(
    instance_name:  @modify_instance_attributes_configuration['instance_name'],
    description: @modify_instance_attributes_configuration['description'],
    instance: run_instances_output[:instances][0],
  )
end

Then(/^modify instance attributes should be successfull$/) do
  fail unless modify_instance_attributes_output[:ret_code] == 0
end

And(/^modify instance attributes should change the instance attribuites$/) do
  describe_instances_output = @instance_service.describe_instances(instances: run_instances_output[:instances])
  instance_attributes = describe_instances_output[:instance_set][0]
  fail if instance_attributes[:instance_name] != @modify_instance_attributes_configuration['instance_name'] && instance_attributes[:description] != @modify_instance_attributes_configuration['description']
end

# ----------------------------------------------------------------------------
describe_instance_types_output = nil

When(/^describe instance types$/) do
  describe_instance_types_output = @instance_service.describe_instance_types
end

Then(/^describe instance types should get (\d+) instance type at least$/) do |count|
  fail unless describe_instance_types_output[:instance_type_set].size >= count.to_i
end

And(/^describe instance types should have the types I just created$/) do
  types = describe_instance_types_output[:instance_type_set].map { |a| a[:instance_type_id] }
  fail unless describe_instances_output[:instance_set].any? { |z| types.include?(z[:instance_type]) }
end

# ----------------------------------------------------------------------------

terminate_instances_output = nil

When(/^terminate instances$/) do
  invoke_with_retry_times(@test_config) do   
    terminate_instances_output = @instance_service.terminate_instances(
      instances: run_instances_output[:instances],
    )
    break if terminate_instances_output[:ret_code] == 0
  end
end

Then(/^terminate instances should get a job ID$/) do
  fail if terminate_instances_output[:job_id].empty?
end

Then(/^terminate instances will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do   
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [terminate_instances_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------

When(/^describe jobs$/) do
    @describe_jobs_output = @job_service.describe_jobs
  end
  
Then(/^describe jobs should get (\d+) job at least$/) do |count|
  fail unless @describe_jobs_output[:job_set].size >= count.to_i
end

Then(/^describe jobs should have the jobs I just created$/) do
  created_job_ids = [run_instances_output[:job_id], terminate_instances_output[:job_id]]
  fail unless @describe_jobs_output[:job_set].count { |z| created_job_ids.include?(z[:job_id]) } == 2
end


  

