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
    class DNSAliasService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/dns_alias/associate_dns_alias.html
      def associate_dns_alias(prefix: "", resource: "")
        input = {
          config: config,
          properties: properties,
          api_name: "AssociateDNSAlias",
          request_method: "GET",
          request_params: {
            "prefix" => prefix,
            "resource" => resource,
          },
        }

        associate_dns_alias_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/dns_alias/describe_dns_aliases.html
      def describe_dns_aliases(dns_aliases: [], limit: nil, offset: nil, resource_id: "", search_word: "")
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeDNSAliases",
          request_method: "GET",
          request_params: {
            "dns_aliases" => dns_aliases,
            "limit" => limit,
            "offset" => offset,
            "resource_id" => resource_id,
            "search_word" => search_word,
          },
        }

        describe_dns_aliases_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/dns_alias/dissociate_dns_aliases.html
      def dissociate_dns_aliases(dns_aliases: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DissociateDNSAliases",
          request_method: "GET",
          request_params: {
            "dns_aliases" => dns_aliases,
          },
        }

        dissociate_dns_aliases_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/dns_alias/get_dns_label.html
      def get_dns_label()
        input = {
          config: config,
          properties: properties,
          api_name: "GetDNSLabel",
          request_method: "GET",
          request_params: {},
        }

        get_dns_label_input_validate input

        request = Request.new input
        request.send
      end

      private

      def associate_dns_alias_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["prefix"].to_s.empty?
          raise ParameterRequiredError.new("prefix", "AssociateDNSAliasInput")
        end

        if input["request_params"]["resource"].to_s.empty?
          raise ParameterRequiredError.new("resource", "AssociateDNSAliasInput")
        end
      end

      def describe_dns_aliases_input_validate(input)
        input.deep_stringify_keys!
      end

      def dissociate_dns_aliases_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["dns_aliases"].to_s.empty?
          raise ParameterRequiredError.new("dns_aliases", "DissociateDNSAliasesInput")
        end
      end

      def get_dns_label_input_validate(input)
        input.deep_stringify_keys!
      end
    end
  end
end
