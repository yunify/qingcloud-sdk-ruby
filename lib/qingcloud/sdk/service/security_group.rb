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
    class SecurityGroupService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/add_security_group_rules.html
      def add_security_group_rules(rules: [], security_group: "")
        input = {
          config: config,
          properties: properties,
          api_name: "AddSecurityGroupRules",
          request_method: "GET",
          request_params: {
            "rules" => rules,
            "security_group" => security_group,
          },
        }

        add_security_group_rules_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/apply_security_group.html
      def apply_security_group(instances: [], security_group: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ApplySecurityGroup",
          request_method: "GET",
          request_params: {
            "instances" => instances,
            "security_group" => security_group,
          },
        }

        apply_security_group_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/apply_security_group_ipsets.html
      def apply_security_group_ip_sets(security_group_ipsets: [])
        input = {
          config: config,
          properties: properties,
          api_name: "ApplySecurityGroupIPSets",
          request_method: "GET",
          request_params: {
            "security_group_ipsets" => security_group_ipsets,
          },
        }

        apply_security_group_ip_sets_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/create_security_group.html
      def create_security_group(security_group_name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateSecurityGroup",
          request_method: "GET",
          request_params: {
            "security_group_name" => security_group_name,
          },
        }

        create_security_group_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/create_security_group_ipset.html
      def create_security_group_ip_set(ipset_type: nil, security_group_ipset_name: "", val: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateSecurityGroupIPSet",
          request_method: "GET",
          request_params: {
            "ipset_type" => ipset_type, # ipset_type's available values: 0, 1
            "security_group_ipset_name" => security_group_ipset_name,
            "val" => val,
          },
        }

        create_security_group_ip_set_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/create_security_group_snapshot.html
      def create_security_group_snapshot(name: "", security_group: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateSecurityGroupSnapshot",
          request_method: "GET",
          request_params: {
            "name" => name,
            "security_group" => security_group,
          },
        }

        create_security_group_snapshot_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/delete_security_group_ipsets.html
      def delete_security_group_ip_sets(security_group_ipsets: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteSecurityGroupIPSets",
          request_method: "GET",
          request_params: {
            "security_group_ipsets" => security_group_ipsets,
          },
        }

        delete_security_group_ip_sets_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/delete_security_group_rules.html
      def delete_security_group_rules(security_group_rules: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteSecurityGroupRules",
          request_method: "GET",
          request_params: {
            "security_group_rules" => security_group_rules,
          },
        }

        delete_security_group_rules_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/delete_security_group_snapshots.html
      def delete_security_group_snapshots(security_group_snapshots: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteSecurityGroupSnapshots",
          request_method: "GET",
          request_params: {
            "security_group_snapshots" => security_group_snapshots,
          },
        }

        delete_security_group_snapshots_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/delete_security_groups.html
      def delete_security_groups(security_groups: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteSecurityGroups",
          request_method: "GET",
          request_params: {
            "security_groups" => security_groups,
          },
        }

        delete_security_groups_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/describe_security_group_ipsets.html
      def describe_security_group_ip_sets(ipset_type: nil, limit: nil, offset: nil, owner: "", project_id: "", security_group_ipset_name: "", security_group_ipsets: [], tags: [], verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeSecurityGroupIPSets",
          request_method: "GET",
          request_params: {
            "ipset_type" => ipset_type, # ipset_type's available values: 0, 1
            "limit" => limit,
            "offset" => offset,
            "owner" => owner,
            "project_id" => project_id,
            "security_group_ipset_name" => security_group_ipset_name,
            "security_group_ipsets" => security_group_ipsets,
            "tags" => tags,
            "verbose" => verbose,
          },
        }

        describe_security_group_ip_sets_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/describe_security_group_rules.html
      def describe_security_group_rules(direction: nil, limit: nil, offset: nil, owner: "", security_group: "", security_group_rules: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeSecurityGroupRules",
          request_method: "GET",
          request_params: {
            "direction" => direction, # direction's available values: 0, 1
            "limit" => limit,
            "offset" => offset,
            "owner" => owner,
            "security_group" => security_group,
            "security_group_rules" => security_group_rules,
          },
        }

        describe_security_group_rules_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/describe_security_group_snapshots.html
      def describe_security_group_snapshots(limit: nil, offset: nil, project_id: "", reverse: nil, security_group: "", security_group_snapshots: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeSecurityGroupSnapshots",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "offset" => offset,
            "project_id" => project_id,
            "reverse" => reverse,
            "security_group" => security_group,
            "security_group_snapshots" => security_group_snapshots,
          },
        }

        describe_security_group_snapshots_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/describe_security_groups.html
      def describe_security_groups(limit: nil, offset: nil, owner: "", project_id: "", search_word: "", security_groups: [], tags: [], verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeSecurityGroups",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "offset" => offset,
            "owner" => owner,
            "project_id" => project_id,
            "search_word" => search_word,
            "security_groups" => security_groups,
            "tags" => tags,
            "verbose" => verbose,
          },
        }

        describe_security_groups_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/modify_security_group_attributes.html
      def modify_security_group_attributes(description: "", security_group: "", security_group_name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifySecurityGroupAttributes",
          request_method: "GET",
          request_params: {
            "description" => description,
            "security_group" => security_group,
            "security_group_name" => security_group_name,
          },
        }

        modify_security_group_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/modify_security_group_ipset_attributes.html
      def modify_security_group_ip_set_attributes(description: "", security_group_ipset: "", security_group_ipset_name: "", val: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifySecurityGroupIPSetAttributes",
          request_method: "GET",
          request_params: {
            "description" => description,
            "security_group_ipset" => security_group_ipset,
            "security_group_ipset_name" => security_group_ipset_name,
            "val" => val,
          },
        }

        modify_security_group_ip_set_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/modify_security_group_rule_attributes.html
      def modify_security_group_rule_attributes(direction: nil, priority: nil, protocol: "", rule_action: "", security_group: "", security_group_rule: "", security_group_rule_name: "", val1: "", val2: "", val3: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifySecurityGroupRuleAttributes",
          request_method: "GET",
          request_params: {
            "direction" => direction, # direction's available values: 0, 1
            "priority" => priority,
            "protocol" => protocol,
            "rule_action" => rule_action, # rule_action's available values: accept, drop
            "security_group" => security_group,
            "security_group_rule" => security_group_rule,
            "security_group_rule_name" => security_group_rule_name,
            "val1" => val1,
            "val2" => val2,
            "val3" => val3,
          },
        }

        modify_security_group_rule_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/sg/rollback_security_group.html
      def rollback_security_group(security_group: "", security_group_snapshot: "")
        input = {
          config: config,
          properties: properties,
          api_name: "RollbackSecurityGroup",
          request_method: "GET",
          request_params: {
            "security_group" => security_group,
            "security_group_snapshot" => security_group_snapshot,
          },
        }

        rollback_security_group_input_validate input

        request = Request.new input
        request.send
      end

      private

      def add_security_group_rules_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["rules"].to_s.empty?
          raise ParameterRequiredError.new("rules", "AddSecurityGroupRulesInput")
        end

        input["request_params"]["rules"].map { |x|
          unless x["action"].to_s.empty?
            action_valid_values = ["accept", "drop"]
            unless action_valid_values.include? x["action"].to_s
              raise ParameterValueNotAllowedError.new(
                "action",
                x["action"],
                action_valid_values
              )
            end
          end

          unless x["direction"].to_s.empty?
            direction_valid_values = ["0", "1"]
            unless direction_valid_values.include? x["direction"].to_s
              raise ParameterValueNotAllowedError.new(
                "direction",
                x["direction"],
                direction_valid_values
              )
            end
          end
        }

        if input["request_params"]["security_group"].to_s.empty?
          raise ParameterRequiredError.new("security_group", "AddSecurityGroupRulesInput")
        end
      end

      def apply_security_group_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["security_group"].to_s.empty?
          raise ParameterRequiredError.new("security_group", "ApplySecurityGroupInput")
        end
      end

      def apply_security_group_ip_sets_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["security_group_ipsets"].to_s.empty?
          raise ParameterRequiredError.new("security_group_ipsets", "ApplySecurityGroupIPSetsInput")
        end
      end

      def create_security_group_input_validate(input)
        input.deep_stringify_keys!
      end

      def create_security_group_ip_set_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["ipset_type"].to_s.empty?
          raise ParameterRequiredError.new("ipset_type", "CreateSecurityGroupIPSetInput")
        end

        unless input["request_params"]["ipset_type"].to_s.empty?
          ipset_type_valid_values = ["0", "1"]
          unless ipset_type_valid_values.include? input["request_params"]["ipset_type"].to_s
            raise ParameterValueNotAllowedError.new(
              "ipset_type",
              input["request_params"]["ipset_type"],
              ipset_type_valid_values
            )
          end
        end

        if input["request_params"]["val"].to_s.empty?
          raise ParameterRequiredError.new("val", "CreateSecurityGroupIPSetInput")
        end
      end

      def create_security_group_snapshot_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["security_group"].to_s.empty?
          raise ParameterRequiredError.new("security_group", "CreateSecurityGroupSnapshotInput")
        end
      end

      def delete_security_group_ip_sets_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["security_group_ipsets"].to_s.empty?
          raise ParameterRequiredError.new("security_group_ipsets", "DeleteSecurityGroupIPSetsInput")
        end
      end

      def delete_security_group_rules_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["security_group_rules"].to_s.empty?
          raise ParameterRequiredError.new("security_group_rules", "DeleteSecurityGroupRulesInput")
        end
      end

      def delete_security_group_snapshots_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["security_group_snapshots"].to_s.empty?
          raise ParameterRequiredError.new("security_group_snapshots", "DeleteSecurityGroupSnapshotsInput")
        end
      end

      def delete_security_groups_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["security_groups"].to_s.empty?
          raise ParameterRequiredError.new("security_groups", "DeleteSecurityGroupsInput")
        end
      end

      def describe_security_group_ip_sets_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["ipset_type"].to_s.empty?
          ipset_type_valid_values = ["0", "1"]
          unless ipset_type_valid_values.include? input["request_params"]["ipset_type"].to_s
            raise ParameterValueNotAllowedError.new(
              "ipset_type",
              input["request_params"]["ipset_type"],
              ipset_type_valid_values
            )
          end
        end
      end

      def describe_security_group_rules_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["direction"].to_s.empty?
          direction_valid_values = ["0", "1"]
          unless direction_valid_values.include? input["request_params"]["direction"].to_s
            raise ParameterValueNotAllowedError.new(
              "direction",
              input["request_params"]["direction"],
              direction_valid_values
            )
          end
        end
      end

      def describe_security_group_snapshots_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["security_group"].to_s.empty?
          raise ParameterRequiredError.new("security_group", "DescribeSecurityGroupSnapshotsInput")
        end
      end

      def describe_security_groups_input_validate(input)
        input.deep_stringify_keys!
      end

      def modify_security_group_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["security_group"].to_s.empty?
          raise ParameterRequiredError.new("security_group", "ModifySecurityGroupAttributesInput")
        end
      end

      def modify_security_group_ip_set_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["security_group_ipset"].to_s.empty?
          raise ParameterRequiredError.new("security_group_ipset", "ModifySecurityGroupIPSetAttributesInput")
        end
      end

      def modify_security_group_rule_attributes_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["direction"].to_s.empty?
          direction_valid_values = ["0", "1"]
          unless direction_valid_values.include? input["request_params"]["direction"].to_s
            raise ParameterValueNotAllowedError.new(
              "direction",
              input["request_params"]["direction"],
              direction_valid_values
            )
          end
        end

        unless input["request_params"]["rule_action"].to_s.empty?
          rule_action_valid_values = ["accept", "drop"]
          unless rule_action_valid_values.include? input["request_params"]["rule_action"].to_s
            raise ParameterValueNotAllowedError.new(
              "rule_action",
              input["request_params"]["rule_action"],
              rule_action_valid_values
            )
          end
        end

        if input["request_params"]["security_group_rule"].to_s.empty?
          raise ParameterRequiredError.new("security_group_rule", "ModifySecurityGroupRuleAttributesInput")
        end
      end

      def rollback_security_group_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["security_group"].to_s.empty?
          raise ParameterRequiredError.new("security_group", "RollbackSecurityGroupInput")
        end

        if input["request_params"]["security_group_snapshot"].to_s.empty?
          raise ParameterRequiredError.new("security_group_snapshot", "RollbackSecurityGroupInput")
        end
      end
    end
  end
end
