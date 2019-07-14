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
    class KeyPairService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/keypair/attach_key_pairs.html
      def attach_key_pairs(instances: [], keypairs: [])
        input = {
          config: config,
          properties: properties,
          api_name: "AttachKeyPairs",
          request_method: "GET",
          request_params: {
            "instances" => instances,
            "keypairs" => keypairs,
          },
        }

        attach_key_pairs_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/keypair/create_key_pairs.html
      def create_key_pair(encrypt_method: "", keypair_name: "", mode: "", public_key: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateKeyPair",
          request_method: "GET",
          request_params: {
            "encrypt_method" => encrypt_method, # encrypt_method's available values: ssh-rsa, ssh-dss
            "keypair_name" => keypair_name,
            "mode" => mode, # mode's available values: system, user
            "public_key" => public_key,
          },
        }

        create_key_pair_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/keypair/delete_key_pairs.html
      def delete_key_pairs(keypairs: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteKeyPairs",
          request_method: "GET",
          request_params: {
            "keypairs" => keypairs,
          },
        }

        delete_key_pairs_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/keypair/describe_key_pairs.html
      def describe_key_pairs(encrypt_method: "", instance_id: "", keypairs: [], limit: nil, offset: nil, owner: "", project_id: "", search_word: "", tags: [], verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeKeyPairs",
          request_method: "GET",
          request_params: {
            "encrypt_method" => encrypt_method, # encrypt_method's available values: ssh-rsa, ssh-dss
            "instance_id" => instance_id,
            "keypairs" => keypairs,
            "limit" => limit,
            "offset" => offset,
            "owner" => owner,
            "project_id" => project_id,
            "search_word" => search_word,
            "tags" => tags,
            "verbose" => verbose,
          },
        }

        describe_key_pairs_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/keypair/detach_key_pairs.html
      def detach_key_pairs(instances: [], keypairs: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DetachKeyPairs",
          request_method: "GET",
          request_params: {
            "instances" => instances,
            "keypairs" => keypairs,
          },
        }

        detach_key_pairs_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/keypair/modify_key_pair_attributes.html
      def modify_key_pair_attributes(description: "", keypair: "", keypair_name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyKeyPairAttributes",
          request_method: "GET",
          request_params: {
            "description" => description,
            "keypair" => keypair,
            "keypair_name" => keypair_name,
          },
        }

        modify_key_pair_attributes_input_validate input

        request = Request.new input
        request.send
      end

      private

      def attach_key_pairs_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["instances"].to_s.empty?
          raise ParameterRequiredError.new("instances", "AttachKeyPairsInput")
        end

        if input["request_params"]["keypairs"].to_s.empty?
          raise ParameterRequiredError.new("keypairs", "AttachKeyPairsInput")
        end
      end

      def create_key_pair_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["encrypt_method"].to_s.empty?
          encrypt_method_valid_values = ["ssh-rsa", "ssh-dss"]
          unless encrypt_method_valid_values.include? input["request_params"]["encrypt_method"].to_s
            raise ParameterValueNotAllowedError.new(
              "encrypt_method",
              input["request_params"]["encrypt_method"],
              encrypt_method_valid_values
            )
          end
        end

        unless input["request_params"]["mode"].to_s.empty?
          mode_valid_values = ["system", "user"]
          unless mode_valid_values.include? input["request_params"]["mode"].to_s
            raise ParameterValueNotAllowedError.new(
              "mode",
              input["request_params"]["mode"],
              mode_valid_values
            )
          end
        end
      end

      def delete_key_pairs_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["keypairs"].to_s.empty?
          raise ParameterRequiredError.new("keypairs", "DeleteKeyPairsInput")
        end
      end

      def describe_key_pairs_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["encrypt_method"].to_s.empty?
          encrypt_method_valid_values = ["ssh-rsa", "ssh-dss"]
          unless encrypt_method_valid_values.include? input["request_params"]["encrypt_method"].to_s
            raise ParameterValueNotAllowedError.new(
              "encrypt_method",
              input["request_params"]["encrypt_method"],
              encrypt_method_valid_values
            )
          end
        end
      end

      def detach_key_pairs_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["instances"].to_s.empty?
          raise ParameterRequiredError.new("instances", "DetachKeyPairsInput")
        end

        if input["request_params"]["keypairs"].to_s.empty?
          raise ParameterRequiredError.new("keypairs", "DetachKeyPairsInput")
        end
      end

      def modify_key_pair_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["keypair"].to_s.empty?
          raise ParameterRequiredError.new("keypair", "ModifyKeyPairAttributesInput")
        end
      end
    end
  end
end
