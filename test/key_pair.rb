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

create_key_pair_output = nil

When(/^create key pair$/) do
  create_key_pair_output = @key_pair_service.create_key_pair
end

Then(/^create key pair should be success$/) do
  fail unless create_key_pair_output[:ret_code] == 0
end

Then(/^create key pair will get a keypair_id$/) do
  fail if create_key_pair_output[:keypair_id].empty?
end

# ----------------------------------------------------------------------------

describe_key_pairs_output = nil

When(/^describe key pairs$/) do
  describe_key_pairs_output = @key_pair_service.describe_key_pairs 
end

Then(/^describe key pair should be success$/) do
  fail unless describe_key_pairs_output[:ret_code] == 0
end

Then(/^describe key pairs should get at least (\d+) key pairs$/) do |count|
  fail unless describe_key_pairs_output[:keypair_set].size >= count.to_i
end

# ----------------------------------------------------------------------------

modify_key_pair_attributes_output = nil 

Given(/^key pair attributes configuration:$/) do |configuration|
  @modify_key_pair_attributes_configuration = configuration.hashes[0]
end

When(/^modify key pair attributes$/) do
  modify_key_pair_attributes_output = @key_pair_service.modify_key_pair_attributes(
    keypair: create_key_pair_output[:keypair_id],
    keypair_name: @modify_key_pair_attributes_configuration[:keypair_name],
    description: @modify_key_pair_attributes_configuration[:description],
  )
end

Then(/^modify key pair attributes will be success$/) do
  fail unless modify_key_pair_attributes_output[:ret_code] == 0
end

Then(/^modify key pair attributes should change the name and description$/) do
  describe_key_pairs_output = @key_pair_service.describe_key_pairs(keypairs: [create_key_pair_output[:keypair_id]])
  key_pair_attributes = describe_key_pairs_output[:keypair_set][0]
  fail if key_pair_attributes[:keypair_name] != @modify_key_pair_attributes_configuration['keypair_name'] && key_pair_attributes[:description] != @modify_key_pair_attributes_configuration['description']
end

# ----------------------------------------------------------------------------

run_instances_output = nil 

Given(/^keypairs instance configuration:$/) do |configuration|
  @run_instance_configuration = configuration.hashes[0]
end

When(/^run keypairs eip instance$/) do
  run_instances_output = @instance_service.run_instances(
    image_id:      @run_instance_configuration['image_id'],
    instance_type: @run_instance_configuration['instance_type'],
    count:         @run_instance_configuration['count'],
    login_mode:    @run_instance_configuration['login_mode'],
    login_passwd:  @run_instance_configuration['login_passwd'],
  )
end

Then(/^run keypairs instance should get a job ID$/) do
  fail if run_instances_output[:job_id].empty?
end

Then(/^run keypairs instance be sure that instance is running$/) do
  retries = invoke_with_retry_times(@test_config) do    
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [run_instances_output[:job_id]],
    ) 
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries] 
end

# ----------------------------------------------------------------------------

attach_key_pairs_output = nil 

When(/^attach key pairs$/) do
  attach_key_pairs_output = @key_pair_service.attach_key_pairs(
    keypairs: [create_key_pair_output[:keypair_id]],
    instances: run_instances_output[:instances],
  )
end

Then(/^attach key pairs should get a job ID$/) do
  fail if attach_key_pairs_output[:job_id].empty?
end

Then(/^attach key pairs will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do   
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [attach_key_pairs_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------

detach_key_pairs_output = nil 

When(/^detach key pairs$/) do
  detach_key_pairs_output = @key_pair_service.detach_key_pairs(
    keypairs: [create_key_pair_output[:keypair_id]],
    instances: run_instances_output[:instances],
  )
end

Then(/^detach key pairs should get a job ID$/) do
  fail if detach_key_pairs_output[:job_id].empty?
end

Then(/^detach key pairs will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do   
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [detach_key_pairs_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------

delete_key_pairs_output = nil

When(/^delete key pairs$/) do
  delete_key_pairs_output = @key_pair_service.delete_key_pairs(
    keypairs: [create_key_pair_output[:keypair_id]],
  )
end

Then(/^delete key pairs should be success$/) do
  fail unless delete_key_pairs_output[:ret_code] == 0
end

Then(/^delete key pairs should get the keypairs deleted$/) do
  fail unless delete_key_pairs_output[:keypairs][0] == create_key_pair_output[:keypair_id]
end

# ----------------------------------------------------------------------------

terminate_instances_output = nil 

When(/^remove keypairs instances$/) do
  invoke_with_retry_times(@test_config) do   
    terminate_instances_output = @instance_service.terminate_instances(
      instances: run_instances_output[:instances],
    )
    break if terminate_instances_output[:ret_code] == 0
  end
end

Then(/^remove keypairs instances should get a job ID$/) do
  fail if terminate_instances_output[:job_id].empty?
end
