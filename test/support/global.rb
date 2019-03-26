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

require 'yaml'

require 'qingcloud/sdk'

module QingCloudWorld
  def load_test_config
    @test_config = YAML.load_file './test_config.yaml'
    @test_config[:zone] = @test_config['zone']
    @test_config[:retry_wait_time] = @test_config['retry_wait_time']
    @test_config[:max_retries] = @test_config['max_retries']
  end

  def load_config
    @config = QingCloud::SDK::Config.new.load_config_from_file './config.yaml'
  end

  def init_qingcloud_service
    @qingcloud_service = QingCloud::SDK::QingCloudService.new @config
  end

  def invoke_with_retry_times(test_config)
    retries = 0
    while retries < test_config[:max_retries]
      yield
      retries += 1
      sleep test_config[:retry_wait_time]
    end 
  
    retries
  end
end

World(QingCloudWorld)
