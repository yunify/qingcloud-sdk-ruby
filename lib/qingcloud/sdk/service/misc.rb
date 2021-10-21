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

require "active_support/core_ext/hash/keys"

module QingCloud
  module SDK
    class MiscService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/product/api/action/misc/get_quota_left.html
      def get_quota_left(resource_types: [], zone: "")
        input = {
          config: config,
          properties: properties,
          api_name: "GetQuotaLeft",
          request_method: "GET",
          request_params: {
            "resource_types" => resource_types,
            "zone" => zone,
          },
        }

        get_quota_left_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/product/api/action/misc
      def get_resource_limit(volume_type: nil, zone: "")
        input = {
          config: config,
          properties: properties,
          api_name: "GetResourceLimit",
          request_method: "GET",
          request_params: {
            "volume_type" => volume_type,
            "zone" => zone,
          },
        }

        get_resource_limit_input_validate input

        request = Request.new input
        request.send
      end

      private

      def get_quota_left_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["zone"].to_s.empty?
          raise ParameterRequiredError.new("zone", "GetQuotaLeftInput")
        end
      end

      def get_resource_limit_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["zone"].to_s.empty?
          raise ParameterRequiredError.new("zone", "GetResourceLimitInput")
        end
      end
    end
  end
end
