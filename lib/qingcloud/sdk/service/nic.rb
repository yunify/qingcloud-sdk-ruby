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
    class NicService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/nic/attach_nics.html
      def attach_nics(instance: "", nics: [])
        input = {
          config: config,
          properties: properties,
          api_name: "AttachNics",
          request_method: "GET",
          request_params: {
            "instance" => instance,
            "nics" => nics,
          },
        }

        attach_nics_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/nic/create_nics.html
      def create_nics(count: nil, nic_name: "", private_ips: [], vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateNics",
          request_method: "GET",
          request_params: {
            "count" => count,
            "nic_name" => nic_name,
            "private_ips" => private_ips,
            "vxnet" => vxnet,
          },
        }

        create_nics_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/nic/delete_nics.html
      def delete_nics(nics: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteNics",
          request_method: "GET",
          request_params: {
            "nics" => nics,
          },
        }

        delete_nics_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/nic/describe_nics.html
      def describe_nics(instances: [], limit: nil, nic_name: "", nics: [], offset: nil, owner: "", project_id: "", status: "", vxnet_type: [], vxnets: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeNics",
          request_method: "GET",
          request_params: {
            "instances" => instances,
            "limit" => limit,
            "nic_name" => nic_name,
            "nics" => nics,
            "offset" => offset,
            "owner" => owner,
            "project_id" => project_id,
            "status" => status, # status's available values: available, in-use
            "vxnet_type" => vxnet_type,
            "vxnets" => vxnets,
          },
        }

        describe_nics_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/nic/detach_nics.html
      def detach_nics(nics: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DetachNics",
          request_method: "GET",
          request_params: {
            "nics" => nics,
          },
        }

        detach_nics_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/nic/modify-nic-attributes.html
      def modify_nic_attributes(nic: "", nic_name: "", private_ip: "", vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyNicAttributes",
          request_method: "GET",
          request_params: {
            "nic" => nic,
            "nic_name" => nic_name,
            "private_ip" => private_ip,
            "vxnet" => vxnet,
          },
        }

        modify_nic_attributes_input_validate input

        request = Request.new input
        request.send
      end

      private

      def attach_nics_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["instance"].to_s.empty?
          raise ParameterRequiredError.new("instance", "AttachNicsInput")
        end

        if input["request_params"]["nics"].to_s.empty?
          raise ParameterRequiredError.new("nics", "AttachNicsInput")
        end
      end

      def create_nics_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["vxnet"].to_s.empty?
          raise ParameterRequiredError.new("vxnet", "CreateNicsInput")
        end
      end

      def delete_nics_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["nics"].to_s.empty?
          raise ParameterRequiredError.new("nics", "DeleteNicsInput")
        end
      end

      def describe_nics_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["status"].to_s.empty?
          status_valid_values = ["available", "in-use"]
          unless status_valid_values.include? input["request_params"]["status"].to_s
            raise ParameterValueNotAllowedError.new(
              "status",
              input["request_params"]["status"],
              status_valid_values
            )
          end
        end
      end

      def detach_nics_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["nics"].to_s.empty?
          raise ParameterRequiredError.new("nics", "DetachNicsInput")
        end
      end

      def modify_nic_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["nic"].to_s.empty?
          raise ParameterRequiredError.new("nic", "ModifyNicAttributesInput")
        end
      end
    end
  end
end
