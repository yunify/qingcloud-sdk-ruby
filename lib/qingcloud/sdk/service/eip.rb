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
    class EIPService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config     = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/eip/allocate_eips.html
      def allocate_eips(bandwidth: nil, billing_mode: '', count: nil, eip_name: '', need_icp: nil)
        input = {
          config:         config,
          properties:     properties,
          api_name:       'AllocateEips',
          request_method: 'GET',
          request_params: {
            'bandwidth'    => bandwidth,
            'billing_mode' => billing_mode, # billing_mode's available values: bandwidth, traffic
            'count'        => count,
            'eip_name'     => eip_name,
            'need_icp'     => need_icp, # need_icp's available values: 0, 1
          },
        }

        allocate_eips_input_validate input

        request = Request.new input
        request.send
      end

      private

      def allocate_eips_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['bandwidth'].nil? && !input['request_params']['bandwidth'].to_s.empty?
          raise ParameterRequiredError.new('bandwidth', 'AllocateEipsInput')
        end

        if input['request_params']['billing_mode'] && !input['request_params']['billing_mode'].to_s.empty?
          billing_mode_valid_values = %w(bandwidth traffic)
          unless billing_mode_valid_values.include? input['request_params']['billing_mode'].to_s
            raise ParameterValueNotAllowedError.new(
              'billing_mode',
              input['request_params']['billing_mode'],
              billing_mode_valid_values,
            )
          end
        end

        if input['request_params']['need_icp'] && !input['request_params']['need_icp'].to_s.empty?
          need_icp_valid_values = %w(0 1)
          unless need_icp_valid_values.include? input['request_params']['need_icp'].to_s
            raise ParameterValueNotAllowedError.new(
              'need_icp',
              input['request_params']['need_icp'],
              need_icp_valid_values,
            )
          end
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/eip/associate_eip.html
      def associate_eip(eip: '', instance: '')
        input = {
          config:         config,
          properties:     properties,
          api_name:       'AssociateEip',
          request_method: 'GET',
          request_params: {
            'eip'      => eip,
            'instance' => instance,
          },
        }

        associate_eip_input_validate input

        request = Request.new input
        request.send
      end

      private

      def associate_eip_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['eip'].nil? && !input['request_params']['eip'].to_s.empty?
          raise ParameterRequiredError.new('eip', 'AssociateEipInput')
        end

        unless !input['request_params']['instance'].nil? && !input['request_params']['instance'].to_s.empty?
          raise ParameterRequiredError.new('instance', 'AssociateEipInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/eip/dissociate_eips.html
      def change_eips_bandwidth(bandwidth: nil, eips: [])
        input = {
          config:         config,
          properties:     properties,
          api_name:       'ChangeEipsBandwidth',
          request_method: 'GET',
          request_params: {
            'bandwidth' => bandwidth,
            'eips'      => eips,
          },
        }

        change_eips_bandwidth_input_validate input

        request = Request.new input
        request.send
      end

      private

      def change_eips_bandwidth_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['bandwidth'].nil? && !input['request_params']['bandwidth'].to_s.empty?
          raise ParameterRequiredError.new('bandwidth', 'ChangeEipsBandwidthInput')
        end

        unless !input['request_params']['eips'].nil? && !input['request_params']['eips'].to_s.empty?
          raise ParameterRequiredError.new('eips', 'ChangeEipsBandwidthInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/eip/change_eips_billing_mode.html
      def change_eips_billing_mode(billing_mode: '', eip_group: '', eips: [])
        input = {
          config:         config,
          properties:     properties,
          api_name:       'ChangeEipsBillingMode',
          request_method: 'GET',
          request_params: {
            'billing_mode' => billing_mode, # billing_mode's available values: bandwidth, traffic
            'eip_group'    => eip_group,
            'eips'         => eips,
          },
        }

        change_eips_billing_mode_input_validate input

        request = Request.new input
        request.send
      end

      private

      def change_eips_billing_mode_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['billing_mode'].nil? && !input['request_params']['billing_mode'].to_s.empty?
          raise ParameterRequiredError.new('billing_mode', 'ChangeEipsBillingModeInput')
        end

        if input['request_params']['billing_mode'] && !input['request_params']['billing_mode'].to_s.empty?
          billing_mode_valid_values = %w(bandwidth traffic)
          unless billing_mode_valid_values.include? input['request_params']['billing_mode'].to_s
            raise ParameterValueNotAllowedError.new(
              'billing_mode',
              input['request_params']['billing_mode'],
              billing_mode_valid_values,
            )
          end
        end

        unless !input['request_params']['eips'].nil? && !input['request_params']['eips'].to_s.empty?
          raise ParameterRequiredError.new('eips', 'ChangeEipsBillingModeInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/eip/describe_eips.html
      def describe_eips(eips: [], instance_id: '', limit: nil, offset: nil, search_word: '', status: [], tags: [], verbose: nil)
        input = {
          config:         config,
          properties:     properties,
          api_name:       'DescribeEips',
          request_method: 'GET',
          request_params: {
            'eips'        => eips,
            'instance_id' => instance_id,
            'limit'       => limit,
            'offset'      => offset,
            'search_word' => search_word,
            'status'      => status,
            'tags'        => tags,
            'verbose'     => verbose,
          },
        }

        describe_eips_input_validate input

        request = Request.new input
        request.send
      end

      private

      def describe_eips_input_validate(input)
        input.deep_stringify_keys!
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/eip/dissociate_eips.html
      def dissociate_eips(eips: [])
        input = {
          config:         config,
          properties:     properties,
          api_name:       'DissociateEips',
          request_method: 'GET',
          request_params: {
            'eips' => eips,
          },
        }

        dissociate_eips_input_validate input

        request = Request.new input
        request.send
      end

      private

      def dissociate_eips_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['eips'].nil? && !input['request_params']['eips'].to_s.empty?
          raise ParameterRequiredError.new('eips', 'DissociateEipsInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/monitor/get_monitor.html
      def get_eip_monitor(end_time: '', meters: [], resource: '', start_time: '', step: '')
        input = {
          config:         config,
          properties:     properties,
          api_name:       'GetMonitor',
          request_method: 'GET',
          request_params: {
            'end_time'   => end_time,
            'meters'     => meters,
            'resource'   => resource,
            'start_time' => start_time,
            'step'       => step, # step's available values: 5m, 15m, 2h, 1d
          },
        }

        get_eip_monitor_input_validate input

        request = Request.new input
        request.send
      end

      private

      def get_eip_monitor_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['end_time'].nil? && !input['request_params']['end_time'].to_s.empty?
          raise ParameterRequiredError.new('end_time', 'GetEIPMonitorInput')
        end

        unless !input['request_params']['meters'].nil? && !input['request_params']['meters'].to_s.empty?
          raise ParameterRequiredError.new('meters', 'GetEIPMonitorInput')
        end

        unless !input['request_params']['resource'].nil? && !input['request_params']['resource'].to_s.empty?
          raise ParameterRequiredError.new('resource', 'GetEIPMonitorInput')
        end

        unless !input['request_params']['start_time'].nil? && !input['request_params']['start_time'].to_s.empty?
          raise ParameterRequiredError.new('start_time', 'GetEIPMonitorInput')
        end

        unless !input['request_params']['step'].nil? && !input['request_params']['step'].to_s.empty?
          raise ParameterRequiredError.new('step', 'GetEIPMonitorInput')
        end

        if input['request_params']['step'] && !input['request_params']['step'].to_s.empty?
          step_valid_values = %w(5m 15m 2h 1d)
          unless step_valid_values.include? input['request_params']['step'].to_s
            raise ParameterValueNotAllowedError.new(
              'step',
              input['request_params']['step'],
              step_valid_values,
            )
          end
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/eip/modify_eip_attributes.html
      def modify_eip_attributes(description: '', eip: '', eip_name: '')
        input = {
          config:         config,
          properties:     properties,
          api_name:       'ModifyEipAttributes',
          request_method: 'GET',
          request_params: {
            'description' => description,
            'eip'         => eip,
            'eip_name'    => eip_name,
          },
        }

        modify_eip_attributes_input_validate input

        request = Request.new input
        request.send
      end

      private

      def modify_eip_attributes_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['eip'].nil? && !input['request_params']['eip'].to_s.empty?
          raise ParameterRequiredError.new('eip', 'ModifyEipAttributesInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/eip/release_eips.html
      def release_eips(eips: [])
        input = {
          config:         config,
          properties:     properties,
          api_name:       'ReleaseEips',
          request_method: 'GET',
          request_params: {
            'eips' => eips,
          },
        }

        release_eips_input_validate input

        request = Request.new input
        request.send
      end

      private

      def release_eips_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['eips'].nil? && !input['request_params']['eips'].to_s.empty?
          raise ParameterRequiredError.new('eips', 'ReleaseEipsInput')
        end
      end

      public
    end
  end
end
