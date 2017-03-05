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

When(/^initialize QingCloud service$/) do
  init_qingcloud_service
end

Then(/^the QingCloud service is initialized$/) do
  fail if @qingcloud_service == nil
end

# ----------------------------------------------------------------------------

instance_service = nil

When(/^initialize instance service$/) do
  instance_service = @qingcloud_service.instance @test_config[:zone]
end

Then(/^the instance service is initialized$/) do
  fail if instance_service == nil
end

# ----------------------------------------------------------------------------

job_service = nil

When(/^initialize job service$/) do
  job_service = @qingcloud_service.job @test_config[:zone]
end

Then(/^the job service is initialized$/) do
  fail if job_service == nil
end

# ----------------------------------------------------------------------------

When(/^describe zones$/) do
  @describe_zones_output = @qingcloud_service.describe_zones
end

Then(/^describe zones should get (\d+) zone at least$/) do |count|
  fail unless @describe_zones_output[:zone_set].length.to_s >= count
end

Then(/^describe zones should have the zone I'm using$/) do
  ok = false
  @describe_zones_output[:zone_set].each { |z|
    ok = true if z[:zone_id] == @test_config[:zone]
  }
  fail unless ok
end

# ----------------------------------------------------------------------------

run_instances_output = nil

Given(/^instance configuration:$/) do |configuration|
  @run_instance_configuration = configuration.hashes[0]
end

When(/^run instances$/) do
  run_instances_output = instance_service.run_instances(
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
  retries = 0
  while retries < @test_config[:max_retries]
    describe_jobs_output = job_service.describe_jobs(
      jobs: [run_instances_output[:job_id]],
    )
    break if describe_jobs_output[:job_set][0][:status] == 'successful'
    retries += 1
    sleep @test_config[:retry_wait_time]
  end
end

# ----------------------------------------------------------------------------

terminate_instances_output = nil

When(/^terminate instances$/) do
  retries = 0
  while retries < @test_config[:max_retries]
    terminate_instances_output = instance_service.terminate_instances(
      instances: run_instances_output[:instances],
    )
    break true if terminate_instances_output[:ret_code] == 0
    retries += 1
    sleep @test_config[:retry_wait_time]
  end
end

Then(/^terminate instances should get a job ID$/) do
  fail if terminate_instances_output[:job_id].empty?
end

Then(/^terminate instances will be finished$/) do
  retries = 0
  while retries < @test_config[:max_retries]
    describe_jobs_output = job_service.describe_jobs(
      jobs: [terminate_instances_output[:job_id]],
    )
    break true if describe_jobs_output[:job_set][0][:status] == 'successful'
    retries += 1
    sleep @test_config[:retry_wait_time]
  end
end

# ----------------------------------------------------------------------------

When(/^describe jobs$/) do
  @describe_jobs_output = job_service.describe_jobs
end

Then(/^describe jobs should get (\d+) job at least$/) do |count|
  fail unless @describe_jobs_output[:job_set].length.to_s >= count
end

Then(/^describe jobs should have the jobs I just created$/) do
  ok_count = 0
  @describe_jobs_output[:job_set].each { |z|
    ok_count += 1 if z[:job_id] == run_instances_output[:job_id]
    ok_count += 1 if z[:job_id] == terminate_instances_output[:job_id]
  }
  fail unless ok_count == 2
end
