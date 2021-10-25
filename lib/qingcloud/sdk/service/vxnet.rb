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
    class VxNetService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/vxnet/create_vxnets.html
      def create_vxnets(count: nil, vxnet_name: "", vxnet_type: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "CreateVxnets",
          request_method: "GET",
          request_params: {
            "count" => count,
            "vxnet_name" => vxnet_name,
            "vxnet_type" => vxnet_type, # vxnet_type's available values: 0, 1
          },
        }

        create_vxnets_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vxnet/delete_vxnets.html
      def delete_vxnets(vxnets: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteVxnets",
          request_method: "GET",
          request_params: {
            "vxnets" => vxnets,
          },
        }

        delete_vxnets_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vxnet/describe_vxnet_instances.html
      def describe_vxnet_instances(image: "", instance_type: "", instances: [], limit: nil, offset: nil, status: "", vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeVxnetInstances",
          request_method: "GET",
          request_params: {
            "image" => image,
            "instance_type" => instance_type,
            "instances" => instances,
            "limit" => limit,
            "offset" => offset,
            "status" => status,
            "vxnet" => vxnet,
          },
        }

        describe_vxnet_instances_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vxnet/describe_vxnets.html
      def describe_vxnets(limit: nil, offset: nil, owner: "", project_id: "", search_word: "", tags: [], verbose: nil, vxnet_type: nil, vxnets: [], zone: "")
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeVxnets",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "offset" => offset,
            "owner" => owner,
            "project_id" => project_id,
            "search_word" => search_word,
            "tags" => tags,
            "verbose" => verbose, # verbose's available values: 0, 1
            "vxnet_type" => vxnet_type, # vxnet_type's available values: 0, 1, 2
            "vxnets" => vxnets,
            "zone" => zone,
          },
        }

        describe_vxnets_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vxnet/join_vxnet.html
      def join_vxnet(instances: [], vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "JoinVxnet",
          request_method: "GET",
          request_params: {
            "instances" => instances,
            "vxnet" => vxnet,
          },
        }

        join_vxnet_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vxnet/leave_vxnet.html
      def leave_vxnet(instances: [], vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "LeaveVxnet",
          request_method: "GET",
          request_params: {
            "instances" => instances,
            "vxnet" => vxnet,
          },
        }

        leave_vxnet_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vxnet/modify_vxnet_attributes.html
      def modify_vxnet_attributes(description: "", vxnet: "", vxnet_name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyVxnetAttributes",
          request_method: "GET",
          request_params: {
            "description" => description,
            "vxnet" => vxnet,
            "vxnet_name" => vxnet_name,
          },
        }

        modify_vxnet_attributes_input_validate input

        request = Request.new input
        request.send
      end

      private

      def create_vxnets_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["vxnet_type"].to_s.empty?
          raise ParameterRequiredError.new("vxnet_type", "CreateVxnetsInput")
        end

        unless input["request_params"]["vxnet_type"].to_s.empty?
          vxnet_type_valid_values = ["0", "1"]
          unless vxnet_type_valid_values.include? input["request_params"]["vxnet_type"].to_s
            raise ParameterValueNotAllowedError.new(
              "vxnet_type",
              input["request_params"]["vxnet_type"],
              vxnet_type_valid_values
            )
          end
        end
      end

      def delete_vxnets_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["vxnets"].to_s.empty?
          raise ParameterRequiredError.new("vxnets", "DeleteVxnetsInput")
        end
      end

      def describe_vxnet_instances_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["vxnet"].to_s.empty?
          raise ParameterRequiredError.new("vxnet", "DescribeVxnetInstancesInput")
        end
      end

      def describe_vxnets_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["verbose"].to_s.empty?
          verbose_valid_values = ["0", "1"]
          unless verbose_valid_values.include? input["request_params"]["verbose"].to_s
            raise ParameterValueNotAllowedError.new(
              "verbose",
              input["request_params"]["verbose"],
              verbose_valid_values
            )
          end
        end

        unless input["request_params"]["vxnet_type"].to_s.empty?
          vxnet_type_valid_values = ["0", "1", "2"]
          unless vxnet_type_valid_values.include? input["request_params"]["vxnet_type"].to_s
            raise ParameterValueNotAllowedError.new(
              "vxnet_type",
              input["request_params"]["vxnet_type"],
              vxnet_type_valid_values
            )
          end
        end
      end

      def join_vxnet_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["instances"].to_s.empty?
          raise ParameterRequiredError.new("instances", "JoinVxnetInput")
        end

        if input["request_params"]["vxnet"].to_s.empty?
          raise ParameterRequiredError.new("vxnet", "JoinVxnetInput")
        end
      end

      def leave_vxnet_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["instances"].to_s.empty?
          raise ParameterRequiredError.new("instances", "LeaveVxnetInput")
        end

        if input["request_params"]["vxnet"].to_s.empty?
          raise ParameterRequiredError.new("vxnet", "LeaveVxnetInput")
        end
      end

      def modify_vxnet_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["vxnet"].to_s.empty?
          raise ParameterRequiredError.new("vxnet", "ModifyVxnetAttributesInput")
        end
      end
    end
  end
end
