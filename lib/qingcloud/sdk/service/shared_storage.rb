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
    class SharedStorageService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/attach_to_s2_shared_target.html
      def attach_to_s2_shared_target(shared_target: "", volumes: [])
        input = {
          config: config,
          properties: properties,
          api_name: "AttachToS2SharedTarget",
          request_method: "GET",
          request_params: {
            "shared_target" => shared_target,
            "volumes" => volumes,
          },
        }

        attach_to_s2_shared_target_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/change_s2_server_vxnet.html
      def change_s2_server_vxnet(private_ip: "", s2_server: "", vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ChangeS2ServerVxnet",
          request_method: "GET",
          request_params: {
            "private_ip" => private_ip,
            "s2_server" => s2_server,
            "vxnet" => vxnet,
          },
        }

        change_s2_server_vxnet_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/create_s2_server.html
      def create_s2_server(description: "", private_ip: "", s2_class: nil, s2_server_name: "", service_type: "", vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateS2Server",
          request_method: "GET",
          request_params: {
            "description" => description,
            "private_ip" => private_ip,
            "s2_class" => s2_class, # s2_class's available values: 0, 1
            "s2_server_name" => s2_server_name,
            "service_type" => service_type,
            "vxnet" => vxnet,
          },
        }

        create_s2_server_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/create_s2_shared_target.html
      def create_s2_shared_target(description: "", export_name: "", export_name_nfs: "", initiator_names: [], s2_group: "", s2_server_id: "", target_type: "", volumes: [])
        input = {
          config: config,
          properties: properties,
          api_name: "CreateS2SharedTarget",
          request_method: "GET",
          request_params: {
            "description" => description,
            "export_name" => export_name,
            "export_name_nfs" => export_name_nfs,
            "initiator_names" => initiator_names,
            "s2_group" => s2_group,
            "s2_server_id" => s2_server_id,
            "target_type" => target_type, # target_type's available values: ISCSI, NFS
            "volumes" => volumes,
          },
        }

        create_s2_shared_target_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/delete_s2_servers.html
      def delete_s2_servers(s2_servers: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteS2Servers",
          request_method: "GET",
          request_params: {
            "s2_servers" => s2_servers,
          },
        }

        delete_s2_servers_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/delete_s2_shared_targets.html
      def delete_s2_shared_targets(shared_targets: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteS2SharedTargets",
          request_method: "GET",
          request_params: {
            "shared_targets" => shared_targets,
          },
        }

        delete_s2_shared_targets_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/describle_s2_default_parameters.html
      def describe_s2_default_parameters(limit: nil, offset: nil, service_type: "", target_type: "")
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeS2DefaultParameters",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "offset" => offset,
            "service_type" => service_type, # service_type's available values: vsan
            "target_type" => target_type, # target_type's available values: ISCSI
          },
        }

        describe_s2_default_parameters_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/describe_s2_servers.html
      def describe_s2_servers(limit: nil, offset: nil, s2_servers: [], search_word: "", status: [], tags: [], verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeS2Servers",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "offset" => offset,
            "s2_servers" => s2_servers,
            "search_word" => search_word,
            "status" => status,
            "tags" => tags,
            "verbose" => verbose,
          },
        }

        describe_s2_servers_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/describe_s2_shared_targets.html
      def describe_s2_shared_targets(limit: nil, offset: nil, s2_server_id: "", search_word: "", shared_targets: [], verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeS2SharedTargets",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "offset" => offset,
            "s2_server_id" => s2_server_id,
            "search_word" => search_word,
            "shared_targets" => shared_targets,
            "verbose" => verbose,
          },
        }

        describe_s2_shared_targets_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/detach_from_s2_shared_target.html
      def detach_from_s2_shared_target(shared_target: "", volumes: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DetachFromS2SharedTarget",
          request_method: "GET",
          request_params: {
            "shared_target" => shared_target,
            "volumes" => volumes,
          },
        }

        detach_from_s2_shared_target_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/disable_s2_shared_targets.html
      def disable_s2_shared_targets(shared_targets: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DisableS2SharedTargets",
          request_method: "GET",
          request_params: {
            "shared_targets" => shared_targets,
          },
        }

        disable_s2_shared_targets_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/enable_s2_shared_targets.html
      def enable_s2_shared_targets(shared_targets: [])
        input = {
          config: config,
          properties: properties,
          api_name: "EnableS2SharedTargets",
          request_method: "GET",
          request_params: {
            "shared_targets" => shared_targets,
          },
        }

        enable_s2_shared_targets_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/modify_s2_server.html
      def modify_s2_server(description: "", s2_server: "", s2_server_name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyS2Server",
          request_method: "GET",
          request_params: {
            "description" => description,
            "s2_server" => s2_server,
            "s2_server_name" => s2_server_name,
          },
        }

        modify_s2_server_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/modify_s2_shared_target.html
      def modify_s2_shared_targets(initiator_names: [], operation: "", parameters: [], shared_targets: [])
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyS2SharedTargets",
          request_method: "GET",
          request_params: {
            "initiator_names" => initiator_names,
            "operation" => operation,
            "parameters" => parameters,
            "shared_targets" => shared_targets,
          },
        }

        modify_s2_shared_targets_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/poweroff_s2_servers.html
      def power_off_s2_servers(s2_servers: "")
        input = {
          config: config,
          properties: properties,
          api_name: "PowerOffS2Servers",
          request_method: "GET",
          request_params: {
            "s2_servers" => s2_servers,
          },
        }

        power_off_s2_servers_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/poweron_s2_servers.html
      def power_on_s2_servers(s2_servers: [])
        input = {
          config: config,
          properties: properties,
          api_name: "PowerOnS2Servers",
          request_method: "GET",
          request_params: {
            "s2_servers" => s2_servers,
          },
        }

        power_on_s2_servers_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/resize_s2_servers.html
      def resize_s2_servers(s2_server: "", s2_server_type: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "ResizeS2Servers",
          request_method: "GET",
          request_params: {
            "s2_server" => s2_server,
            "s2_server_type" => s2_server_type,
          },
        }

        resize_s2_servers_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/vsan/update_s2_servers.html
      def update_s2_servers(s2_servers: [])
        input = {
          config: config,
          properties: properties,
          api_name: "UpdateS2Servers",
          request_method: "GET",
          request_params: {
            "s2_servers" => s2_servers,
          },
        }

        update_s2_servers_input_validate input

        request = Request.new input
        request.send
      end

      private

      def attach_to_s2_shared_target_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["shared_target"].to_s.empty?
          raise ParameterRequiredError.new("shared_target", "AttachToS2SharedTargetInput")
        end

        if input["request_params"]["volumes"].to_s.empty?
          raise ParameterRequiredError.new("volumes", "AttachToS2SharedTargetInput")
        end
      end

      def change_s2_server_vxnet_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["s2_server"].to_s.empty?
          raise ParameterRequiredError.new("s2_server", "ChangeS2ServerVxnetInput")
        end

        if input["request_params"]["vxnet"].to_s.empty?
          raise ParameterRequiredError.new("vxnet", "ChangeS2ServerVxnetInput")
        end
      end

      def create_s2_server_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["s2_class"].to_s.empty?
          s2_class_valid_values = ["0", "1"]
          unless s2_class_valid_values.include? input["request_params"]["s2_class"].to_s
            raise ParameterValueNotAllowedError.new(
              "s2_class",
              input["request_params"]["s2_class"],
              s2_class_valid_values
            )
          end
        end
      end

      def create_s2_shared_target_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["export_name"].to_s.empty?
          raise ParameterRequiredError.new("export_name", "CreateS2SharedTargetInput")
        end

        if input["request_params"]["s2_server_id"].to_s.empty?
          raise ParameterRequiredError.new("s2_server_id", "CreateS2SharedTargetInput")
        end

        if input["request_params"]["target_type"].to_s.empty?
          raise ParameterRequiredError.new("target_type", "CreateS2SharedTargetInput")
        end

        unless input["request_params"]["target_type"].to_s.empty?
          target_type_valid_values = ["ISCSI", "NFS"]
          unless target_type_valid_values.include? input["request_params"]["target_type"].to_s
            raise ParameterValueNotAllowedError.new(
              "target_type",
              input["request_params"]["target_type"],
              target_type_valid_values
            )
          end
        end
      end

      def delete_s2_servers_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["s2_servers"].to_s.empty?
          raise ParameterRequiredError.new("s2_servers", "DeleteS2ServersInput")
        end
      end

      def delete_s2_shared_targets_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["shared_targets"].to_s.empty?
          raise ParameterRequiredError.new("shared_targets", "DeleteS2SharedTargetsInput")
        end
      end

      def describe_s2_default_parameters_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["service_type"].to_s.empty?
          service_type_valid_values = ["vsan"]
          unless service_type_valid_values.include? input["request_params"]["service_type"].to_s
            raise ParameterValueNotAllowedError.new(
              "service_type",
              input["request_params"]["service_type"],
              service_type_valid_values
            )
          end
        end

        unless input["request_params"]["target_type"].to_s.empty?
          target_type_valid_values = ["ISCSI"]
          unless target_type_valid_values.include? input["request_params"]["target_type"].to_s
            raise ParameterValueNotAllowedError.new(
              "target_type",
              input["request_params"]["target_type"],
              target_type_valid_values
            )
          end
        end
      end

      def describe_s2_servers_input_validate(input)
        input.deep_stringify_keys!
      end

      def describe_s2_shared_targets_input_validate(input)
        input.deep_stringify_keys!
      end

      def detach_from_s2_shared_target_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["shared_target"].to_s.empty?
          raise ParameterRequiredError.new("shared_target", "DetachFromS2SharedTargetInput")
        end

        if input["request_params"]["volumes"].to_s.empty?
          raise ParameterRequiredError.new("volumes", "DetachFromS2SharedTargetInput")
        end
      end

      def disable_s2_shared_targets_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["shared_targets"].to_s.empty?
          raise ParameterRequiredError.new("shared_targets", "DisableS2SharedTargetsInput")
        end
      end

      def enable_s2_shared_targets_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["shared_targets"].to_s.empty?
          raise ParameterRequiredError.new("shared_targets", "EnableS2SharedTargetsInput")
        end
      end

      def modify_s2_server_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["s2_server"].to_s.empty?
          raise ParameterRequiredError.new("s2_server", "ModifyS2ServerInput")
        end
      end

      def modify_s2_shared_targets_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["operation"].to_s.empty?
          raise ParameterRequiredError.new("operation", "ModifyS2SharedTargetsInput")
        end

        if input["request_params"]["parameters"].to_s.empty?
          raise ParameterRequiredError.new("parameters", "ModifyS2SharedTargetsInput")
        end

        if input["request_params"]["shared_targets"].to_s.empty?
          raise ParameterRequiredError.new("shared_targets", "ModifyS2SharedTargetsInput")
        end
      end

      def power_off_s2_servers_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["s2_servers"].to_s.empty?
          raise ParameterRequiredError.new("s2_servers", "PowerOffS2ServersInput")
        end
      end

      def power_on_s2_servers_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["s2_servers"].to_s.empty?
          raise ParameterRequiredError.new("s2_servers", "PowerOnS2ServersInput")
        end
      end

      def resize_s2_servers_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["s2_server"].to_s.empty?
          raise ParameterRequiredError.new("s2_server", "ResizeS2ServersInput")
        end

        if input["request_params"]["s2_server_type"].to_s.empty?
          raise ParameterRequiredError.new("s2_server_type", "ResizeS2ServersInput")
        end
      end

      def update_s2_servers_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["s2_servers"].to_s.empty?
          raise ParameterRequiredError.new("s2_servers", "UpdateS2ServersInput")
        end
      end
    end
  end
end
