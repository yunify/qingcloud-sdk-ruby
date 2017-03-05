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

require 'base64'
require 'cgi'
require 'openssl'

module QingCloud
  module SDK
    class Signer
      def self.do(input)
        input[:request_params].each do |k, v|
          v = CGI.escape v.to_s.gsub(' ', '%20')
          input[:request_params][k] = v.gsub '%2520', '%20'
        end

        # build string_to_sign
        string_to_sign = "#{input[:request_method]}\n#{input[:config][:uri]}\n" \
                         "#{input[:request_params].sort.map { |k, v| "#{k}=#{v}" }.join('&')}"

        # build signature
        signature = Base64.encode64(
          OpenSSL::HMAC.digest(
            OpenSSL::Digest.new('sha256'),
            input[:config][:qy_secret_access_key].to_s,
            string_to_sign,
          ),
        ).strip
        signature.tr! ' ', '+'
        signature = CGI.escape signature

        input[:request_params][:signature] = signature

        Logger.debug "QingCloud request string to sign: [#{input[:id]}] #{string_to_sign}"
        Logger.debug "QingCloud request signature: [#{input[:id]}] #{signature}"
        input
      end
    end
  end
end
