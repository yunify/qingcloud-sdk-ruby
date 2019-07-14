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
    class ProjectService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      def add_project_resource_items(project_id: "", resources: [])
        input = {
          config: config,
          properties: properties,
          api_name: "AddProjectResourceItems",
          request_method: "GET",
          request_params: {
            "project_id" => project_id,
            "resources" => resources,
          },
        }

        add_project_resource_items_input_validate input

        request = Request.new input
        request.send
      end

      def delete_project_resource_items(project_id: [], resources: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteProjectResourceItems",
          request_method: "GET",
          request_params: {
            "project_id" => project_id,
            "resources" => resources,
          },
        }

        delete_project_resource_items_input_validate input

        request = Request.new input
        request.send
      end

      def describe_project_resource_items(in_global: nil, limit: nil, offset: nil, owner: "", project_ids: [], reserve: nil, resource_types: [], resources: [], sort_key: "", verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeProjectResourceItems",
          request_method: "GET",
          request_params: {
            "in_global" => in_global,
            "limit" => limit,
            "offset" => offset,
            "owner" => owner,
            "project_ids" => project_ids,
            "reserve" => reserve,
            "resource_types" => resource_types,
            "resources" => resources,
            "sort_key" => sort_key,
            "verbose" => verbose,
          },
        }

        describe_project_resource_items_input_validate input

        request = Request.new input
        request.send
      end

      def describe_projects(limit: nil, offset: nil, owner: "", project_ids: [], shared: "", status: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeProjects",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "offset" => offset,
            "owner" => owner,
            "project_ids" => project_ids,
            "shared" => shared,
            "status" => status,
          },
        }

        describe_projects_input_validate input

        request = Request.new input
        request.send
      end

      private

      def add_project_resource_items_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["project_id"].to_s.empty?
          raise ParameterRequiredError.new("project_id", "AddProjectResourceItemsInput")
        end

        if input["request_params"]["resources"].to_s.empty?
          raise ParameterRequiredError.new("resources", "AddProjectResourceItemsInput")
        end
      end

      def delete_project_resource_items_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["project_id"].to_s.empty?
          raise ParameterRequiredError.new("project_id", "DeleteProjectResourceItemsInput")
        end

        if input["request_params"]["resources"].to_s.empty?
          raise ParameterRequiredError.new("resources", "DeleteProjectResourceItemsInput")
        end
      end

      def describe_project_resource_items_input_validate(input)
        input.deep_stringify_keys!
      end

      def describe_projects_input_validate(input)
        input.deep_stringify_keys!
      end
    end
  end
end
