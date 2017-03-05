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

require 'active_support/core_ext/hash/keys'

module QingCloud
  module SDK
    class UserDataService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config     = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/userdata/upload_userdata_attachment.html
      def upload_user_data_attachment(attachment_content: '', attachment_name: '')
        input = {
          config:         config,
          properties:     properties,
          api_name:       'UploadUserDataAttachment',
          request_method: 'POST',
          request_params: {
            'attachment_content' => attachment_content,
            'attachment_name'    => attachment_name,
          },
        }

        upload_user_data_attachment_input_validate input

        request = Request.new input
        request.send
      end

      private

      def upload_user_data_attachment_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['attachment_content'].nil? && !input['request_params']['attachment_content'].to_s.empty?
          raise ParameterRequiredError.new('attachment_content', 'UploadUserDataAttachmentInput')
        end
      end

      public
    end
  end
end
