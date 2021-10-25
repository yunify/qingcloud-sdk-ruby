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
    class NotificationService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      def describe_notification_lists(limit: nil, notification_lists: [], offset: nil, owner: "")
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeNotificationLists",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "notification_lists" => notification_lists,
            "offset" => offset,
            "owner" => owner,
          },
        }

        describe_notification_lists_input_validate input

        request = Request.new input
        request.send
      end

      def send_alarm_notification(notification_data: [], notification_list_id: "", resource_id: "", resource_name: "", resource_type: "", user_id: "")
        input = {
          config: config,
          properties: properties,
          api_name: "SendAlarmNotification",
          request_method: "GET",
          request_params: {
            "notification_data" => notification_data,
            "notification_list_id" => notification_list_id,
            "resource_id" => resource_id,
            "resource_name" => resource_name,
            "resource_type" => resource_type,
            "user_id" => user_id,
          },
        }

        send_alarm_notification_input_validate input

        request = Request.new input
        request.send
      end

      private

      def describe_notification_lists_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["notification_lists"].to_s.empty?
          raise ParameterRequiredError.new("notification_lists", "DescribeNotificationListsInput")
        end
      end

      def send_alarm_notification_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["notification_data"].to_s.empty?
          raise ParameterRequiredError.new("notification_data", "SendAlarmNotificationInput")
        end

        input["request_params"]["notification_data"].map { |x| }

        if input["request_params"]["notification_list_id"].to_s.empty?
          raise ParameterRequiredError.new("notification_list_id", "SendAlarmNotificationInput")
        end

        if input["request_params"]["user_id"].to_s.empty?
          raise ParameterRequiredError.new("user_id", "SendAlarmNotificationInput")
        end
      end
    end
  end
end
