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
    class CacheService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/add_cache_nodes.html
      def add_cache_nodes(cache: "", node_count: nil, private_ips: [])
        input = {
          config: config,
          properties: properties,
          api_name: "AddCacheNodes",
          request_method: "GET",
          request_params: {
            "cache" => cache,
            "node_count" => node_count,
            "private_ips" => private_ips,
          },
        }

        add_cache_nodes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/apply_cache_parameter_group.html
      def apply_cache_parameter_group(cache_parameter_group: "", caches: [])
        input = {
          config: config,
          properties: properties,
          api_name: "ApplyCacheParameterGroup",
          request_method: "GET",
          request_params: {
            "cache_parameter_group" => cache_parameter_group,
            "caches" => caches,
          },
        }

        apply_cache_parameter_group_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/change_cache_vxnet.html
      def change_cache_vxnet(cache: "", private_ips: [], vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ChangeCacheVxnet",
          request_method: "GET",
          request_params: {
            "cache" => cache,
            "private_ips" => private_ips,
            "vxnet" => vxnet,
          },
        }

        change_cache_vxnet_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/create_cache.html
      def create_cache(auto_backup_time: nil, cache_class: nil, cache_name: "", cache_parameter_group: "", cache_size: nil, cache_type: "", master_count: nil, network_type: nil, node_count: nil, private_ips: [], replicate_count: nil, vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateCache",
          request_method: "GET",
          request_params: {
            "auto_backup_time" => auto_backup_time,
            "cache_class" => cache_class, # cache_class's available values: 0, 1
            "cache_name" => cache_name,
            "cache_parameter_group" => cache_parameter_group,
            "cache_size" => cache_size,
            "cache_type" => cache_type,
            "master_count" => master_count,
            "network_type" => network_type,
            "node_count" => node_count,
            "private_ips" => private_ips,
            "replicate_count" => replicate_count,
            "vxnet" => vxnet,
          },
        }

        create_cache_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/create_cache_from_snapshot.html
      def create_cache_from_snapshot(auto_backup_time: nil, cache_class: nil, cache_name: "", cache_parameter_group: "", cache_size: nil, cache_type: "", network_type: nil, node_count: nil, private_ips: [], snapshot: "", vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateCacheFromSnapshot",
          request_method: "GET",
          request_params: {
            "auto_backup_time" => auto_backup_time,
            "cache_class" => cache_class, # cache_class's available values: 0, 1
            "cache_name" => cache_name,
            "cache_parameter_group" => cache_parameter_group,
            "cache_size" => cache_size,
            "cache_type" => cache_type,
            "network_type" => network_type,
            "node_count" => node_count,
            "private_ips" => private_ips,
            "snapshot" => snapshot,
            "vxnet" => vxnet,
          },
        }

        create_cache_from_snapshot_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/create_cache_parameter_group.html
      def create_cache_parameter_group(cache_parameter_group_name: "", cache_type: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateCacheParameterGroup",
          request_method: "GET",
          request_params: {
            "cache_parameter_group_name" => cache_parameter_group_name,
            "cache_type" => cache_type, # cache_type's available values: redis2.8.17, memcached1.4.13
          },
        }

        create_cache_parameter_group_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/delete_cache_nodes.html
      def delete_cache_nodes(cache: "", cache_nodes: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteCacheNodes",
          request_method: "GET",
          request_params: {
            "cache" => cache,
            "cache_nodes" => cache_nodes,
          },
        }

        delete_cache_nodes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/delete_cache_parameter_groups.html
      def delete_cache_parameter_groups(cache_parameter_groups: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteCacheParameterGroups",
          request_method: "GET",
          request_params: {
            "cache_parameter_groups" => cache_parameter_groups,
          },
        }

        delete_cache_parameter_groups_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/delete_caches.html
      def delete_caches(caches: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteCaches",
          request_method: "GET",
          request_params: {
            "caches" => caches,
          },
        }

        delete_caches_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/describe_cache_nodes.html
      def describe_cache_nodes(cache: "", cache_nodes: [], limit: nil, offset: nil, search_word: "", status: [], verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeCacheNodes",
          request_method: "GET",
          request_params: {
            "cache" => cache,
            "cache_nodes" => cache_nodes,
            "limit" => limit,
            "offset" => offset,
            "search_word" => search_word,
            "status" => status,
            "verbose" => verbose,
          },
        }

        describe_cache_nodes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/describe_cache_parameter_groups.html
      def describe_cache_parameter_groups(cache_parameter_groups: [], cache_type: "", limit: nil, offset: nil, search_word: "", verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeCacheParameterGroups",
          request_method: "GET",
          request_params: {
            "cache_parameter_groups" => cache_parameter_groups,
            "cache_type" => cache_type,
            "limit" => limit,
            "offset" => offset,
            "search_word" => search_word,
            "verbose" => verbose,
          },
        }

        describe_cache_parameter_groups_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/describe_cache_parameters.html
      def describe_cache_parameters(cache_parameter_group: "", verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeCacheParameters",
          request_method: "GET",
          request_params: {
            "cache_parameter_group" => cache_parameter_group,
            "verbose" => verbose,
          },
        }

        describe_cache_parameters_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/describe_caches.html
      def describe_caches(cache_type: [], caches: [], limit: nil, offset: nil, project_id: "", search_word: "", status: [], tags: [], verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeCaches",
          request_method: "GET",
          request_params: {
            "cache_type" => cache_type,
            "caches" => caches,
            "limit" => limit,
            "offset" => offset,
            "project_id" => project_id,
            "search_word" => search_word,
            "status" => status,
            "tags" => tags,
            "verbose" => verbose,
          },
        }

        describe_caches_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/monitor/get_cache_monitor.html
      def get_cache_monitor(end_time: "", meters: [], resource: "", start_time: "", step: "")
        input = {
          config: config,
          properties: properties,
          api_name: "GetCacheMonitor",
          request_method: "GET",
          request_params: {
            "end_time" => end_time,
            "meters" => meters,
            "resource" => resource,
            "start_time" => start_time,
            "step" => step, # step's available values: 5m, 15m, 2h, 1d
          },
        }

        get_cache_monitor_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/modify_cache_attributes.html
      def modify_cache_attributes(auto_backup_time: nil, cache: "", cache_name: "", description: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyCacheAttributes",
          request_method: "GET",
          request_params: {
            "auto_backup_time" => auto_backup_time,
            "cache" => cache,
            "cache_name" => cache_name,
            "description" => description,
          },
        }

        modify_cache_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/modify_cache_node_attributes.html
      def modify_cache_node_attributes(cache_node: "", cache_node_name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyCacheNodeAttributes",
          request_method: "GET",
          request_params: {
            "cache_node" => cache_node,
            "cache_node_name" => cache_node_name,
          },
        }

        modify_cache_node_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/modify_cache_parameter_group_attributes.html
      def modify_cache_parameter_group_attributes(cache_parameter_group: "", cache_parameter_group_name: "", description: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyCacheParameterGroupAttributes",
          request_method: "GET",
          request_params: {
            "cache_parameter_group" => cache_parameter_group,
            "cache_parameter_group_name" => cache_parameter_group_name,
            "description" => description,
          },
        }

        modify_cache_parameter_group_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/reset_cache_parameters.html
      def reset_cache_parameters(cache_parameter_group: "", cache_parameter_names: [])
        input = {
          config: config,
          properties: properties,
          api_name: "ResetCacheParameters",
          request_method: "GET",
          request_params: {
            "cache_parameter_group" => cache_parameter_group,
            "cache_parameter_names" => cache_parameter_names,
          },
        }

        reset_cache_parameters_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/resize_cache.html
      def resize_caches(cache_size: nil, caches: [])
        input = {
          config: config,
          properties: properties,
          api_name: "ResizeCaches",
          request_method: "GET",
          request_params: {
            "cache_size" => cache_size,
            "caches" => caches,
          },
        }

        resize_caches_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/restart_cache_nodes.html
      def restart_cache_nodes(cache: "", cache_nodes: [])
        input = {
          config: config,
          properties: properties,
          api_name: "RestartCacheNodes",
          request_method: "GET",
          request_params: {
            "cache" => cache,
            "cache_nodes" => cache_nodes,
          },
        }

        restart_cache_nodes_input_validate input

        request = Request.new input
        request.send
      end

      # restart_caches: Only available for memcached.
      # Documentation URL: https://docs.qingcloud.com/api/cache/restart_caches.html
      def restart_caches(caches: [])
        input = {
          config: config,
          properties: properties,
          api_name: "RestartCaches",
          request_method: "GET",
          request_params: {
            "caches" => caches,
          },
        }

        restart_caches_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/start_caches.html
      def start_caches(caches: [])
        input = {
          config: config,
          properties: properties,
          api_name: "StartCaches",
          request_method: "GET",
          request_params: {
            "caches" => caches,
          },
        }

        start_caches_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/stop_caches.html
      def stop_caches(caches: [])
        input = {
          config: config,
          properties: properties,
          api_name: "StopCaches",
          request_method: "GET",
          request_params: {
            "caches" => caches,
          },
        }

        stop_caches_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/update_cache.html
      def update_cache(cache: "", private_ips: [])
        input = {
          config: config,
          properties: properties,
          api_name: "UpdateCache",
          request_method: "GET",
          request_params: {
            "cache" => cache,
            "private_ips" => private_ips,
          },
        }

        update_cache_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cache/update_cache_parameters.html
      def update_cache_parameters(cache_parameter_group: "", parameters: [])
        input = {
          config: config,
          properties: properties,
          api_name: "UpdateCacheParameters",
          request_method: "GET",
          request_params: {
            "cache_parameter_group" => cache_parameter_group,
            "parameters" => parameters,
          },
        }

        update_cache_parameters_input_validate input

        request = Request.new input
        request.send
      end

      private

      def add_cache_nodes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cache"].to_s.empty?
          raise ParameterRequiredError.new("cache", "AddCacheNodesInput")
        end

        if input["request_params"]["node_count"].to_s.empty?
          raise ParameterRequiredError.new("node_count", "AddCacheNodesInput")
        end

        input["request_params"]["private_ips"].map { |x|
          unless x["cache_role"].to_s.empty?
            cache_role_valid_values = ["master", "slave"]
            unless cache_role_valid_values.include? x["cache_role"].to_s
              raise ParameterValueNotAllowedError.new(
                "cache_role",
                x["cache_role"],
                cache_role_valid_values
              )
            end
          end
        }
      end

      def apply_cache_parameter_group_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cache_parameter_group"].to_s.empty?
          raise ParameterRequiredError.new("cache_parameter_group", "ApplyCacheParameterGroupInput")
        end
      end

      def change_cache_vxnet_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cache"].to_s.empty?
          raise ParameterRequiredError.new("cache", "ChangeCacheVxnetInput")
        end

        input["request_params"]["private_ips"].map { |x|
          unless x["cache_role"].to_s.empty?
            cache_role_valid_values = ["master", "slave"]
            unless cache_role_valid_values.include? x["cache_role"].to_s
              raise ParameterValueNotAllowedError.new(
                "cache_role",
                x["cache_role"],
                cache_role_valid_values
              )
            end
          end
        }

        if input["request_params"]["vxnet"].to_s.empty?
          raise ParameterRequiredError.new("vxnet", "ChangeCacheVxnetInput")
        end
      end

      def create_cache_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["cache_class"].to_s.empty?
          cache_class_valid_values = ["0", "1"]
          unless cache_class_valid_values.include? input["request_params"]["cache_class"].to_s
            raise ParameterValueNotAllowedError.new(
              "cache_class",
              input["request_params"]["cache_class"],
              cache_class_valid_values
            )
          end
        end

        if input["request_params"]["cache_size"].to_s.empty?
          raise ParameterRequiredError.new("cache_size", "CreateCacheInput")
        end

        if input["request_params"]["cache_type"].to_s.empty?
          raise ParameterRequiredError.new("cache_type", "CreateCacheInput")
        end

        input["request_params"]["private_ips"].map { |x|
          unless x["cache_role"].to_s.empty?
            cache_role_valid_values = ["master", "slave"]
            unless cache_role_valid_values.include? x["cache_role"].to_s
              raise ParameterValueNotAllowedError.new(
                "cache_role",
                x["cache_role"],
                cache_role_valid_values
              )
            end
          end
        }

        if input["request_params"]["vxnet"].to_s.empty?
          raise ParameterRequiredError.new("vxnet", "CreateCacheInput")
        end
      end

      def create_cache_from_snapshot_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["cache_class"].to_s.empty?
          cache_class_valid_values = ["0", "1"]
          unless cache_class_valid_values.include? input["request_params"]["cache_class"].to_s
            raise ParameterValueNotAllowedError.new(
              "cache_class",
              input["request_params"]["cache_class"],
              cache_class_valid_values
            )
          end
        end

        input["request_params"]["private_ips"].map { |x|
          unless x["cache_role"].to_s.empty?
            cache_role_valid_values = ["master", "slave"]
            unless cache_role_valid_values.include? x["cache_role"].to_s
              raise ParameterValueNotAllowedError.new(
                "cache_role",
                x["cache_role"],
                cache_role_valid_values
              )
            end
          end
        }

        if input["request_params"]["snapshot"].to_s.empty?
          raise ParameterRequiredError.new("snapshot", "CreateCacheFromSnapshotInput")
        end

        if input["request_params"]["vxnet"].to_s.empty?
          raise ParameterRequiredError.new("vxnet", "CreateCacheFromSnapshotInput")
        end
      end

      def create_cache_parameter_group_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cache_type"].to_s.empty?
          raise ParameterRequiredError.new("cache_type", "CreateCacheParameterGroupInput")
        end

        unless input["request_params"]["cache_type"].to_s.empty?
          cache_type_valid_values = ["redis2.8.17", "memcached1.4.13"]
          unless cache_type_valid_values.include? input["request_params"]["cache_type"].to_s
            raise ParameterValueNotAllowedError.new(
              "cache_type",
              input["request_params"]["cache_type"],
              cache_type_valid_values
            )
          end
        end
      end

      def delete_cache_nodes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cache"].to_s.empty?
          raise ParameterRequiredError.new("cache", "DeleteCacheNodesInput")
        end

        if input["request_params"]["cache_nodes"].to_s.empty?
          raise ParameterRequiredError.new("cache_nodes", "DeleteCacheNodesInput")
        end
      end

      def delete_cache_parameter_groups_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cache_parameter_groups"].to_s.empty?
          raise ParameterRequiredError.new("cache_parameter_groups", "DeleteCacheParameterGroupsInput")
        end
      end

      def delete_caches_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["caches"].to_s.empty?
          raise ParameterRequiredError.new("caches", "DeleteCachesInput")
        end
      end

      def describe_cache_nodes_input_validate(input)
        input.deep_stringify_keys!
      end

      def describe_cache_parameter_groups_input_validate(input)
        input.deep_stringify_keys!
      end

      def describe_cache_parameters_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cache_parameter_group"].to_s.empty?
          raise ParameterRequiredError.new("cache_parameter_group", "DescribeCacheParametersInput")
        end
      end

      def describe_caches_input_validate(input)
        input.deep_stringify_keys!
      end

      def get_cache_monitor_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["end_time"].to_s.empty?
          raise ParameterRequiredError.new("end_time", "GetCacheMonitorInput")
        end

        if input["request_params"]["meters"].to_s.empty?
          raise ParameterRequiredError.new("meters", "GetCacheMonitorInput")
        end

        if input["request_params"]["resource"].to_s.empty?
          raise ParameterRequiredError.new("resource", "GetCacheMonitorInput")
        end

        if input["request_params"]["start_time"].to_s.empty?
          raise ParameterRequiredError.new("start_time", "GetCacheMonitorInput")
        end

        if input["request_params"]["step"].to_s.empty?
          raise ParameterRequiredError.new("step", "GetCacheMonitorInput")
        end

        unless input["request_params"]["step"].to_s.empty?
          step_valid_values = ["5m", "15m", "2h", "1d"]
          unless step_valid_values.include? input["request_params"]["step"].to_s
            raise ParameterValueNotAllowedError.new(
              "step",
              input["request_params"]["step"],
              step_valid_values
            )
          end
        end
      end

      def modify_cache_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cache"].to_s.empty?
          raise ParameterRequiredError.new("cache", "ModifyCacheAttributesInput")
        end
      end

      def modify_cache_node_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cache_node"].to_s.empty?
          raise ParameterRequiredError.new("cache_node", "ModifyCacheNodeAttributesInput")
        end
      end

      def modify_cache_parameter_group_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cache_parameter_group"].to_s.empty?
          raise ParameterRequiredError.new("cache_parameter_group", "ModifyCacheParameterGroupAttributesInput")
        end
      end

      def reset_cache_parameters_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cache_parameter_group"].to_s.empty?
          raise ParameterRequiredError.new("cache_parameter_group", "ResetCacheParametersInput")
        end
      end

      def resize_caches_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cache_size"].to_s.empty?
          raise ParameterRequiredError.new("cache_size", "ResizeCachesInput")
        end

        if input["request_params"]["caches"].to_s.empty?
          raise ParameterRequiredError.new("caches", "ResizeCachesInput")
        end
      end

      def restart_cache_nodes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cache"].to_s.empty?
          raise ParameterRequiredError.new("cache", "RestartCacheNodesInput")
        end

        if input["request_params"]["cache_nodes"].to_s.empty?
          raise ParameterRequiredError.new("cache_nodes", "RestartCacheNodesInput")
        end
      end

      def restart_caches_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["caches"].to_s.empty?
          raise ParameterRequiredError.new("caches", "RestartCachesInput")
        end
      end

      def start_caches_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["caches"].to_s.empty?
          raise ParameterRequiredError.new("caches", "StartCachesInput")
        end
      end

      def stop_caches_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["caches"].to_s.empty?
          raise ParameterRequiredError.new("caches", "StopCachesInput")
        end
      end

      def update_cache_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cache"].to_s.empty?
          raise ParameterRequiredError.new("cache", "UpdateCacheInput")
        end

        input["request_params"]["private_ips"].map { |x|
          unless x["cache_role"].to_s.empty?
            cache_role_valid_values = ["master", "slave"]
            unless cache_role_valid_values.include? x["cache_role"].to_s
              raise ParameterValueNotAllowedError.new(
                "cache_role",
                x["cache_role"],
                cache_role_valid_values
              )
            end
          end
        }
      end

      def update_cache_parameters_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cache_parameter_group"].to_s.empty?
          raise ParameterRequiredError.new("cache_parameter_group", "UpdateCacheParametersInput")
        end

        unless input["request_params"]["parameters"].nil?
          if input["request_params"]["parameters"]["cache_parameter_name"].to_s.empty?
            raise ParameterRequiredError.new("cache_parameter_name", "cache_parameter")
          end

          if input["request_params"]["parameters"]["cache_parameter_value"].to_s.empty?
            raise ParameterRequiredError.new("cache_parameter_value", "cache_parameter")
          end

          unless input["request_params"]["parameters"]["is_readonly"].to_s.empty?
            is_readonly_valid_values = ["0", "1"]
            unless is_readonly_valid_values.include? input["request_params"]["parameters"]["is_readonly"].to_s
              raise ParameterValueNotAllowedError.new(
                "is_readonly",
                input["request_params"]["parameters"]["is_readonly"],
                is_readonly_valid_values
              )
            end
          end
        end

        if input["request_params"]["parameters"].nil?
          raise ParameterRequiredError.new("parameters", "UpdateCacheParametersInput")
        end
      end
    end
  end
end
