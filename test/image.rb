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
stop_instances_output = nil 

Given(/^one instance configuration:$/) do |configuration|
  @run_instance_configuration = configuration.hashes[0]
end

When(/^run instance$/) do
  run_instances_output = @instance_service.run_instances(
    image_id:      @run_instance_configuration['image_id'],
    instance_type: @run_instance_configuration['instance_type'],
    count:         @run_instance_configuration['count'],
    login_mode:    @run_instance_configuration['login_mode'],
    login_passwd:  @run_instance_configuration['login_passwd'],
  )
end

Then(/^should get a job ID$/) do
  fail if run_instances_output[:job_id].empty?
end

Then(/^be sure that instance is running$/) do
  retries = invoke_with_retry_times(@test_config) do    
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [run_instances_output[:job_id]],
    ) 
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries] 
end

Then(/^stop instance$/) do
  retries = invoke_with_retry_times(@test_config) do
    stop_instances_output = @instance_service.stop_instances(
      instances: run_instances_output[:instances],
    )
    break if stop_instances_output[:ret_code] == 0
  end 

  fail if retries == @test_config[:max_retries]
end

Then(/^be sure that instance is stopped$/) do
  retries = invoke_with_retry_times(@test_config) do   
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [stop_instances_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------
capture_instance_output = nil 

When(/^capture instance$/) do
  capture_instance_output = @image_service.capture_instance(
    instance: run_instances_output[:instances][0],
    image_name: 'cucumber_demo'
  )
end

Then(/^capture instance should get a job ID$/) do
  fail if capture_instance_output[:job_id].empty?
end

Then(/^capture instance will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do   
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [capture_instance_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------
describe_images_output = nil 

When(/^describe images$/) do
  describe_images_output = @image_service.describe_images
end

Then(/^describe images should get (\d+) instance at least$/) do |count|
  fail unless describe_images_output[:total_count] >= count.to_i
end

# ----------------------------------------------------------------------------
modify_image_attributes_output = nil 

Given(/^image configuration:$/) do |configuration|
  @modify_image_attributes_configuration = configuration.hashes[0]
end

When(/^modify image attributes$/) do
  modify_image_attributes_output = @image_service.modify_image_attributes(
    image: capture_instance_output[:image_id],
    image_name: @modify_image_attributes_configuration[:image_name],
    description: @modify_image_attributes_configuration[:description],
  )
end

Then(/^modify image attributes should be successfull$/) do
  fail unless modify_image_attributes_output[:ret_code] == 0
end

Then(/^modify image attributes should change the image attribuites$/) do
  invoke_with_retry_times(@test_config) do  
    describe_images_output = @image_service.describe_images(images: [capture_instance_output[:image_id]])
    break if describe_images_output[:ret_code] == 0
  end

  image_attributes = describe_images_output[:image_set][0]
  fail if image_attributes[:image_name] != @modify_image_attributes_configuration['image_name'] && image_attributes[:description] != @modify_image_attributes_configuration['description']
end

# ----------------------------------------------------------------------------
gran_image_to_users_output = nil 
When(/^grant image to users$/) do
  gran_image_to_users_output = @image_service.grant_image_to_users(
    image: capture_instance_output[:image_id],
    users: ['usr-WtzWypOT'],
  )
end

Then(/^grant image to users should be successfull$/) do
  fail unless gran_image_to_users_output[:ret_code] == 0
end

# ----------------------------------------------------------------------------
describe_image_users_output = nil 

When(/^describe image users$/) do
  describe_image_users_output = @image_service.describe_image_users(
    image_id: capture_instance_output[:image_id],
  )
end

Then(/^describe image users should be successful$/) do
  fail unless describe_image_users_output[:ret_code] == 0
end

Then(/^describe image users will return the users$/) do
  fail unless describe_image_users_output[:image_user_set][0][:user][:user_id] == 'usr-WtzWypOT'
end

# ----------------------------------------------------------------------------
revoke_image_from_users_output = nil 

When(/^revoke image from users$/) do
  revoke_image_from_users_output = @image_service.revoke_image_from_users(
    image: capture_instance_output[:image_id],
    users: ['usr-WtzWypOT'],
  )
end

Then(/^revoke image from users should be successfull$/) do
  fail unless revoke_image_from_users_output[:ret_code] == 0
end

  
# ----------------------------------------------------------------------------
delete_images_output = nil 

When(/^delete images$/) do
  invoke_with_retry_times(@test_config) do   
    delete_images_output = @image_service.delete_images(
      images: [capture_instance_output[:image_id]],
    )

    break if delete_images_output[:ret_code] == 0
  end
end

Then(/^delete images should get a job ID$/) do
  fail if delete_images_output[:job_id].empty?
end

Then(/^delete images will be finished$/) do
  retries = invoke_with_retry_times(@test_config) do   
    describe_jobs_output = @job_service.describe_jobs(
      jobs: [delete_images_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
  end

  fail if retries == @test_config[:max_retries]
end

# ----------------------------------------------------------------------------

terminate_instances_output = nil

When(/^remove instances$/) do
  invoke_with_retry_times(@test_config) do   
    terminate_instances_output = @instance_service.terminate_instances(
      instances: run_instances_output[:instances],
    )
    break if terminate_instances_output[:ret_code] == 0
  end
end

Then(/^remove instances should get a job ID$/) do
  fail if terminate_instances_output[:job_id].empty?
end







