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
    class RouterService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/add_router_static_entries.html
      def add_router_static_entries(entries: [], router_static: "")
        input = {
          config: config,
          properties: properties,
          api_name: "AddRouterStaticEntries",
          request_method: "GET",
          request_params: {
            "entries" => entries,
            "router_static" => router_static,
          },
        }

        add_router_static_entries_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/add_router_statics.html
      def add_router_statics(router: "", statics: [], vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "AddRouterStatics",
          request_method: "GET",
          request_params: {
            "router" => router,
            "statics" => statics,
            "vxnet" => vxnet,
          },
        }

        add_router_statics_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/create_routers.html
      def create_routers(count: nil, router_name: "", router_type: nil, security_group: "", vpc_network: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateRouters",
          request_method: "GET",
          request_params: {
            "count" => count,
            "router_name" => router_name,
            "router_type" => router_type, # router_type's available values: 0, 1, 2, 3
            "security_group" => security_group,
            "vpc_network" => vpc_network,
          },
        }

        create_routers_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/delete_router_static_entries.html
      def delete_router_static_entries(router_static_entries: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteRouterStaticEntries",
          request_method: "GET",
          request_params: {
            "router_static_entries" => router_static_entries,
          },
        }

        delete_router_static_entries_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/delete_router_statics.html
      def delete_router_statics(router_statics: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteRouterStatics",
          request_method: "GET",
          request_params: {
            "router_statics" => router_statics,
          },
        }

        delete_router_statics_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/delete_routers.html
      def delete_routers(routers: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteRouters",
          request_method: "GET",
          request_params: {
            "routers" => routers,
          },
        }

        delete_routers_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/describe_router_static_entries.html
      def describe_router_static_entries(limit: nil, offset: nil, owner: "", router_static: "", router_static_entries: "")
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeRouterStaticEntries",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "offset" => offset,
            "owner" => owner,
            "router_static" => router_static,
            "router_static_entries" => router_static_entries,
          },
        }

        describe_router_static_entries_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/describe_router_statics.html
      def describe_router_statics(limit: nil, offset: nil, owner: "", router: "", router_statics: [], static_type: nil, verbose: nil, vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeRouterStatics",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "offset" => offset,
            "owner" => owner,
            "router" => router,
            "router_statics" => router_statics,
            "static_type" => static_type, # static_type's available values: 1, 2, 3, 4, 5, 6, 7, 8
            "verbose" => verbose, # verbose's available values: 0, 1
            "vxnet" => vxnet,
          },
        }

        describe_router_statics_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/describe_router_vxnets.html
      def describe_router_vxnets(limit: nil, offset: nil, router: "", verbose: nil, vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeRouterVxnets",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "offset" => offset,
            "router" => router,
            "verbose" => verbose, # verbose's available values: 0, 1
            "vxnet" => vxnet,
          },
        }

        describe_router_vxnets_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/describe_routers.html
      def describe_routers(limit: nil, offset: nil, owner: "", project_id: "", routers: [], search_word: "", status: [], tags: [], verbose: nil, vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeRouters",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "offset" => offset,
            "owner" => owner,
            "project_id" => project_id,
            "routers" => routers,
            "search_word" => search_word,
            "status" => status,
            "tags" => tags,
            "verbose" => verbose, # verbose's available values: 0, 1
            "vxnet" => vxnet,
          },
        }

        describe_routers_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/monitor/get_monitor.html
      def get_router_monitor(end_time: "", meters: [], resource: "", start_time: "", step: "")
        input = {
          config: config,
          properties: properties,
          api_name: "GetMonitor",
          request_method: "GET",
          request_params: {
            "end_time" => end_time,
            "meters" => meters,
            "resource" => resource,
            "start_time" => start_time,
            "step" => step, # step's available values: 5m, 15m, 2h, 1d
          },
        }

        get_router_monitor_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/get_vpn_certs.html
      def get_v_p_n_certs(platform: "", router: "")
        input = {
          config: config,
          properties: properties,
          api_name: "GetVPNCerts",
          request_method: "GET",
          request_params: {
            "platform" => platform, # platform's available values: windows, linux, mac
            "router" => router,
          },
        }

        get_v_p_n_certs_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/join_router.html
      def join_router(dyn_ip_end: "", dyn_ip_start: "", features: nil, ip_network: "", manager_ip: "", router: "", vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "JoinRouter",
          request_method: "GET",
          request_params: {
            "dyn_ip_end" => dyn_ip_end,
            "dyn_ip_start" => dyn_ip_start,
            "features" => features, # features's available values: 1
            "ip_network" => ip_network,
            "manager_ip" => manager_ip,
            "router" => router,
            "vxnet" => vxnet,
          },
        }

        join_router_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/leave_router.html
      def leave_router(router: "", vxnets: [])
        input = {
          config: config,
          properties: properties,
          api_name: "LeaveRouter",
          request_method: "GET",
          request_params: {
            "router" => router,
            "vxnets" => vxnets,
          },
        }

        leave_router_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/modify_router_attributes.html
      def modify_router_attributes(description: "", dyn_ip_end: "", dyn_ip_start: "", eip: "", features: nil, router: "", router_name: "", security_group: "", vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyRouterAttributes",
          request_method: "GET",
          request_params: {
            "description" => description,
            "dyn_ip_end" => dyn_ip_end,
            "dyn_ip_start" => dyn_ip_start,
            "eip" => eip,
            "features" => features, # features's available values: 1, 2
            "router" => router,
            "router_name" => router_name,
            "security_group" => security_group,
            "vxnet" => vxnet,
          },
        }

        modify_router_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/modify_router_static_attributes.html
      def modify_router_static_attributes(router_static: "", router_static_name: "", val1: "", val2: "", val3: "", val4: "", val5: "", val6: "", val7: "", val8: "", val9: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyRouterStaticAttributes",
          request_method: "GET",
          request_params: {
            "router_static" => router_static,
            "router_static_name" => router_static_name,
            "val1" => val1,
            "val2" => val2,
            "val3" => val3,
            "val4" => val4,
            "val5" => val5,
            "val6" => val6,
            "val7" => val7,
            "val8" => val8,
            "val9" => val9,
          },
        }

        modify_router_static_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/modify_router_static_entry_attributes.html
      def modify_router_static_entry_attributes(router_static_entry: "", router_static_entry_name: "", val1: "", val2: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyRouterStaticEntryAttributes",
          request_method: "GET",
          request_params: {
            "router_static_entry" => router_static_entry,
            "router_static_entry_name" => router_static_entry_name,
            "val1" => val1,
            "val2" => val2,
          },
        }

        modify_router_static_entry_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/poweroff_routers.html
      def power_off_routers(routers: [])
        input = {
          config: config,
          properties: properties,
          api_name: "PowerOffRouters",
          request_method: "GET",
          request_params: {
            "routers" => routers,
          },
        }

        power_off_routers_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/poweron_routers.html
      def power_on_routers(routers: [])
        input = {
          config: config,
          properties: properties,
          api_name: "PowerOnRouters",
          request_method: "GET",
          request_params: {
            "routers" => routers,
          },
        }

        power_on_routers_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/router/update_routers.html
      def update_routers(routers: [])
        input = {
          config: config,
          properties: properties,
          api_name: "UpdateRouters",
          request_method: "GET",
          request_params: {
            "routers" => routers,
          },
        }

        update_routers_input_validate input

        request = Request.new input
        request.send
      end

      private

      def add_router_static_entries_input_validate(input)
        input.deep_stringify_keys!

        input["request_params"]["entries"].map { |x| }

        if input["request_params"]["router_static"].to_s.empty?
          raise ParameterRequiredError.new("router_static", "AddRouterStaticEntriesInput")
        end
      end

      def add_router_statics_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["router"].to_s.empty?
          raise ParameterRequiredError.new("router", "AddRouterStaticsInput")
        end

        if input["request_params"]["statics"].to_s.empty?
          raise ParameterRequiredError.new("statics", "AddRouterStaticsInput")
        end

        input["request_params"]["statics"].map { |x|
          x["entry_set"].map { |x| }

          unless x["static_type"].to_s.empty?
            static_type_valid_values = ["1", "2", "3", "4", "5", "6", "7", "8"]
            unless static_type_valid_values.include? x["static_type"].to_s
              raise ParameterValueNotAllowedError.new(
                "static_type",
                x["static_type"],
                static_type_valid_values
              )
            end
          end
        }
      end

      def create_routers_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["router_type"].to_s.empty?
          router_type_valid_values = ["0", "1", "2", "3"]
          unless router_type_valid_values.include? input["request_params"]["router_type"].to_s
            raise ParameterValueNotAllowedError.new(
              "router_type",
              input["request_params"]["router_type"],
              router_type_valid_values
            )
          end
        end
      end

      def delete_router_static_entries_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["router_static_entries"].to_s.empty?
          raise ParameterRequiredError.new("router_static_entries", "DeleteRouterStaticEntriesInput")
        end
      end

      def delete_router_statics_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["router_statics"].to_s.empty?
          raise ParameterRequiredError.new("router_statics", "DeleteRouterStaticsInput")
        end
      end

      def delete_routers_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["routers"].to_s.empty?
          raise ParameterRequiredError.new("routers", "DeleteRoutersInput")
        end
      end

      def describe_router_static_entries_input_validate(input)
        input.deep_stringify_keys!
      end

      def describe_router_statics_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["router"].to_s.empty?
          raise ParameterRequiredError.new("router", "DescribeRouterStaticsInput")
        end

        unless input["request_params"]["static_type"].to_s.empty?
          static_type_valid_values = ["1", "2", "3", "4", "5", "6", "7", "8"]
          unless static_type_valid_values.include? input["request_params"]["static_type"].to_s
            raise ParameterValueNotAllowedError.new(
              "static_type",
              input["request_params"]["static_type"],
              static_type_valid_values
            )
          end
        end

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

      def describe_router_vxnets_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["router"].to_s.empty?
          raise ParameterRequiredError.new("router", "DescribeRouterVxnetsInput")
        end

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

      def describe_routers_input_validate(input)
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

      def get_router_monitor_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["end_time"].to_s.empty?
          raise ParameterRequiredError.new("end_time", "GetRouterMonitorInput")
        end

        if input["request_params"]["meters"].to_s.empty?
          raise ParameterRequiredError.new("meters", "GetRouterMonitorInput")
        end

        if input["request_params"]["resource"].to_s.empty?
          raise ParameterRequiredError.new("resource", "GetRouterMonitorInput")
        end

        if input["request_params"]["start_time"].to_s.empty?
          raise ParameterRequiredError.new("start_time", "GetRouterMonitorInput")
        end

        if input["request_params"]["step"].to_s.empty?
          raise ParameterRequiredError.new("step", "GetRouterMonitorInput")
        end

        unless input["request_params"]["step"].to_s.empty?
          step_valid_values = ["5m", "15m", "2h", "1d"]
          unless step_valid_values.include? input["request_params"]["step"].to_s
            raise ParameterValueNotAllowedError.new(
              "step",
              input["request_params"]["step"],
              step_valid_values
            )
          end
        end
      end

      def get_v_p_n_certs_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["platform"].to_s.empty?
          platform_valid_values = ["windows", "linux", "mac"]
          unless platform_valid_values.include? input["request_params"]["platform"].to_s
            raise ParameterValueNotAllowedError.new(
              "platform",
              input["request_params"]["platform"],
              platform_valid_values
            )
          end
        end

        if input["request_params"]["router"].to_s.empty?
          raise ParameterRequiredError.new("router", "GetVPNCertsInput")
        end
      end

      def join_router_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["features"].to_s.empty?
          features_valid_values = ["1"]
          unless features_valid_values.include? input["request_params"]["features"].to_s
            raise ParameterValueNotAllowedError.new(
              "features",
              input["request_params"]["features"],
              features_valid_values
            )
          end
        end

        if input["request_params"]["ip_network"].to_s.empty?
          raise ParameterRequiredError.new("ip_network", "JoinRouterInput")
        end

        if input["request_params"]["router"].to_s.empty?
          raise ParameterRequiredError.new("router", "JoinRouterInput")
        end

        if input["request_params"]["vxnet"].to_s.empty?
          raise ParameterRequiredError.new("vxnet", "JoinRouterInput")
        end
      end

      def leave_router_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["router"].to_s.empty?
          raise ParameterRequiredError.new("router", "LeaveRouterInput")
        end

        if input["request_params"]["vxnets"].to_s.empty?
          raise ParameterRequiredError.new("vxnets", "LeaveRouterInput")
        end
      end

      def modify_router_attributes_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["features"].to_s.empty?
          features_valid_values = ["1", "2"]
          unless features_valid_values.include? input["request_params"]["features"].to_s
            raise ParameterValueNotAllowedError.new(
              "features",
              input["request_params"]["features"],
              features_valid_values
            )
          end
        end

        if input["request_params"]["router"].to_s.empty?
          raise ParameterRequiredError.new("router", "ModifyRouterAttributesInput")
        end
      end

      def modify_router_static_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["router_static"].to_s.empty?
          raise ParameterRequiredError.new("router_static", "ModifyRouterStaticAttributesInput")
        end
      end

      def modify_router_static_entry_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["router_static_entry"].to_s.empty?
          raise ParameterRequiredError.new("router_static_entry", "ModifyRouterStaticEntryAttributesInput")
        end
      end

      def power_off_routers_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["routers"].to_s.empty?
          raise ParameterRequiredError.new("routers", "PowerOffRoutersInput")
        end
      end

      def power_on_routers_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["routers"].to_s.empty?
          raise ParameterRequiredError.new("routers", "PowerOnRoutersInput")
        end
      end

      def update_routers_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["routers"].to_s.empty?
          raise ParameterRequiredError.new("routers", "UpdateRoutersInput")
        end
      end
    end
  end
end
