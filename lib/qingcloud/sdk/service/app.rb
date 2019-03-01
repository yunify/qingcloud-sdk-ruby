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
    class AppService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/bot/DeployAppVersion.html
      def deploy_app_version(app_id: "", app_type: "", charge_mode: "", conf: "", debug: nil, owner: "", version_id: "")
        input = {
          config: config,
          properties: properties,
          api_name: "DeployAppVersion",
          request_method: "GET",
          request_params: {
            "app_id" => app_id,
            "app_type" => app_type,
            "charge_mode" => charge_mode,
            "conf" => conf,
            "debug" => debug,
            "owner" => owner,
            "version_id" => version_id,
          },
        }

        deploy_app_version_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/bot/describe_app_version_attachments.html
      def describe_app_version_attachments(attachment_ids: [], content_keys: [], version_id: "")
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeAppVersionAttachments",
          request_method: "GET",
          request_params: {
            "attachment_ids" => attachment_ids,
            "content_keys" => content_keys, # content_keys's available values: config.json, locale/zh-cn.json, locale/en.json, cluster.json.mustache
            "version_id" => version_id,
          },
        }

        describe_app_version_attachments_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/bot/describe_app_versions.html
      def describe_app_versions(app_ids: [], limit: nil, name: "", offset: nil, owner: "", reverse: "", sort_key: "", status: [], verbose: nil, version_ids: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeAppVersions",
          request_method: "GET",
          request_params: {
            "app_ids" => app_ids,
            "limit" => limit,
            "name" => name,
            "offset" => offset,
            "owner" => owner,
            "reverse" => reverse,
            "sort_key" => sort_key,
            "status" => status,
            "verbose" => verbose, # verbose's available values: 1, 0
            "version_ids" => version_ids,
          },
        }

        describe_app_versions_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/bot/describe_apps.html
      def describe_apps(app: "", app_name: "", app_type: [], category: "", limit: nil, offset: nil, search_word: "", status: [], tags: [], verbose: nil, zones: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeApps",
          request_method: "GET",
          request_params: {
            "app" => app,
            "app_name" => app_name,
            "app_type" => app_type,
            "category" => category,
            "limit" => limit,
            "offset" => offset,
            "search_word" => search_word,
            "status" => status,
            "tags" => tags,
            "verbose" => verbose, # verbose's available values: 1, 0
            "zones" => zones,
          },
        }

        describe_apps_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/bot/describe_app_version_attachments.html
      def get_global_unique_id(user_id: "")
        input = {
          config: config,
          properties: properties,
          api_name: "GetGlobalUniqueId",
          request_method: "GET",
          request_params: {
            "user_id" => user_id,
          },
        }

        get_global_unique_id_input_validate input

        request = Request.new input
        request.send
      end

      private

      def deploy_app_version_input_validate(input)
        input.deep_stringify_keys!
      end

      def describe_app_version_attachments_input_validate(input)
        input.deep_stringify_keys!
      end

      def describe_app_versions_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["verbose"].to_s.empty?
          verbose_valid_values = ["1", "0"]
          unless verbose_valid_values.include? input["request_params"]["verbose"].to_s
            raise ParameterValueNotAllowedError.new(
              "verbose",
              input["request_params"]["verbose"],
              verbose_valid_values
            )
          end
        end
      end

      def describe_apps_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["verbose"].to_s.empty?
          verbose_valid_values = ["1", "0"]
          unless verbose_valid_values.include? input["request_params"]["verbose"].to_s
            raise ParameterValueNotAllowedError.new(
              "verbose",
              input["request_params"]["verbose"],
              verbose_valid_values
            )
          end
        end
      end

      def get_global_unique_id_input_validate(input)
        input.deep_stringify_keys!
      end
    end
  end
end
