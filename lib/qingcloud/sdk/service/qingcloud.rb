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

require 'active_support/core_ext/hash/keys'

module QingCloud
  module SDK
    # QingCloud provides QingCloud Service API (API Version 2013-08-30)
    class QingCloudService
      attr_accessor :config, :properties

      def initialize(config)
        self.config     = config
        self.properties = {
        }
      end

      # Documentation URL: https://docs.qingcloud.com/api/zone/describe_zones.html
      def describe_zones(status: [], zones: [])
        input = {
          config:         config,
          properties:     properties,
          api_name:       'DescribeZones',
          request_method: 'GET',
          request_params: {
            'status' => status,
            'zones'  => zones,
          },
        }

        describe_zones_input_validate input

        request = Request.new input
        request.send
      end

      private

      def describe_zones_input_validate(input)
        input.deep_stringify_keys!
      end

      public

      def cache(zone)
        properties = {
          'zone' => zone,
        }
        CacheService.new(config, self.properties.merge(properties))
      end

      def dns_alias(zone)
        properties = {
          'zone' => zone,
        }
        DNSAliasService.new(config, self.properties.merge(properties))
      end

      def eip(zone)
        properties = {
          'zone' => zone,
        }
        EIPService.new(config, self.properties.merge(properties))
      end

      def image(zone)
        properties = {
          'zone' => zone,
        }
        ImageService.new(config, self.properties.merge(properties))
      end

      def instance(zone)
        properties = {
          'zone' => zone,
        }
        InstanceService.new(config, self.properties.merge(properties))
      end

      def job(zone)
        properties = {
          'zone' => zone,
        }
        JobService.new(config, self.properties.merge(properties))
      end

      def key_pair(zone)
        properties = {
          'zone' => zone,
        }
        KeyPairService.new(config, self.properties.merge(properties))
      end

      def load_balancer(zone)
        properties = {
          'zone' => zone,
        }
        LoadBalancerService.new(config, self.properties.merge(properties))
      end

      def mongo(zone)
        properties = {
          'zone' => zone,
        }
        MongoService.new(config, self.properties.merge(properties))
      end

      def rdb(zone)
        properties = {
          'zone' => zone,
        }
        RDBService.new(config, self.properties.merge(properties))
      end

      def router(zone)
        properties = {
          'zone' => zone,
        }
        RouterService.new(config, self.properties.merge(properties))
      end

      def security_group(zone)
        properties = {
          'zone' => zone,
        }
        SecurityGroupService.new(config, self.properties.merge(properties))
      end

      def shared_storage(zone)
        properties = {
          'zone' => zone,
        }
        SharedStorageService.new(config, self.properties.merge(properties))
      end

      def snapshot(zone)
        properties = {
          'zone' => zone,
        }
        SnapshotService.new(config, self.properties.merge(properties))
      end

      def tag(zone)
        properties = {
          'zone' => zone,
        }
        TagService.new(config, self.properties.merge(properties))
      end

      def user_data(zone)
        properties = {
          'zone' => zone,
        }
        UserDataService.new(config, self.properties.merge(properties))
      end

      def volume(zone)
        properties = {
          'zone' => zone,
        }
        VolumeService.new(config, self.properties.merge(properties))
      end

      def vxnet(zone)
        properties = {
          'zone' => zone,
        }
        VxNetService.new(config, self.properties.merge(properties))
      end
    end
  end
end
