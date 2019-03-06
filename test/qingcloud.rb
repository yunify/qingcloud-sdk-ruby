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

def invoke_scenario(subservice)
  eval <<-SCENARIO
    #{subservice}_service = nil
    When(/^initialize #{subservice} service$/) do
      #{subservice}_service = @qingcloud_service.instance @test_config[:zone]
    end
    
    Then(/^the #{subservice} service is initialized$/) do
      fail if #{subservice}_service == nil
    end
  SCENARIO
end

# ----------------------------------------------------------------------------

When(/^initialize QingCloud service$/) do
  init_qingcloud_service
end

Then(/^the QingCloud service is initialized$/) do
  fail if @qingcloud_service == nil
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

%w(
  app cache cluster dns_alias eip image instance 
  job key_pair load_balancer misc mongo
  monitor nic rdb router security_group 
  shared_storage snapshot tag user_data
  volume vxnet 
).each { |subservice| invoke_scenario(subservice) }
    
