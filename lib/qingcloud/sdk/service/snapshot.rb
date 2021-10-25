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
    class SnapshotService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/snapshot/apply_snapshots.html
      def apply_snapshots(snapshots: [])
        input = {
          config: config,
          properties: properties,
          api_name: "ApplySnapshots",
          request_method: "GET",
          request_params: {
            "snapshots" => snapshots,
          },
        }

        apply_snapshots_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/snapshot/capture_instance_from_snapshot.html
      def capture_instance_from_snapshot(image_name: "", snapshot: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CaptureInstanceFromSnapshot",
          request_method: "GET",
          request_params: {
            "image_name" => image_name,
            "snapshot" => snapshot,
          },
        }

        capture_instance_from_snapshot_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/snapshot/create_snapshots.html
      def create_snapshots(is_full: nil, resources: [], service_params: "", snapshot_name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateSnapshots",
          request_method: "GET",
          request_params: {
            "is_full" => is_full, # is_full's available values: 0, 1
            "resources" => resources,
            "service_params" => service_params,
            "snapshot_name" => snapshot_name,
          },
        }

        create_snapshots_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/snapshot/create_volume_from_snapshot.html
      def create_volume_from_snapshot(snapshot: "", volume_name: "", zone: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateVolumeFromSnapshot",
          request_method: "GET",
          request_params: {
            "snapshot" => snapshot,
            "volume_name" => volume_name,
            "zone" => zone,
          },
        }

        create_volume_from_snapshot_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/snapshot/delete_snapshots.html
      def delete_snapshots(snapshots: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteSnapshots",
          request_method: "GET",
          request_params: {
            "snapshots" => snapshots,
          },
        }

        delete_snapshots_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/snapshot/describe_snapshots.html
      def describe_snapshots(limit: nil, offset: nil, owner: "", project_id: "", resource_id: "", search_word: "", snapshot_time: "", snapshot_type: nil, snapshots: [], status: [], tags: [], verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeSnapshots",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "offset" => offset,
            "owner" => owner,
            "project_id" => project_id,
            "resource_id" => resource_id,
            "search_word" => search_word,
            "snapshot_time" => snapshot_time,
            "snapshot_type" => snapshot_type, # snapshot_type's available values: 0, 1
            "snapshots" => snapshots,
            "status" => status,
            "tags" => tags,
            "verbose" => verbose, # verbose's available values: 0, 1
          },
        }

        describe_snapshots_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/snapshot/modify_snapshot_attributes.html
      def modify_snapshot_attributes(description: "", snapshot: "", snapshot_name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifySnapshotAttributes",
          request_method: "GET",
          request_params: {
            "description" => description,
            "snapshot" => snapshot,
            "snapshot_name" => snapshot_name,
          },
        }

        modify_snapshot_attributes_input_validate input

        request = Request.new input
        request.send
      end

      private

      def apply_snapshots_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["snapshots"].to_s.empty?
          raise ParameterRequiredError.new("snapshots", "ApplySnapshotsInput")
        end
      end

      def capture_instance_from_snapshot_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["snapshot"].to_s.empty?
          raise ParameterRequiredError.new("snapshot", "CaptureInstanceFromSnapshotInput")
        end
      end

      def create_snapshots_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["is_full"].to_s.empty?
          is_full_valid_values = ["0", "1"]
          unless is_full_valid_values.include? input["request_params"]["is_full"].to_s
            raise ParameterValueNotAllowedError.new(
              "is_full",
              input["request_params"]["is_full"],
              is_full_valid_values
            )
          end
        end

        if input["request_params"]["resources"].to_s.empty?
          raise ParameterRequiredError.new("resources", "CreateSnapshotsInput")
        end
      end

      def create_volume_from_snapshot_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["snapshot"].to_s.empty?
          raise ParameterRequiredError.new("snapshot", "CreateVolumeFromSnapshotInput")
        end
      end

      def delete_snapshots_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["snapshots"].to_s.empty?
          raise ParameterRequiredError.new("snapshots", "DeleteSnapshotsInput")
        end
      end

      def describe_snapshots_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["snapshot_type"].to_s.empty?
          snapshot_type_valid_values = ["0", "1"]
          unless snapshot_type_valid_values.include? input["request_params"]["snapshot_type"].to_s
            raise ParameterValueNotAllowedError.new(
              "snapshot_type",
              input["request_params"]["snapshot_type"],
              snapshot_type_valid_values
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

      def modify_snapshot_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["snapshot"].to_s.empty?
          raise ParameterRequiredError.new("snapshot", "ModifySnapshotAttributesInput")
        end
      end
    end
  end
end
