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
    class InstanceService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/instance/cease_instances.html
      def cease_instances(instances: [])
        input = {
          config: config,
          properties: properties,
          api_name: "CeaseInstances",
          request_method: "GET",
          request_params: {
            "instances" => instances,
          },
        }

        cease_instances_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/instance/describe_instance_types.html
      def describe_instance_types(instance_types: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeInstanceTypes",
          request_method: "GET",
          request_params: {
            "instance_types" => instance_types,
          },
        }

        describe_instance_types_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/instance/describe_instances.html
      def describe_instances(image_id: [], instance_class: nil, instance_type: [], instances: [], is_cluster_node: nil, limit: nil, offset: nil, owner: "", project_id: "", search_word: "", status: [], tags: [], verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeInstances",
          request_method: "GET",
          request_params: {
            "image_id" => image_id,
            "instance_class" => instance_class, # instance_class's available values: 0, 1
            "instance_type" => instance_type,
            "instances" => instances,
            "is_cluster_node" => is_cluster_node,
            "limit" => limit,
            "offset" => offset,
            "owner" => owner,
            "project_id" => project_id,
            "search_word" => search_word,
            "status" => status,
            "tags" => tags,
            "verbose" => verbose, # verbose's available values: 0, 1
          },
        }

        describe_instances_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/instance/modify_instance_attributes.html
      def modify_instance_attributes(description: "", instance: "", instance_name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyInstanceAttributes",
          request_method: "GET",
          request_params: {
            "description" => description,
            "instance" => instance,
            "instance_name" => instance_name,
          },
        }

        modify_instance_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/instance/reset_instances.html
      def reset_instances(instances: [], login_keypair: "", login_mode: "", login_passwd: "", need_newsid: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "ResetInstances",
          request_method: "GET",
          request_params: {
            "instances" => instances,
            "login_keypair" => login_keypair,
            "login_mode" => login_mode, # login_mode's available values: keypair, passwd
            "login_passwd" => login_passwd,
            "need_newsid" => need_newsid, # need_newsid's available values: 0, 1
          },
        }

        reset_instances_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/instance/resize_instances.html
      def resize_instances(cpu: nil, cpu_model: "", gpu: nil, instance_type: "", instances: [], memory: nil, os_disk_size: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "ResizeInstances",
          request_method: "GET",
          request_params: {
            "cpu" => cpu, # cpu's available values: 1, 2, 4, 8, 16
            "cpu_model" => cpu_model,
            "gpu" => gpu,
            "instance_type" => instance_type,
            "instances" => instances,
            "memory" => memory, # memory's available values: 1024, 2048, 4096, 6144, 8192, 12288, 16384, 24576, 32768
            "os_disk_size" => os_disk_size,
          },
        }

        resize_instances_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/instance/restart_instances.html
      def restart_instances(instances: [])
        input = {
          config: config,
          properties: properties,
          api_name: "RestartInstances",
          request_method: "GET",
          request_params: {
            "instances" => instances,
          },
        }

        restart_instances_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/instance/run_instances.html
      def run_instances(billing_id: "", count: nil, cpu: nil, cpu_max: nil, cpu_model: "", gpu: nil, hostname: "", image_id: "", instance_class: nil, instance_name: "", instance_type: "", login_keypair: "", login_mode: "", login_passwd: "", mem_max: nil, memory: nil, need_newsid: nil, need_userdata: nil, os_disk_size: nil, security_group: "", ui_type: "", userdata_file: "", userdata_path: "", userdata_type: "", userdata_value: "", volumes: [], vxnets: [])
        input = {
          config: config,
          properties: properties,
          api_name: "RunInstances",
          request_method: "GET",
          request_params: {
            "billing_id" => billing_id,
            "count" => count,
            "cpu" => cpu, # cpu's available values: 1, 2, 4, 8, 16
            "cpu_max" => cpu_max, # cpu_max's available values: 1, 2, 4, 8, 16
            "cpu_model" => cpu_model, # cpu_model's available values: Westmere, SandyBridge, IvyBridge, Haswell, Broadwell
            "gpu" => gpu,
            "hostname" => hostname,
            "image_id" => image_id,
            "instance_class" => instance_class, # instance_class's available values: 0, 1, 2, 3, 4, 5, 6, 100, 101, 200, 201, 300, 301
            "instance_name" => instance_name,
            "instance_type" => instance_type,
            "login_keypair" => login_keypair,
            "login_mode" => login_mode, # login_mode's available values: keypair, passwd
            "login_passwd" => login_passwd,
            "mem_max" => mem_max, # mem_max's available values: 1024, 2048, 4096, 6144, 8192, 12288, 16384, 24576, 32768
            "memory" => memory, # memory's available values: 1024, 2048, 4096, 6144, 8192, 12288, 16384, 24576, 32768
            "need_newsid" => need_newsid, # need_newsid's available values: 0, 1
            "need_userdata" => need_userdata, # need_userdata's available values: 0, 1
            "os_disk_size" => os_disk_size,
            "security_group" => security_group,
            "ui_type" => ui_type,
            "userdata_file" => userdata_file,
            "userdata_path" => userdata_path,
            "userdata_type" => userdata_type, # userdata_type's available values: plain, exec, tar
            "userdata_value" => userdata_value,
            "volumes" => volumes,
            "vxnets" => vxnets,
          },
        }

        run_instances_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/instance/start_instances.html
      def start_instances(instances: [])
        input = {
          config: config,
          properties: properties,
          api_name: "StartInstances",
          request_method: "GET",
          request_params: {
            "instances" => instances,
          },
        }

        start_instances_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/instance/stop_instances.html
      def stop_instances(force: nil, instances: [])
        input = {
          config: config,
          properties: properties,
          api_name: "StopInstances",
          request_method: "GET",
          request_params: {
            "force" => force, # force's available values: 0, 1
            "instances" => instances,
          },
        }

        stop_instances_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/instance/terminate_instances.html
      def terminate_instances(instances: [])
        input = {
          config: config,
          properties: properties,
          api_name: "TerminateInstances",
          request_method: "GET",
          request_params: {
            "instances" => instances,
          },
        }

        terminate_instances_input_validate input

        request = Request.new input
        request.send
      end

      private

      def cease_instances_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["instances"].to_s.empty?
          raise ParameterRequiredError.new("instances", "CeaseInstancesInput")
        end
      end

      def describe_instance_types_input_validate(input)
        input.deep_stringify_keys!
      end

      def describe_instances_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["instance_class"].to_s.empty?
          instance_class_valid_values = ["0", "1"]
          unless instance_class_valid_values.include? input["request_params"]["instance_class"].to_s
            raise ParameterValueNotAllowedError.new(
              "instance_class",
              input["request_params"]["instance_class"],
              instance_class_valid_values
            )
          end
        end

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
      end

      def modify_instance_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["instance"].to_s.empty?
          raise ParameterRequiredError.new("instance", "ModifyInstanceAttributesInput")
        end
      end

      def reset_instances_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["instances"].to_s.empty?
          raise ParameterRequiredError.new("instances", "ResetInstancesInput")
        end

        if input["request_params"]["login_mode"].to_s.empty?
          raise ParameterRequiredError.new("login_mode", "ResetInstancesInput")
        end

        unless input["request_params"]["login_mode"].to_s.empty?
          login_mode_valid_values = ["keypair", "passwd"]
          unless login_mode_valid_values.include? input["request_params"]["login_mode"].to_s
            raise ParameterValueNotAllowedError.new(
              "login_mode",
              input["request_params"]["login_mode"],
              login_mode_valid_values
            )
          end
        end

        unless input["request_params"]["need_newsid"].to_s.empty?
          need_newsid_valid_values = ["0", "1"]
          unless need_newsid_valid_values.include? input["request_params"]["need_newsid"].to_s
            raise ParameterValueNotAllowedError.new(
              "need_newsid",
              input["request_params"]["need_newsid"],
              need_newsid_valid_values
            )
          end
        end
      end

      def resize_instances_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["cpu"].to_s.empty?
          cpu_valid_values = ["1", "2", "4", "8", "16"]
          unless cpu_valid_values.include? input["request_params"]["cpu"].to_s
            raise ParameterValueNotAllowedError.new(
              "cpu",
              input["request_params"]["cpu"],
              cpu_valid_values
            )
          end
        end

        if input["request_params"]["instances"].to_s.empty?
          raise ParameterRequiredError.new("instances", "ResizeInstancesInput")
        end

        unless input["request_params"]["memory"].to_s.empty?
          memory_valid_values = ["1024", "2048", "4096", "6144", "8192", "12288", "16384", "24576", "32768"]
          unless memory_valid_values.include? input["request_params"]["memory"].to_s
            raise ParameterValueNotAllowedError.new(
              "memory",
              input["request_params"]["memory"],
              memory_valid_values
            )
          end
        end
      end

      def restart_instances_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["instances"].to_s.empty?
          raise ParameterRequiredError.new("instances", "RestartInstancesInput")
        end
      end

      def run_instances_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["cpu"].to_s.empty?
          cpu_valid_values = ["1", "2", "4", "8", "16"]
          unless cpu_valid_values.include? input["request_params"]["cpu"].to_s
            raise ParameterValueNotAllowedError.new(
              "cpu",
              input["request_params"]["cpu"],
              cpu_valid_values
            )
          end
        end

        unless input["request_params"]["cpu_max"].to_s.empty?
          cpu_max_valid_values = ["1", "2", "4", "8", "16"]
          unless cpu_max_valid_values.include? input["request_params"]["cpu_max"].to_s
            raise ParameterValueNotAllowedError.new(
              "cpu_max",
              input["request_params"]["cpu_max"],
              cpu_max_valid_values
            )
          end
        end

        unless input["request_params"]["cpu_model"].to_s.empty?
          cpu_model_valid_values = ["Westmere", "SandyBridge", "IvyBridge", "Haswell", "Broadwell"]
          unless cpu_model_valid_values.include? input["request_params"]["cpu_model"].to_s
            raise ParameterValueNotAllowedError.new(
              "cpu_model",
              input["request_params"]["cpu_model"],
              cpu_model_valid_values
            )
          end
        end

        if input["request_params"]["image_id"].to_s.empty?
          raise ParameterRequiredError.new("image_id", "RunInstancesInput")
        end

        unless input["request_params"]["instance_class"].to_s.empty?
          instance_class_valid_values = ["0", "1", "2", "3", "4", "5", "6", "100", "101", "200", "201", "300", "301"]
          unless instance_class_valid_values.include? input["request_params"]["instance_class"].to_s
            raise ParameterValueNotAllowedError.new(
              "instance_class",
              input["request_params"]["instance_class"],
              instance_class_valid_values
            )
          end
        end

        if input["request_params"]["login_mode"].to_s.empty?
          raise ParameterRequiredError.new("login_mode", "RunInstancesInput")
        end

        unless input["request_params"]["login_mode"].to_s.empty?
          login_mode_valid_values = ["keypair", "passwd"]
          unless login_mode_valid_values.include? input["request_params"]["login_mode"].to_s
            raise ParameterValueNotAllowedError.new(
              "login_mode",
              input["request_params"]["login_mode"],
              login_mode_valid_values
            )
          end
        end

        unless input["request_params"]["mem_max"].to_s.empty?
          mem_max_valid_values = ["1024", "2048", "4096", "6144", "8192", "12288", "16384", "24576", "32768"]
          unless mem_max_valid_values.include? input["request_params"]["mem_max"].to_s
            raise ParameterValueNotAllowedError.new(
              "mem_max",
              input["request_params"]["mem_max"],
              mem_max_valid_values
            )
          end
        end

        unless input["request_params"]["memory"].to_s.empty?
          memory_valid_values = ["1024", "2048", "4096", "6144", "8192", "12288", "16384", "24576", "32768"]
          unless memory_valid_values.include? input["request_params"]["memory"].to_s
            raise ParameterValueNotAllowedError.new(
              "memory",
              input["request_params"]["memory"],
              memory_valid_values
            )
          end
        end

        unless input["request_params"]["need_newsid"].to_s.empty?
          need_newsid_valid_values = ["0", "1"]
          unless need_newsid_valid_values.include? input["request_params"]["need_newsid"].to_s
            raise ParameterValueNotAllowedError.new(
              "need_newsid",
              input["request_params"]["need_newsid"],
              need_newsid_valid_values
            )
          end
        end

        unless input["request_params"]["need_userdata"].to_s.empty?
          need_userdata_valid_values = ["0", "1"]
          unless need_userdata_valid_values.include? input["request_params"]["need_userdata"].to_s
            raise ParameterValueNotAllowedError.new(
              "need_userdata",
              input["request_params"]["need_userdata"],
              need_userdata_valid_values
            )
          end
        end

        unless input["request_params"]["userdata_type"].to_s.empty?
          userdata_type_valid_values = ["plain", "exec", "tar"]
          unless userdata_type_valid_values.include? input["request_params"]["userdata_type"].to_s
            raise ParameterValueNotAllowedError.new(
              "userdata_type",
              input["request_params"]["userdata_type"],
              userdata_type_valid_values
            )
          end
        end
      end

      def start_instances_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["instances"].to_s.empty?
          raise ParameterRequiredError.new("instances", "StartInstancesInput")
        end
      end

      def stop_instances_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["force"].to_s.empty?
          force_valid_values = ["0", "1"]
          unless force_valid_values.include? input["request_params"]["force"].to_s
            raise ParameterValueNotAllowedError.new(
              "force",
              input["request_params"]["force"],
              force_valid_values
            )
          end
        end

        if input["request_params"]["instances"].to_s.empty?
          raise ParameterRequiredError.new("instances", "StopInstancesInput")
        end
      end

      def terminate_instances_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["instances"].to_s.empty?
          raise ParameterRequiredError.new("instances", "TerminateInstancesInput")
        end
      end
    end
  end
end
