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
    class AccesskeyService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      def delete_access_keys(access_keys: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteAccessKeys",
          request_method: "GET",
          request_params: {
            "access_keys" => access_keys,
          },
        }

        delete_access_keys_input_validate input

        request = Request.new input
        request.send
      end

      def describe_access_keys(access_keys: [], limit: nil, offset: nil, owner: "", search_word: "", status: [], verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeAccessKeys",
          request_method: "GET",
          request_params: {
            "access_keys" => access_keys,
            "limit" => limit,
            "offset" => offset,
            "owner" => owner,
            "search_word" => search_word,
            "status" => status,
            "verbose" => verbose,
          },
        }

        describe_access_keys_input_validate input

        request = Request.new input
        request.send
      end

      private

      def delete_access_keys_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["access_keys"].to_s.empty?
          raise ParameterRequiredError.new("access_keys", "DeleteAccessKeysInput")
        end
      end

      def describe_access_keys_input_validate(input)
        input.deep_stringify_keys!
      end
    end
  end
end
