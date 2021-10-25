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
    class LoadBalancerService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/add_loadbalancer_backends.html
      def add_load_balancer_backends(backends: [], loadbalancer_listener: "")
        input = {
          config: config,
          properties: properties,
          api_name: "AddLoadBalancerBackends",
          request_method: "GET",
          request_params: {
            "backends" => backends,
            "loadbalancer_listener" => loadbalancer_listener,
          },
        }

        add_load_balancer_backends_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/add_loadbalancer_listeners.html
      def add_load_balancer_listeners(listeners: [], loadbalancer: "")
        input = {
          config: config,
          properties: properties,
          api_name: "AddLoadBalancerListeners",
          request_method: "GET",
          request_params: {
            "listeners" => listeners,
            "loadbalancer" => loadbalancer,
          },
        }

        add_load_balancer_listeners_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/add_loadbalancer_policy_rules.html
      def add_load_balancer_policy_rules(loadbalancer_policy: "", rules: [])
        input = {
          config: config,
          properties: properties,
          api_name: "AddLoadBalancerPolicyRules",
          request_method: "GET",
          request_params: {
            "loadbalancer_policy" => loadbalancer_policy,
            "rules" => rules,
          },
        }

        add_load_balancer_policy_rules_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/apply_loadbalancer_policy.html
      def apply_load_balancer_policy(loadbalancer_policy: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ApplyLoadBalancerPolicy",
          request_method: "GET",
          request_params: {
            "loadbalancer_policy" => loadbalancer_policy,
          },
        }

        apply_load_balancer_policy_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/associate_eips_to_loadbalancer.html
      def associate_eips_to_load_balancer(eips: [], loadbalancer: "")
        input = {
          config: config,
          properties: properties,
          api_name: "AssociateEipsToLoadBalancer",
          request_method: "GET",
          request_params: {
            "eips" => eips,
            "loadbalancer" => loadbalancer,
          },
        }

        associate_eips_to_load_balancer_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/create_loadbalancer.html
      def create_load_balancer(cluster_mode: nil, eips: [], http_header_size: nil, loadbalancer_name: "", loadbalancer_type: nil, mode: nil, node_count: nil, private_ip: "", project_id: "", security_group: "", vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateLoadBalancer",
          request_method: "GET",
          request_params: {
            "cluster_mode" => cluster_mode, # cluster_mode's available values: 0, 1
            "eips" => eips,
            "http_header_size" => http_header_size,
            "loadbalancer_name" => loadbalancer_name,
            "loadbalancer_type" => loadbalancer_type, # loadbalancer_type's available values: 0, 1, 2, 3, 4, 5
            "mode" => mode, # mode's available values: 0, 1
            "node_count" => node_count,
            "private_ip" => private_ip,
            "project_id" => project_id,
            "security_group" => security_group,
            "vxnet" => vxnet,
          },
        }

        create_load_balancer_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/create_loadbalancer_policy.html
      def create_load_balancer_policy(loadbalancer_policy_name: "", operator: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateLoadBalancerPolicy",
          request_method: "GET",
          request_params: {
            "loadbalancer_policy_name" => loadbalancer_policy_name,
            "operator" => operator, # operator's available values: or, and
          },
        }

        create_load_balancer_policy_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/create_server_certificate.html
      def create_server_certificate(certificate_content: "", private_key: "", server_certificate_name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateServerCertificate",
          request_method: "POST",
          request_params: {
            "certificate_content" => certificate_content,
            "private_key" => private_key,
            "server_certificate_name" => server_certificate_name,
          },
        }

        create_server_certificate_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/delete_loadbalancer_backends.html
      def delete_load_balancer_backends(loadbalancer_backends: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteLoadBalancerBackends",
          request_method: "GET",
          request_params: {
            "loadbalancer_backends" => loadbalancer_backends,
          },
        }

        delete_load_balancer_backends_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/delete_loadbalancer_listeners.html
      def delete_load_balancer_listeners(loadbalancer_listeners: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteLoadBalancerListeners",
          request_method: "GET",
          request_params: {
            "loadbalancer_listeners" => loadbalancer_listeners,
          },
        }

        delete_load_balancer_listeners_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/delete_loadbalancer_policies.html
      def delete_load_balancer_policies(loadbalancer_policies: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteLoadBalancerPolicies",
          request_method: "GET",
          request_params: {
            "loadbalancer_policies" => loadbalancer_policies,
          },
        }

        delete_load_balancer_policies_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/delete_loadbalancer_policy_rules.html
      def delete_load_balancer_policy_rules(loadbalancer_policy_rules: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteLoadBalancerPolicyRules",
          request_method: "GET",
          request_params: {
            "loadbalancer_policy_rules" => loadbalancer_policy_rules,
          },
        }

        delete_load_balancer_policy_rules_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/delete_loadbalancers.html
      def delete_load_balancers(loadbalancers: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteLoadBalancers",
          request_method: "GET",
          request_params: {
            "loadbalancers" => loadbalancers,
          },
        }

        delete_load_balancers_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/delete_server_certificates.html
      def delete_server_certificates(server_certificates: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteServerCertificates",
          request_method: "GET",
          request_params: {
            "server_certificates" => server_certificates,
          },
        }

        delete_server_certificates_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/describe_loadbalancer_backends.html
      def describe_load_balancer_backends(limit: nil, loadbalancer: "", loadbalancer_backends: [], loadbalancer_listener: "", offset: nil, owner: "", verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeLoadBalancerBackends",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "loadbalancer" => loadbalancer,
            "loadbalancer_backends" => loadbalancer_backends,
            "loadbalancer_listener" => loadbalancer_listener,
            "offset" => offset,
            "owner" => owner,
            "verbose" => verbose,
          },
        }

        describe_load_balancer_backends_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/describe_loadbalancer_listeners.html
      def describe_load_balancer_listeners(limit: nil, loadbalancer: "", loadbalancer_listeners: [], offset: nil, owner: "", verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeLoadBalancerListeners",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "loadbalancer" => loadbalancer,
            "loadbalancer_listeners" => loadbalancer_listeners,
            "offset" => offset,
            "owner" => owner,
            "verbose" => verbose,
          },
        }

        describe_load_balancer_listeners_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/describe_loadbalancer_policies.html
      def describe_load_balancer_policies(limit: nil, loadbalancer_policies: [], offset: nil, owner: "", verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeLoadBalancerPolicies",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "loadbalancer_policies" => loadbalancer_policies,
            "offset" => offset,
            "owner" => owner,
            "verbose" => verbose,
          },
        }

        describe_load_balancer_policies_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/describe_loadbalancer_policy_rules.html
      def describe_load_balancer_policy_rules(limit: nil, loadbalancer_policy: "", loadbalancer_policy_rules: [], offset: nil, owner: "")
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeLoadBalancerPolicyRules",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "loadbalancer_policy" => loadbalancer_policy,
            "loadbalancer_policy_rules" => loadbalancer_policy_rules,
            "offset" => offset,
            "owner" => owner,
          },
        }

        describe_load_balancer_policy_rules_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/describe_loadbalancers.html
      def describe_load_balancers(limit: nil, loadbalancers: [], offset: nil, owner: "", search_word: "", status: [], tags: [], verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeLoadBalancers",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "loadbalancers" => loadbalancers,
            "offset" => offset,
            "owner" => owner,
            "search_word" => search_word,
            "status" => status,
            "tags" => tags,
            "verbose" => verbose,
          },
        }

        describe_load_balancers_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/describe_server_certificates.html
      def describe_server_certificates(limit: nil, offset: nil, owner: "", search_word: "", server_certificates: [], verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeServerCertificates",
          request_method: "GET",
          request_params: {
            "limit" => limit,
            "offset" => offset,
            "owner" => owner,
            "search_word" => search_word,
            "server_certificates" => server_certificates,
            "verbose" => verbose,
          },
        }

        describe_server_certificates_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/dissociate_eips_from_loadbalancer.html
      def dissociate_eips_from_load_balancer(eips: [], loadbalancer: "")
        input = {
          config: config,
          properties: properties,
          api_name: "DissociateEipsFromLoadBalancer",
          request_method: "GET",
          request_params: {
            "eips" => eips,
            "loadbalancer" => loadbalancer,
          },
        }

        dissociate_eips_from_load_balancer_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/monitor/get_loadbalancer_monitor.html
      def get_load_balancer_monitor(end_time: "", meters: [], resource: "", resource_type: "", start_time: "", step: "")
        input = {
          config: config,
          properties: properties,
          api_name: "GetLoadBalancerMonitor",
          request_method: "GET",
          request_params: {
            "end_time" => end_time,
            "meters" => meters,
            "resource" => resource,
            "resource_type" => resource_type,
            "start_time" => start_time,
            "step" => step, # step's available values: 5m, 15m, 2h, 1d
          },
        }

        get_load_balancer_monitor_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/modify_loadbalancer_attributes.html
      def modify_load_balancer_attributes(description: "", http_header_size: nil, loadbalancer: "", loadbalancer_name: "", node_count: nil, private_ip: "", security_group: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyLoadBalancerAttributes",
          request_method: "GET",
          request_params: {
            "description" => description,
            "http_header_size" => http_header_size,
            "loadbalancer" => loadbalancer,
            "loadbalancer_name" => loadbalancer_name,
            "node_count" => node_count,
            "private_ip" => private_ip,
            "security_group" => security_group,
          },
        }

        modify_load_balancer_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/modify_loadbalancer_backend_attributes.html
      def modify_load_balancer_backend_attributes(disabled: nil, loadbalancer_backend: "", loadbalancer_backend_name: "", loadbalancer_policy_id: "", port: nil, weight: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyLoadBalancerBackendAttributes",
          request_method: "GET",
          request_params: {
            "disabled" => disabled, # disabled's available values: 0, 1
            "loadbalancer_backend" => loadbalancer_backend,
            "loadbalancer_backend_name" => loadbalancer_backend_name,
            "loadbalancer_policy_id" => loadbalancer_policy_id,
            "port" => port,
            "weight" => weight,
          },
        }

        modify_load_balancer_backend_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/modify_loadbalancer_listener_attributes.html
      def modify_load_balancer_listener_attributes(balance_mode: "", forwardfor: nil, healthy_check_method: "", healthy_check_option: "", listener_option: nil, loadbalancer_listener: "", loadbalancer_listener_name: "", scene: nil, server_certificate_id: [], session_sticky: "", timeout: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyLoadBalancerListenerAttributes",
          request_method: "GET",
          request_params: {
            "balance_mode" => balance_mode,
            "forwardfor" => forwardfor,
            "healthy_check_method" => healthy_check_method,
            "healthy_check_option" => healthy_check_option,
            "listener_option" => listener_option,
            "loadbalancer_listener" => loadbalancer_listener,
            "loadbalancer_listener_name" => loadbalancer_listener_name,
            "scene" => scene,
            "server_certificate_id" => server_certificate_id,
            "session_sticky" => session_sticky,
            "timeout" => timeout,
          },
        }

        modify_load_balancer_listener_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/modify_loadbalancer_policy_attributes.html
      def modify_load_balancer_policy_attributes(loadbalancer_policy: "", loadbalancer_policy_name: "", operator: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyLoadBalancerPolicyAttributes",
          request_method: "GET",
          request_params: {
            "loadbalancer_policy" => loadbalancer_policy,
            "loadbalancer_policy_name" => loadbalancer_policy_name,
            "operator" => operator,
          },
        }

        modify_load_balancer_policy_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/modify_loadbalancer_policy_rule_attributes.html
      def modify_load_balancer_policy_rule_attributes(loadbalancer_policy_rule: "", loadbalancer_policy_rule_name: "", val: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyLoadBalancerPolicyRuleAttributes",
          request_method: "GET",
          request_params: {
            "loadbalancer_policy_rule" => loadbalancer_policy_rule,
            "loadbalancer_policy_rule_name" => loadbalancer_policy_rule_name,
            "val" => val,
          },
        }

        modify_load_balancer_policy_rule_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/modify_server_certificate_attributes.html
      def modify_server_certificate_attributes(description: "", server_certificate: "", server_certificate_name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyServerCertificateAttributes",
          request_method: "GET",
          request_params: {
            "description" => description,
            "server_certificate" => server_certificate,
            "server_certificate_name" => server_certificate_name,
          },
        }

        modify_server_certificate_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/resize_loadbalancers.html
      def resize_load_balancers(loadbalancer_type: nil, loadbalancers: [])
        input = {
          config: config,
          properties: properties,
          api_name: "ResizeLoadBalancers",
          request_method: "GET",
          request_params: {
            "loadbalancer_type" => loadbalancer_type, # loadbalancer_type's available values: 0, 1, 2, 3, 4, 5
            "loadbalancers" => loadbalancers,
          },
        }

        resize_load_balancers_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/start_loadbalancers.html
      def start_load_balancers(loadbalancers: [])
        input = {
          config: config,
          properties: properties,
          api_name: "StartLoadBalancers",
          request_method: "GET",
          request_params: {
            "loadbalancers" => loadbalancers,
          },
        }

        start_load_balancers_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/stop_loadbalancers.html
      def stop_load_balancers(loadbalancers: [])
        input = {
          config: config,
          properties: properties,
          api_name: "StopLoadBalancers",
          request_method: "GET",
          request_params: {
            "loadbalancers" => loadbalancers,
          },
        }

        stop_load_balancers_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/lb/update_loadbalancers.html
      def update_load_balancers(loadbalancers: [])
        input = {
          config: config,
          properties: properties,
          api_name: "UpdateLoadBalancers",
          request_method: "GET",
          request_params: {
            "loadbalancers" => loadbalancers,
          },
        }

        update_load_balancers_input_validate input

        request = Request.new input
        request.send
      end

      private

      def add_load_balancer_backends_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["backends"].to_s.empty?
          raise ParameterRequiredError.new("backends", "AddLoadBalancerBackendsInput")
        end

        input["request_params"]["backends"].map { |x| }

        if input["request_params"]["loadbalancer_listener"].to_s.empty?
          raise ParameterRequiredError.new("loadbalancer_listener", "AddLoadBalancerBackendsInput")
        end
      end

      def add_load_balancer_listeners_input_validate(input)
        input.deep_stringify_keys!

        input["request_params"]["listeners"].map { |x|
          x["backends"].map { |x| }

          unless x["balance_mode"].to_s.empty?
            balance_mode_valid_values = ["roundrobin", "leastconn", "source"]
            unless balance_mode_valid_values.include? x["balance_mode"].to_s
              raise ParameterValueNotAllowedError.new(
                "balance_mode",
                x["balance_mode"],
                balance_mode_valid_values
              )
            end
          end
        }
      end

      def add_load_balancer_policy_rules_input_validate(input)
        input.deep_stringify_keys!

        input["request_params"]["rules"].map { |x| }
      end

      def apply_load_balancer_policy_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["loadbalancer_policy"].to_s.empty?
          raise ParameterRequiredError.new("loadbalancer_policy", "ApplyLoadBalancerPolicyInput")
        end
      end

      def associate_eips_to_load_balancer_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["eips"].to_s.empty?
          raise ParameterRequiredError.new("eips", "AssociateEipsToLoadBalancerInput")
        end

        if input["request_params"]["loadbalancer"].to_s.empty?
          raise ParameterRequiredError.new("loadbalancer", "AssociateEipsToLoadBalancerInput")
        end
      end

      def create_load_balancer_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["cluster_mode"].to_s.empty?
          cluster_mode_valid_values = ["0", "1"]
          unless cluster_mode_valid_values.include? input["request_params"]["cluster_mode"].to_s
            raise ParameterValueNotAllowedError.new(
              "cluster_mode",
              input["request_params"]["cluster_mode"],
              cluster_mode_valid_values
            )
          end
        end

        unless input["request_params"]["loadbalancer_type"].to_s.empty?
          loadbalancer_type_valid_values = ["0", "1", "2", "3", "4", "5"]
          unless loadbalancer_type_valid_values.include? input["request_params"]["loadbalancer_type"].to_s
            raise ParameterValueNotAllowedError.new(
              "loadbalancer_type",
              input["request_params"]["loadbalancer_type"],
              loadbalancer_type_valid_values
            )
          end
        end

        unless input["request_params"]["mode"].to_s.empty?
          mode_valid_values = ["0", "1"]
          unless mode_valid_values.include? input["request_params"]["mode"].to_s
            raise ParameterValueNotAllowedError.new(
              "mode",
              input["request_params"]["mode"],
              mode_valid_values
            )
          end
        end
      end

      def create_load_balancer_policy_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["loadbalancer_policy_name"].to_s.empty?
          raise ParameterRequiredError.new("loadbalancer_policy_name", "CreateLoadBalancerPolicyInput")
        end

        unless input["request_params"]["operator"].to_s.empty?
          operator_valid_values = ["or", "and"]
          unless operator_valid_values.include? input["request_params"]["operator"].to_s
            raise ParameterValueNotAllowedError.new(
              "operator",
              input["request_params"]["operator"],
              operator_valid_values
            )
          end
        end
      end

      def create_server_certificate_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["certificate_content"].to_s.empty?
          raise ParameterRequiredError.new("certificate_content", "CreateServerCertificateInput")
        end

        if input["request_params"]["private_key"].to_s.empty?
          raise ParameterRequiredError.new("private_key", "CreateServerCertificateInput")
        end
      end

      def delete_load_balancer_backends_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["loadbalancer_backends"].to_s.empty?
          raise ParameterRequiredError.new("loadbalancer_backends", "DeleteLoadBalancerBackendsInput")
        end
      end

      def delete_load_balancer_listeners_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["loadbalancer_listeners"].to_s.empty?
          raise ParameterRequiredError.new("loadbalancer_listeners", "DeleteLoadBalancerListenersInput")
        end
      end

      def delete_load_balancer_policies_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["loadbalancer_policies"].to_s.empty?
          raise ParameterRequiredError.new("loadbalancer_policies", "DeleteLoadBalancerPoliciesInput")
        end
      end

      def delete_load_balancer_policy_rules_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["loadbalancer_policy_rules"].to_s.empty?
          raise ParameterRequiredError.new("loadbalancer_policy_rules", "DeleteLoadBalancerPolicyRulesInput")
        end
      end

      def delete_load_balancers_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["loadbalancers"].to_s.empty?
          raise ParameterRequiredError.new("loadbalancers", "DeleteLoadBalancersInput")
        end
      end

      def delete_server_certificates_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["server_certificates"].to_s.empty?
          raise ParameterRequiredError.new("server_certificates", "DeleteServerCertificatesInput")
        end
      end

      def describe_load_balancer_backends_input_validate(input)
        input.deep_stringify_keys!
      end

      def describe_load_balancer_listeners_input_validate(input)
        input.deep_stringify_keys!
      end

      def describe_load_balancer_policies_input_validate(input)
        input.deep_stringify_keys!
      end

      def describe_load_balancer_policy_rules_input_validate(input)
        input.deep_stringify_keys!
      end

      def describe_load_balancers_input_validate(input)
        input.deep_stringify_keys!
      end

      def describe_server_certificates_input_validate(input)
        input.deep_stringify_keys!
      end

      def dissociate_eips_from_load_balancer_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["eips"].to_s.empty?
          raise ParameterRequiredError.new("eips", "DissociateEipsFromLoadBalancerInput")
        end

        if input["request_params"]["loadbalancer"].to_s.empty?
          raise ParameterRequiredError.new("loadbalancer", "DissociateEipsFromLoadBalancerInput")
        end
      end

      def get_load_balancer_monitor_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["end_time"].to_s.empty?
          raise ParameterRequiredError.new("end_time", "GetLoadBalancerMonitorInput")
        end

        if input["request_params"]["meters"].to_s.empty?
          raise ParameterRequiredError.new("meters", "GetLoadBalancerMonitorInput")
        end

        if input["request_params"]["resource"].to_s.empty?
          raise ParameterRequiredError.new("resource", "GetLoadBalancerMonitorInput")
        end

        if input["request_params"]["start_time"].to_s.empty?
          raise ParameterRequiredError.new("start_time", "GetLoadBalancerMonitorInput")
        end

        if input["request_params"]["step"].to_s.empty?
          raise ParameterRequiredError.new("step", "GetLoadBalancerMonitorInput")
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

      def modify_load_balancer_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["loadbalancer"].to_s.empty?
          raise ParameterRequiredError.new("loadbalancer", "ModifyLoadBalancerAttributesInput")
        end
      end

      def modify_load_balancer_backend_attributes_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["disabled"].to_s.empty?
          disabled_valid_values = ["0", "1"]
          unless disabled_valid_values.include? input["request_params"]["disabled"].to_s
            raise ParameterValueNotAllowedError.new(
              "disabled",
              input["request_params"]["disabled"],
              disabled_valid_values
            )
          end
        end
      end

      def modify_load_balancer_listener_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["loadbalancer_listener"].to_s.empty?
          raise ParameterRequiredError.new("loadbalancer_listener", "ModifyLoadBalancerListenerAttributesInput")
        end
      end

      def modify_load_balancer_policy_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["loadbalancer_policy"].to_s.empty?
          raise ParameterRequiredError.new("loadbalancer_policy", "ModifyLoadBalancerPolicyAttributesInput")
        end
      end

      def modify_load_balancer_policy_rule_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["loadbalancer_policy_rule"].to_s.empty?
          raise ParameterRequiredError.new("loadbalancer_policy_rule", "ModifyLoadBalancerPolicyRuleAttributesInput")
        end
      end

      def modify_server_certificate_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["server_certificate"].to_s.empty?
          raise ParameterRequiredError.new("server_certificate", "ModifyServerCertificateAttributesInput")
        end
      end

      def resize_load_balancers_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["loadbalancer_type"].to_s.empty?
          loadbalancer_type_valid_values = ["0", "1", "2", "3", "4", "5"]
          unless loadbalancer_type_valid_values.include? input["request_params"]["loadbalancer_type"].to_s
            raise ParameterValueNotAllowedError.new(
              "loadbalancer_type",
              input["request_params"]["loadbalancer_type"],
              loadbalancer_type_valid_values
            )
          end
        end
      end

      def start_load_balancers_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["loadbalancers"].to_s.empty?
          raise ParameterRequiredError.new("loadbalancers", "StartLoadBalancersInput")
        end
      end

      def stop_load_balancers_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["loadbalancers"].to_s.empty?
          raise ParameterRequiredError.new("loadbalancers", "StopLoadBalancersInput")
        end
      end

      def update_load_balancers_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["loadbalancers"].to_s.empty?
          raise ParameterRequiredError.new("loadbalancers", "UpdateLoadBalancersInput")
        end
      end
    end
  end
end
