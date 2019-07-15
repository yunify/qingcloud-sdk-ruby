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
    class MongoService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/mongo/add_mongo_instances.html
      def add_mongo_instances(mongo: "", node_count: nil, private_ips: [])
        input = {
          config: config,
          properties: properties,
          api_name: "AddMongoInstances",
          request_method: "GET",
          request_params: {
            "mongo" => mongo,
            "node_count" => node_count,
            "private_ips" => private_ips,
          },
        }

        add_mongo_instances_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/mongo/change_mongo_vxnet.html
      def change_mongo_vxnet(mongo: "", private_ips: [], vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ChangeMongoVxnet",
          request_method: "GET",
          request_params: {
            "mongo" => mongo,
            "private_ips" => private_ips,
            "vxnet" => vxnet,
          },
        }

        change_mongo_vxnet_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/mongo/create_mongo.html
      def create_mongo(auto_backup_time: nil, description: "", mongo_name: "", mongo_password: "", mongo_type: nil, mongo_username: "", mongo_version: "", private_ips: [], resource_class: nil, storage_size: nil, vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateMongo",
          request_method: "GET",
          request_params: {
            "auto_backup_time" => auto_backup_time,
            "description" => description,
            "mongo_name" => mongo_name,
            "mongo_password" => mongo_password,
            "mongo_type" => mongo_type,
            "mongo_username" => mongo_username,
            "mongo_version" => mongo_version,
            "private_ips" => private_ips,
            "resource_class" => resource_class,
            "storage_size" => storage_size,
            "vxnet" => vxnet,
          },
        }

        create_mongo_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/mongo/create_mongo_from_snapshot.html
      def create_mongo_from_snapshot(auto_backup_time: nil, mongo_name: "", mongo_type: nil, mongo_version: nil, resource_class: nil, snapshot: "", storage_size: nil, vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateMongoFromSnapshot",
          request_method: "GET",
          request_params: {
            "auto_backup_time" => auto_backup_time,
            "mongo_name" => mongo_name,
            "mongo_type" => mongo_type,
            "mongo_version" => mongo_version,
            "resource_class" => resource_class,
            "snapshot" => snapshot,
            "storage_size" => storage_size,
            "vxnet" => vxnet,
          },
        }

        create_mongo_from_snapshot_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/mongo/delete_mongos.html
      def delete_mongos(mongos: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteMongos",
          request_method: "GET",
          request_params: {
            "mongos" => mongos,
          },
        }

        delete_mongos_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/mongo/describe_mongo_nodes.html
      def describe_mongo_nodes(limit: nil, mongo: "", offset: nil, status: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeMongoNodes",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "mongo" => mongo,
            "offset" => offset,
            "status" => status,
          },
        }

        describe_mongo_nodes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/mongo/describe_mongo_parameters.html
      def describe_mongo_parameters(limit: nil, mongo: "", offset: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeMongoParameters",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "mongo" => mongo,
            "offset" => offset,
          },
        }

        describe_mongo_parameters_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/mongo/describe_mongos.html
      def describe_mongos(limit: nil, mongo_name: "", mongos: [], offset: nil, project_id: "", status: [], tags: [], verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeMongos",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "mongo_name" => mongo_name,
            "mongos" => mongos,
            "offset" => offset,
            "project_id" => project_id,
            "status" => status,
            "tags" => tags,
            "verbose" => verbose,
          },
        }

        describe_mongos_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/monitor/get_mongo_monitor.html
      def get_mongo_monitor(end_time: "", meters: [], resource: "", start_time: "", step: "")
        input = {
          config: config,
          properties: properties,
          api_name: "GetMongoMonitor",
          request_method: "GET",
          request_params: {
            "end_time" => end_time,
            "meters" => meters,
            "resource" => resource,
            "start_time" => start_time,
            "step" => step, # step's available values: 5m, 15m, 2h, 1d
          },
        }

        get_mongo_monitor_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/mongo/modify_mongo_attributes.html
      def modify_mongo_attributes(auto_backup_time: nil, description: "", mongo: "", mongo_name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyMongoAttributes",
          request_method: "GET",
          request_params: {
            "auto_backup_time" => auto_backup_time,
            "description" => description,
            "mongo" => mongo,
            "mongo_name" => mongo_name,
          },
        }

        modify_mongo_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/mongo/modify_mongo_instances.html
      def modify_mongo_instances(mongo: "", private_ips: [])
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyMongoInstances",
          request_method: "GET",
          request_params: {
            "mongo" => mongo,
            "private_ips" => private_ips,
          },
        }

        modify_mongo_instances_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/mongo/remove_mongo_instances.html
      def remove_mongo_instances(mongo: "", mongo_instances: [])
        input = {
          config: config,
          properties: properties,
          api_name: "RemoveMongoInstances",
          request_method: "GET",
          request_params: {
            "mongo" => mongo,
            "mongo_instances" => mongo_instances,
          },
        }

        remove_mongo_instances_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/mongo/resize_mongos.html
      def resize_mongos(mongo_type: nil, mongos: [], storage_size: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "ResizeMongos",
          request_method: "GET",
          request_params: {
            "mongo_type" => mongo_type,
            "mongos" => mongos,
            "storage_size" => storage_size,
          },
        }

        resize_mongos_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/mongo/start_mongos.html
      def start_mongos(mongos: "")
        input = {
          config: config,
          properties: properties,
          api_name: "StartMongos",
          request_method: "GET",
          request_params: {
            "mongos" => mongos,
          },
        }

        start_mongos_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/mongo/stop_mongos.html
      def stop_mongos(mongos: [])
        input = {
          config: config,
          properties: properties,
          api_name: "StopMongos",
          request_method: "GET",
          request_params: {
            "mongos" => mongos,
          },
        }

        stop_mongos_input_validate input

        request = Request.new input
        request.send
      end

      private

      def add_mongo_instances_input_validate(input)
        input.deep_stringify_keys!

        input["request_params"]["private_ips"].map { |x| }
      end

      def change_mongo_vxnet_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["mongo"].to_s.empty?
          raise ParameterRequiredError.new("mongo", "ChangeMongoVxnetInput")
        end

        input["request_params"]["private_ips"].map { |x| }

        if input["request_params"]["vxnet"].to_s.empty?
          raise ParameterRequiredError.new("vxnet", "ChangeMongoVxnetInput")
        end
      end

      def create_mongo_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["mongo_type"].to_s.empty?
          raise ParameterRequiredError.new("mongo_type", "CreateMongoInput")
        end

        input["request_params"]["private_ips"].map { |x| }

        if input["request_params"]["storage_size"].to_s.empty?
          raise ParameterRequiredError.new("storage_size", "CreateMongoInput")
        end

        if input["request_params"]["vxnet"].to_s.empty?
          raise ParameterRequiredError.new("vxnet", "CreateMongoInput")
        end
      end

      def create_mongo_from_snapshot_input_validate(input)
        input.deep_stringify_keys!
      end

      def delete_mongos_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["mongos"].to_s.empty?
          raise ParameterRequiredError.new("mongos", "DeleteMongosInput")
        end
      end

      def describe_mongo_nodes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["mongo"].to_s.empty?
          raise ParameterRequiredError.new("mongo", "DescribeMongoNodesInput")
        end
      end

      def describe_mongo_parameters_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["mongo"].to_s.empty?
          raise ParameterRequiredError.new("mongo", "DescribeMongoParametersInput")
        end
      end

      def describe_mongos_input_validate(input)
        input.deep_stringify_keys!
      end

      def get_mongo_monitor_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["end_time"].to_s.empty?
          raise ParameterRequiredError.new("end_time", "GetMongoMonitorInput")
        end

        if input["request_params"]["meters"].to_s.empty?
          raise ParameterRequiredError.new("meters", "GetMongoMonitorInput")
        end

        if input["request_params"]["resource"].to_s.empty?
          raise ParameterRequiredError.new("resource", "GetMongoMonitorInput")
        end

        if input["request_params"]["start_time"].to_s.empty?
          raise ParameterRequiredError.new("start_time", "GetMongoMonitorInput")
        end

        if input["request_params"]["step"].to_s.empty?
          raise ParameterRequiredError.new("step", "GetMongoMonitorInput")
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

      def modify_mongo_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["mongo"].to_s.empty?
          raise ParameterRequiredError.new("mongo", "ModifyMongoAttributesInput")
        end
      end

      def modify_mongo_instances_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["mongo"].to_s.empty?
          raise ParameterRequiredError.new("mongo", "ModifyMongoInstancesInput")
        end

        input["request_params"]["private_ips"].map { |x| }
      end

      def remove_mongo_instances_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["mongo"].to_s.empty?
          raise ParameterRequiredError.new("mongo", "RemoveMongoInstancesInput")
        end

        if input["request_params"]["mongo_instances"].to_s.empty?
          raise ParameterRequiredError.new("mongo_instances", "RemoveMongoInstancesInput")
        end
      end

      def resize_mongos_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["mongos"].to_s.empty?
          raise ParameterRequiredError.new("mongos", "ResizeMongosInput")
        end
      end

      def start_mongos_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["mongos"].to_s.empty?
          raise ParameterRequiredError.new("mongos", "StartMongosInput")
        end
      end

      def stop_mongos_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["mongos"].to_s.empty?
          raise ParameterRequiredError.new("mongos", "StopMongosInput")
        end
      end
    end
  end
end
