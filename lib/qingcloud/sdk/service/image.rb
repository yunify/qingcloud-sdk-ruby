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
    class ImageService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/image/capture_instance.html
      def capture_instance(image_name: "", instance: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CaptureInstance",
          request_method: "GET",
          request_params: {
            "image_name" => image_name,
            "instance" => instance,
          },
        }

        capture_instance_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/image/delete_images.html
      def delete_images(images: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteImages",
          request_method: "GET",
          request_params: {
            "images" => images,
          },
        }

        delete_images_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/image/describe-image-users.html
      def describe_image_users(image_id: "", limit: nil, offset: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeImageUsers",
          request_method: "GET",
          request_params: {
            "image_id" => image_id,
            "limit" => limit,
            "offset" => offset,
          },
        }

        describe_image_users_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/image/describe_images.html
      def describe_images(images: [], limit: nil, offset: nil, os_family: "", owner: "", processor_type: "", project_id: "", provider: "", search_word: "", status: [], tags: [], verbose: nil, visibility: "")
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeImages",
          request_method: "GET",
          request_params: {
            "images" => images,
            "limit" => limit,
            "offset" => offset,
            "os_family" => os_family,
            "owner" => owner,
            "processor_type" => processor_type, # processor_type's available values: 64bit, 32bit
            "project_id" => project_id,
            "provider" => provider, # provider's available values: system, self
            "search_word" => search_word,
            "status" => status,
            "tags" => tags,
            "verbose" => verbose, # verbose's available values: 0
            "visibility" => visibility, # visibility's available values: public, private
          },
        }

        describe_images_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/image/grant-image-to-users.html
      def grant_image_to_users(image: "", users: [])
        input = {
          config: config,
          properties: properties,
          api_name: "GrantImageToUsers",
          request_method: "GET",
          request_params: {
            "image" => image,
            "users" => users,
          },
        }

        grant_image_to_users_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/image/modify_image_attributes.html
      def modify_image_attributes(description: "", image: "", image_name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyImageAttributes",
          request_method: "GET",
          request_params: {
            "description" => description,
            "image" => image,
            "image_name" => image_name,
          },
        }

        modify_image_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/image/revoke-image-from-users.html
      def revoke_image_from_users(image: "", users: [])
        input = {
          config: config,
          properties: properties,
          api_name: "RevokeImageFromUsers",
          request_method: "GET",
          request_params: {
            "image" => image,
            "users" => users,
          },
        }

        revoke_image_from_users_input_validate input

        request = Request.new input
        request.send
      end

      private

      def capture_instance_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["instance"].to_s.empty?
          raise ParameterRequiredError.new("instance", "CaptureInstanceInput")
        end
      end

      def delete_images_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["images"].to_s.empty?
          raise ParameterRequiredError.new("images", "DeleteImagesInput")
        end
      end

      def describe_image_users_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["image_id"].to_s.empty?
          raise ParameterRequiredError.new("image_id", "DescribeImageUsersInput")
        end
      end

      def describe_images_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["processor_type"].to_s.empty?
          processor_type_valid_values = ["64bit", "32bit"]
          unless processor_type_valid_values.include? input["request_params"]["processor_type"].to_s
            raise ParameterValueNotAllowedError.new(
              "processor_type",
              input["request_params"]["processor_type"],
              processor_type_valid_values
            )
          end
        end

        unless input["request_params"]["provider"].to_s.empty?
          provider_valid_values = ["system", "self"]
          unless provider_valid_values.include? input["request_params"]["provider"].to_s
            raise ParameterValueNotAllowedError.new(
              "provider",
              input["request_params"]["provider"],
              provider_valid_values
            )
          end
        end

        unless input["request_params"]["verbose"].to_s.empty?
          verbose_valid_values = ["0"]
          unless verbose_valid_values.include? input["request_params"]["verbose"].to_s
            raise ParameterValueNotAllowedError.new(
              "verbose",
              input["request_params"]["verbose"],
              verbose_valid_values
            )
          end
        end

        unless input["request_params"]["visibility"].to_s.empty?
          visibility_valid_values = ["public", "private"]
          unless visibility_valid_values.include? input["request_params"]["visibility"].to_s
            raise ParameterValueNotAllowedError.new(
              "visibility",
              input["request_params"]["visibility"],
              visibility_valid_values
            )
          end
        end
      end

      def grant_image_to_users_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["image"].to_s.empty?
          raise ParameterRequiredError.new("image", "GrantImageToUsersInput")
        end

        if input["request_params"]["users"].to_s.empty?
          raise ParameterRequiredError.new("users", "GrantImageToUsersInput")
        end
      end

      def modify_image_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["image"].to_s.empty?
          raise ParameterRequiredError.new("image", "ModifyImageAttributesInput")
        end
      end

      def revoke_image_from_users_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["image"].to_s.empty?
          raise ParameterRequiredError.new("image", "RevokeImageFromUsersInput")
        end

        if input["request_params"]["users"].to_s.empty?
          raise ParameterRequiredError.new("users", "RevokeImageFromUsersInput")
        end
      end
    end
  end
end
