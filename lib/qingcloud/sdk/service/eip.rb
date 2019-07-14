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
    class EIPService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/eip/allocate_eips.html
      def allocate_eips(bandwidth: nil, billing_mode: "", count: nil, eip_name: "", need_icp: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "AllocateEips",
          request_method: "GET",
          request_params: {
            "bandwidth" => bandwidth,
            "billing_mode" => billing_mode, # billing_mode's available values: bandwidth, traffic
            "count" => count,
            "eip_name" => eip_name,
            "need_icp" => need_icp, # need_icp's available values: 0, 1
          },
        }

        allocate_eips_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/eip/associate_eip.html
      def associate_eip(eip: "", instance: "")
        input = {
          config: config,
          properties: properties,
          api_name: "AssociateEip",
          request_method: "GET",
          request_params: {
            "eip" => eip,
            "instance" => instance,
          },
        }

        associate_eip_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/eip/dissociate_eips.html
      def change_eips_bandwidth(bandwidth: nil, eips: [])
        input = {
          config: config,
          properties: properties,
          api_name: "ChangeEipsBandwidth",
          request_method: "GET",
          request_params: {
            "bandwidth" => bandwidth,
            "eips" => eips,
          },
        }

        change_eips_bandwidth_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/eip/change_eips_billing_mode.html
      def change_eips_billing_mode(billing_mode: "", eip_group: "", eips: [])
        input = {
          config: config,
          properties: properties,
          api_name: "ChangeEipsBillingMode",
          request_method: "GET",
          request_params: {
            "billing_mode" => billing_mode, # billing_mode's available values: bandwidth, traffic
            "eip_group" => eip_group,
            "eips" => eips,
          },
        }

        change_eips_billing_mode_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/eip/describe_eips.html
      def describe_eips(eips: [], instance_id: "", limit: nil, offset: nil, owner: "", project_id: "", search_word: "", status: [], tags: [], verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeEips",
          request_method: "GET",
          request_params: {
            "eips" => eips,
            "instance_id" => instance_id,
            "limit" => limit,
            "offset" => offset,
            "owner" => owner,
            "project_id" => project_id,
            "search_word" => search_word,
            "status" => status,
            "tags" => tags,
            "verbose" => verbose,
          },
        }

        describe_eips_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/eip/dissociate_eips.html
      def dissociate_eips(eips: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DissociateEips",
          request_method: "GET",
          request_params: {
            "eips" => eips,
          },
        }

        dissociate_eips_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/eip/modify_eip_attributes.html
      def modify_eip_attributes(description: "", eip: "", eip_name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyEipAttributes",
          request_method: "GET",
          request_params: {
            "description" => description,
            "eip" => eip,
            "eip_name" => eip_name,
          },
        }

        modify_eip_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/eip/release_eips.html
      def release_eips(eips: [])
        input = {
          config: config,
          properties: properties,
          api_name: "ReleaseEips",
          request_method: "GET",
          request_params: {
            "eips" => eips,
          },
        }

        release_eips_input_validate input

        request = Request.new input
        request.send
      end

      private

      def allocate_eips_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["bandwidth"].to_s.empty?
          raise ParameterRequiredError.new("bandwidth", "AllocateEipsInput")
        end

        unless input["request_params"]["billing_mode"].to_s.empty?
          billing_mode_valid_values = ["bandwidth", "traffic"]
          unless billing_mode_valid_values.include? input["request_params"]["billing_mode"].to_s
            raise ParameterValueNotAllowedError.new(
              "billing_mode",
              input["request_params"]["billing_mode"],
              billing_mode_valid_values
            )
          end
        end

        unless input["request_params"]["need_icp"].to_s.empty?
          need_icp_valid_values = ["0", "1"]
          unless need_icp_valid_values.include? input["request_params"]["need_icp"].to_s
            raise ParameterValueNotAllowedError.new(
              "need_icp",
              input["request_params"]["need_icp"],
              need_icp_valid_values
            )
          end
        end
      end

      def associate_eip_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["eip"].to_s.empty?
          raise ParameterRequiredError.new("eip", "AssociateEipInput")
        end

        if input["request_params"]["instance"].to_s.empty?
          raise ParameterRequiredError.new("instance", "AssociateEipInput")
        end
      end

      def change_eips_bandwidth_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["bandwidth"].to_s.empty?
          raise ParameterRequiredError.new("bandwidth", "ChangeEipsBandwidthInput")
        end

        if input["request_params"]["eips"].to_s.empty?
          raise ParameterRequiredError.new("eips", "ChangeEipsBandwidthInput")
        end
      end

      def change_eips_billing_mode_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["billing_mode"].to_s.empty?
          raise ParameterRequiredError.new("billing_mode", "ChangeEipsBillingModeInput")
        end

        unless input["request_params"]["billing_mode"].to_s.empty?
          billing_mode_valid_values = ["bandwidth", "traffic"]
          unless billing_mode_valid_values.include? input["request_params"]["billing_mode"].to_s
            raise ParameterValueNotAllowedError.new(
              "billing_mode",
              input["request_params"]["billing_mode"],
              billing_mode_valid_values
            )
          end
        end

        if input["request_params"]["eips"].to_s.empty?
          raise ParameterRequiredError.new("eips", "ChangeEipsBillingModeInput")
        end
      end

      def describe_eips_input_validate(input)
        input.deep_stringify_keys!
      end

      def dissociate_eips_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["eips"].to_s.empty?
          raise ParameterRequiredError.new("eips", "DissociateEipsInput")
        end
      end

      def modify_eip_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["eip"].to_s.empty?
          raise ParameterRequiredError.new("eip", "ModifyEipAttributesInput")
        end
      end

      def release_eips_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["eips"].to_s.empty?
          raise ParameterRequiredError.new("eips", "ReleaseEipsInput")
        end
      end
    end
  end
end
