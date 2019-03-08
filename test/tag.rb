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

create_tag_output = nil 

Given(/^tag configuration:$/) do |configuration|
  @create_tag_configuration = configuration.hashes[0]
end

When(/^create tag$/) do
  create_tag_output = @tag_service.create_tag(
    tag_name: @create_tag_configuration[:tag_name],
  )
end

Then(/^create tag should be success$/) do
  fail unless create_tag_output[:ret_code] == 0
end

# ----------------------------------------------------------------------------

describe_tags_output = nil

When(/^describe tags$/) do
  describe_tags_output = @tag_service.describe_tags 
end

Then(/^describe tags should be success$/) do
  fail unless describe_tags_output[:ret_code] == 0
end

Then(/^describe tags should get at least (\d+) tags$/) do |count|
  fail unless describe_tags_output[:tag_set].size >= count.to_i
end

# ----------------------------------------------------------------------------

modify_tag_attributes_output = nil 

Given(/^modify tag attributes configuration:$/) do |configuration|
  @modify_tag_attributes_configuration = configuration.hashes[0]
end

When(/^modify tag attributes$/) do
  modify_tag_attributes_output = @tag_service.modify_tag_attributes(
    tag: create_tag_output[:tag_id],
    tag_name: @modify_tag_attributes_configuration['tag_name'],
    description: @modify_tag_attributes_configuration['description']
  )
end

Then(/^modify tag attributes should be success$/) do
  fail unless modify_tag_attributes_output[:ret_code] == 0
end

Then(/^modify tag attributes will change the tag attributes$/) do
  invoke_with_retry_times(@test_config) do  
    describe_tags_output = @tag_service.describe_tags(tags: [create_tag_output[:tag_id]])
    break if describe_tags_output[:ret_code] == 0
  end

  tag_attributes = describe_tags_output[:tag_set][0]
  fail if tag_attributes[:tag_name] != @modify_tag_attributes_configuration['tag_name'] && tag_attributes[:description] != @modify_tag_attributes_configuration['description']
end


# ----------------------------------------------------------------------------

run_instances_output = nil

Given(/^tag instance configuration:$/) do |configuration|
  @run_instance_configuration = configuration.hashes[0]
end

When(/^run tag instance$/) do
  run_instances_output = @instance_service.run_instances(
    image_id:      @run_instance_configuration['image_id'],
    instance_type: @run_instance_configuration['instance_type'],
    count:         @run_instance_configuration['count'],
    login_mode:    @run_instance_configuration['login_mode'],
    login_passwd:  @run_instance_configuration['login_passwd'],
  )
end

Then(/^run tag instance should get a job ID$/) do
  fail if run_instances_output[:job_id].empty?
end

Then(/^run tag instance be sure that instance is running$/) do
  retries = invoke_with_retry_times(@test_config) do    
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [run_instances_output[:job_id]],
    ) 
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------

attach_tags_output = nil 

When(/^attach tags$/) do
  attach_tags_output = @tag_service.attach_tags(
    resource_tag_pairs: [
      {
        tag_id: create_tag_output[:tag_id],
        resource_type: 'instance',
        resource_id: run_instances_output[:instances][0]
      }
    ],
  )
end

Then(/^attach tags should be success$/) do
  fail unless attach_tags_output[:ret_code] == 0
end

# ----------------------------------------------------------------------------

detach_tags_output = nil 

When(/^detach tags$/) do
  detach_tags_output = @tag_service.detach_tags(
    resource_tag_pairs: [
      {
        tag_id: create_tag_output[:tag_id],
        resource_type: 'instance',
        resource_id: run_instances_output[:instances][0]
      }
    ],
  )
end

Then(/^dttach tags should be success$/) do
  fail unless detach_tags_output[:ret_code] == 0
end

# ----------------------------------------------------------------------------

terminate_instances_output = nil 

When(/^remove tag instances$/) do
  invoke_with_retry_times(@test_config) do   
    terminate_instances_output = @instance_service.terminate_instances(
      instances: run_instances_output[:instances],
    )
    break if terminate_instances_output[:ret_code] == 0
  end
end

Then(/^remove tag instances should get a job ID$/) do
  fail if terminate_instances_output[:job_id].empty?
end

# ----------------------------------------------------------------------------

delete_tags_output = nil 
When(/^delete tags$/) do
  delete_tags_output = @tag_service.delete_tags(
    tags: [create_tag_output[:tag_id]],
  )
end

Then(/^delete tags should be success$/) do
  fail unless delete_tags_output[:ret_code] == 0
end

Then(/^delete tags should respond the tag I have created$/) do
  fail unless delete_tags_output[:tags].include?(create_tag_output[:tag_id])
end
