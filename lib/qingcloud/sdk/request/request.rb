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

require 'json'
require 'net/http'
require 'ostruct'

module QingCloud
  module SDK
    class Request
      attr_accessor :input, :request_url, :http_request, :http_response

      def initialize(input)
        self.input = Preprocessor.do input
      end

      def send
        check
        build
        perform
        unpack
      end

      private

      def check
        unless !input[:config][:qy_access_key_id].nil? && !input[:config][:qy_access_key_id].empty?
          raise SDKError, 'access key not provided'
        end
        unless !input[:config][:qy_secret_access_key].nil? && !input[:config][:qy_secret_access_key].empty?
          raise SDKError, 'secret access key not provided'
        end
      end

      def build
        self.input = Signer.do input

        params           = input[:request_params].map { |k, v| "#{k}=#{v}" }
        query_string     = !params.empty? ? "?#{params.join '&'}" : ''
        self.request_url = "#{input[:request_endpoint]}#{input[:config][:uri]}#{query_string}"

        self.http_request = Net::HTTP::Get.new request_url
      end

      def perform
        retries = input[:config][:connection_retries]
        while
          begin
            Logger.info "Sending request: [#{input[:id]}] #{request_url}"
            self.http_response = input[:config].connection.request request_url, http_request
          rescue SocketError
            retries > 0 ? retries -= 1 : (raise NetworkError)
            sleep 1
            next
          end
          break
        end
      end

      def unpack
        output = JSON.parse(http_response.body)
        Logger.info "Parse response: [#{input[:id]}] #{output}"
        output.deep_symbolize_keys!
      end
    end
  end
end
