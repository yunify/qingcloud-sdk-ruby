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
    class TagService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/tag/attach_tags.html
      def attach_tags(resource_tag_pairs: [])
        input = {
          config: config,
          properties: properties,
          api_name: "AttachTags",
          request_method: "GET",
          request_params: {
            "resource_tag_pairs" => resource_tag_pairs,
          },
        }

        attach_tags_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/tag/create_tag.html
      def create_tag(color: "", tag_name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateTag",
          request_method: "GET",
          request_params: {
            "color" => color,
            "tag_name" => tag_name,
          },
        }

        create_tag_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/tag/delete_tags.html
      def delete_tags(tags: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteTags",
          request_method: "GET",
          request_params: {
            "tags" => tags,
          },
        }

        delete_tags_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/tag/describe_tags.html
      def describe_tags(limit: nil, offset: nil, search_word: "", tags: [], verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeTags",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "offset" => offset,
            "search_word" => search_word,
            "tags" => tags,
            "verbose" => verbose, # verbose's available values: 0, 1
          },
        }

        describe_tags_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/tag/detach_tags.html
      def detach_tags(resource_tag_pairs: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DetachTags",
          request_method: "GET",
          request_params: {
            "resource_tag_pairs" => resource_tag_pairs,
          },
        }

        detach_tags_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/tag/modify_tag_attributes.html
      def modify_tag_attributes(color: "", description: "", tag: "", tag_name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyTagAttributes",
          request_method: "GET",
          request_params: {
            "color" => color,
            "description" => description,
            "tag" => tag,
            "tag_name" => tag_name,
          },
        }

        modify_tag_attributes_input_validate input

        request = Request.new input
        request.send
      end

      private

      def attach_tags_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["resource_tag_pairs"].to_s.empty?
          raise ParameterRequiredError.new("resource_tag_pairs", "AttachTagsInput")
        end

        input["request_params"]["resource_tag_pairs"].map { |x| }
      end

      def create_tag_input_validate(input)
        input.deep_stringify_keys!
      end

      def delete_tags_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["tags"].to_s.empty?
          raise ParameterRequiredError.new("tags", "DeleteTagsInput")
        end
      end

      def describe_tags_input_validate(input)
        input.deep_stringify_keys!

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

      def detach_tags_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["resource_tag_pairs"].to_s.empty?
          raise ParameterRequiredError.new("resource_tag_pairs", "DetachTagsInput")
        end

        input["request_params"]["resource_tag_pairs"].map { |x| }
      end

      def modify_tag_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["tag"].to_s.empty?
          raise ParameterRequiredError.new("tag", "ModifyTagAttributesInput")
        end
      end
    end
  end
end
