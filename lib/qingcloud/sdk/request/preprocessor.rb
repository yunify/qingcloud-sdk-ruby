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
    class Preprocessor
      def self.do(input)
        input = decorate_input input

        config                   = input[:config]
        input[:request_endpoint] = "#{config[:protocol]}://#{config[:host]}:#{config[:port]}"

        parsed_params = {}
        input[:request_params].each do |param_k, param_v|
          if param_v.is_a? Array
            param_v.each_with_index do |value, index|
              if value.is_a? Hash
                value.each do |value_k, value_v|
                  parsed_params["#{param_k}.#{index}.#{value_k}"] = value_v
                end
              else
                parsed_params["#{param_k}.#{index}"] = value
              end
            end
          elsif param_v.is_a? Hash
            param_v.each do |key, value|
              parsed_params["#{param_k}.#{key}"] = value
            end
          else
            parsed_params[param_k] = param_v
          end
        end
        input[:request_params] = parsed_params.deep_symbolize_keys!
        input[:request_params].update(
          action:            input[:api_name],
          time_stamp:        Time.now.utc.strftime('%Y-%m-%dT%H:%M:%SZ'),
          version:           1,
          signature_method:  'HmacSHA256',
          signature_version: 1,
          access_key_id:     input[:config][:qy_access_key_id],
        )

        if input[:properties][:zone] && !input[:properties][:zone].empty?
          input[:request_params][:zone] = input[:properties][:zone]
        end

        Logger.info "Preprocess QingCloud request: [#{input[:id]}] #{input}"
        input
      end

      def self.decorate_input(input)
        input.deep_symbolize_keys!
        input[:id] = (Random.new.rand * 1_000_000).to_int
        compact input
      end

      def self.compact(object)
        object.each do |k, v|
          object[k] = compact v if v.is_a? Hash
          object.delete k if v.nil? || v == ''
        end
        object
      end
    end
  end
end
