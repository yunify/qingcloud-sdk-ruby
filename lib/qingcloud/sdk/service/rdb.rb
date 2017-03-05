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
    class RDBService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config     = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/rdb/apply_rdb_parameter_group.html
      def apply_rdb_parameter_group(rdb: '')
        input = {
          config:         config,
          properties:     properties,
          api_name:       'ApplyRDBParameterGroup',
          request_method: 'GET',
          request_params: {
            'rdb' => rdb,
          },
        }

        apply_rdb_parameter_group_input_validate input

        request = Request.new input
        request.send
      end

      private

      def apply_rdb_parameter_group_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['rdb'].nil? && !input['request_params']['rdb'].to_s.empty?
          raise ParameterRequiredError.new('rdb', 'ApplyRDBParameterGroupInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/rdb/cease_rdb_instance.html
      def cease_rdb_instance(rdb: '', rdb_instance: '')
        input = {
          config:         config,
          properties:     properties,
          api_name:       'CeaseRDBInstance',
          request_method: 'GET',
          request_params: {
            'rdb'          => rdb,
            'rdb_instance' => rdb_instance,
          },
        }

        cease_rdb_instance_input_validate input

        request = Request.new input
        request.send
      end

      private

      def cease_rdb_instance_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['rdb'].nil? && !input['request_params']['rdb'].to_s.empty?
          raise ParameterRequiredError.new('rdb', 'CeaseRDBInstanceInput')
        end

        unless !input['request_params']['rdb_instance'].nil? && !input['request_params']['rdb_instance'].to_s.empty?
          raise ParameterRequiredError.new('rdb_instance', 'CeaseRDBInstanceInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/rdb/copy_rdb_instance_files_to_ftp.html
      def copy_rdb_instance_files_to_f_t_p(files: [], rdb_instance: '')
        input = {
          config:         config,
          properties:     properties,
          api_name:       'CopyRDBInstanceFilesToFTP',
          request_method: 'GET',
          request_params: {
            'files'        => files,
            'rdb_instance' => rdb_instance,
          },
        }

        copy_rdb_instance_files_to_f_t_p_input_validate input

        request = Request.new input
        request.send
      end

      private

      def copy_rdb_instance_files_to_f_t_p_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['files'].nil? && !input['request_params']['files'].to_s.empty?
          raise ParameterRequiredError.new('files', 'CopyRDBInstanceFilesToFTPInput')
        end

        unless !input['request_params']['rdb_instance'].nil? && !input['request_params']['rdb_instance'].to_s.empty?
          raise ParameterRequiredError.new('rdb_instance', 'CopyRDBInstanceFilesToFTPInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/rdb/create_rdb.html
      def create_rdb(auto_backup_time: nil, description: '', engine_version: '', node_count: nil, private_ips: [], proxy_count: nil, rdb_class: nil, rdb_engine: '', rdb_name: '', rdb_password: '', rdb_type: nil, rdb_username: '', storage_size: nil, vxnet: '')
        input = {
          config:         config,
          properties:     properties,
          api_name:       'CreateRDB',
          request_method: 'GET',
          request_params: {
            'auto_backup_time' => auto_backup_time,
            'description'      => description,
            'engine_version'   => engine_version, # engine_version's available values: mysql,5.5, mysql,5.6, mysql,5.7, psql,9.3, psql,9.4
            'node_count'       => node_count,
            'private_ips'      => private_ips,
            'proxy_count'      => proxy_count,
            'rdb_class'        => rdb_class,
            'rdb_engine'       => rdb_engine, # rdb_engine's available values: mysql, psql
            'rdb_name'         => rdb_name,
            'rdb_password'     => rdb_password,
            'rdb_type'         => rdb_type, # rdb_type's available values: 1, 2, 4, 8, 16, 32
            'rdb_username'     => rdb_username,
            'storage_size'     => storage_size,
            'vxnet'            => vxnet,
          },
        }

        create_rdb_input_validate input

        request = Request.new input
        request.send
      end

      private

      def create_rdb_input_validate(input)
        input.deep_stringify_keys!

        if input['request_params']['engine_version'] && !input['request_params']['engine_version'].to_s.empty?
          engine_version_valid_values = ['mysql,5.5', 'mysql,5.6', 'mysql,5.7', 'psql,9.3', 'psql,9.4']
          unless engine_version_valid_values.include? input['request_params']['engine_version'].to_s
            raise ParameterValueNotAllowedError.new(
              'engine_version',
              input['request_params']['engine_version'],
              engine_version_valid_values,
            )
          end
        end

        input['request_params']['private_ips'].map do |x|
        end

        if input['request_params']['rdb_engine'] && !input['request_params']['rdb_engine'].to_s.empty?
          rdb_engine_valid_values = %w(mysql psql)
          unless rdb_engine_valid_values.include? input['request_params']['rdb_engine'].to_s
            raise ParameterValueNotAllowedError.new(
              'rdb_engine',
              input['request_params']['rdb_engine'],
              rdb_engine_valid_values,
            )
          end
        end

        unless !input['request_params']['rdb_password'].nil? && !input['request_params']['rdb_password'].to_s.empty?
          raise ParameterRequiredError.new('rdb_password', 'CreateRDBInput')
        end

        unless !input['request_params']['rdb_type'].nil? && !input['request_params']['rdb_type'].to_s.empty?
          raise ParameterRequiredError.new('rdb_type', 'CreateRDBInput')
        end

        if input['request_params']['rdb_type'] && !input['request_params']['rdb_type'].to_s.empty?
          rdb_type_valid_values = %w(1 2 4 8 16 32)
          unless rdb_type_valid_values.include? input['request_params']['rdb_type'].to_s
            raise ParameterValueNotAllowedError.new(
              'rdb_type',
              input['request_params']['rdb_type'],
              rdb_type_valid_values,
            )
          end
        end

        unless !input['request_params']['rdb_username'].nil? && !input['request_params']['rdb_username'].to_s.empty?
          raise ParameterRequiredError.new('rdb_username', 'CreateRDBInput')
        end

        unless !input['request_params']['storage_size'].nil? && !input['request_params']['storage_size'].to_s.empty?
          raise ParameterRequiredError.new('storage_size', 'CreateRDBInput')
        end

        unless !input['request_params']['vxnet'].nil? && !input['request_params']['vxnet'].to_s.empty?
          raise ParameterRequiredError.new('vxnet', 'CreateRDBInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/rdb/create_rdb_from_snapshot.html
      def create_rdb_from_snapshot(auto_backup_time: nil, description: '', engine_version: '', node_count: nil, private_ips: [], proxy_count: nil, rdb_engine: '', rdb_name: '', rdb_type: nil, snapshot: '', storage_size: nil, vxnet: '')
        input = {
          config:         config,
          properties:     properties,
          api_name:       'CreateRDBFromSnapshot',
          request_method: 'GET',
          request_params: {
            'auto_backup_time' => auto_backup_time,
            'description'      => description,
            'engine_version'   => engine_version, # engine_version's available values: mysql,5.5, mysql,5.6, mysql,5.7, psql,9.3, psql,9.4
            'node_count'       => node_count,
            'private_ips'      => private_ips,
            'proxy_count'      => proxy_count,
            'rdb_engine'       => rdb_engine, # rdb_engine's available values: mysql, psql
            'rdb_name'         => rdb_name,
            'rdb_type'         => rdb_type, # rdb_type's available values: 1, 2, 4, 8, 16, 32
            'snapshot'         => snapshot,
            'storage_size'     => storage_size,
            'vxnet'            => vxnet,
          },
        }

        create_rdb_from_snapshot_input_validate input

        request = Request.new input
        request.send
      end

      private

      def create_rdb_from_snapshot_input_validate(input)
        input.deep_stringify_keys!

        if input['request_params']['engine_version'] && !input['request_params']['engine_version'].to_s.empty?
          engine_version_valid_values = ['mysql,5.5', 'mysql,5.6', 'mysql,5.7', 'psql,9.3', 'psql,9.4']
          unless engine_version_valid_values.include? input['request_params']['engine_version'].to_s
            raise ParameterValueNotAllowedError.new(
              'engine_version',
              input['request_params']['engine_version'],
              engine_version_valid_values,
            )
          end
        end

        input['request_params']['private_ips'].map do |x|
        end

        if input['request_params']['rdb_engine'] && !input['request_params']['rdb_engine'].to_s.empty?
          rdb_engine_valid_values = %w(mysql psql)
          unless rdb_engine_valid_values.include? input['request_params']['rdb_engine'].to_s
            raise ParameterValueNotAllowedError.new(
              'rdb_engine',
              input['request_params']['rdb_engine'],
              rdb_engine_valid_values,
            )
          end
        end

        unless !input['request_params']['rdb_type'].nil? && !input['request_params']['rdb_type'].to_s.empty?
          raise ParameterRequiredError.new('rdb_type', 'CreateRDBFromSnapshotInput')
        end

        if input['request_params']['rdb_type'] && !input['request_params']['rdb_type'].to_s.empty?
          rdb_type_valid_values = %w(1 2 4 8 16 32)
          unless rdb_type_valid_values.include? input['request_params']['rdb_type'].to_s
            raise ParameterValueNotAllowedError.new(
              'rdb_type',
              input['request_params']['rdb_type'],
              rdb_type_valid_values,
            )
          end
        end

        unless !input['request_params']['snapshot'].nil? && !input['request_params']['snapshot'].to_s.empty?
          raise ParameterRequiredError.new('snapshot', 'CreateRDBFromSnapshotInput')
        end

        unless !input['request_params']['vxnet'].nil? && !input['request_params']['vxnet'].to_s.empty?
          raise ParameterRequiredError.new('vxnet', 'CreateRDBFromSnapshotInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/rdb/create_temp_rdb_instance_from_snapshot.html
      def create_temp_rdb_instance_from_snapshot(rdb: '', snapshot: '')
        input = {
          config:         config,
          properties:     properties,
          api_name:       'CreateTempRDBInstanceFromSnapshot',
          request_method: 'GET',
          request_params: {
            'rdb'      => rdb,
            'snapshot' => snapshot,
          },
        }

        create_temp_rdb_instance_from_snapshot_input_validate input

        request = Request.new input
        request.send
      end

      private

      def create_temp_rdb_instance_from_snapshot_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['rdb'].nil? && !input['request_params']['rdb'].to_s.empty?
          raise ParameterRequiredError.new('rdb', 'CreateTempRDBInstanceFromSnapshotInput')
        end

        unless !input['request_params']['snapshot'].nil? && !input['request_params']['snapshot'].to_s.empty?
          raise ParameterRequiredError.new('snapshot', 'CreateTempRDBInstanceFromSnapshotInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/rdb/delete_rdbs.html
      def delete_rdbs(rdbs: [])
        input = {
          config:         config,
          properties:     properties,
          api_name:       'DeleteRDBs',
          request_method: 'GET',
          request_params: {
            'rdbs' => rdbs,
          },
        }

        delete_rdbs_input_validate input

        request = Request.new input
        request.send
      end

      private

      def delete_rdbs_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['rdbs'].nil? && !input['request_params']['rdbs'].to_s.empty?
          raise ParameterRequiredError.new('rdbs', 'DeleteRDBsInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/rdb/describe_rdb_parameters.html
      def describe_rdb_parameters(limit: nil, offset: nil, parameter_group: '', rdb: '')
        input = {
          config:         config,
          properties:     properties,
          api_name:       'DescribeRDBParameters',
          request_method: 'GET',
          request_params: {
            'limit'           => limit,
            'offset'          => offset,
            'parameter_group' => parameter_group,
            'rdb'             => rdb,
          },
        }

        describe_rdb_parameters_input_validate input

        request = Request.new input
        request.send
      end

      private

      def describe_rdb_parameters_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['rdb'].nil? && !input['request_params']['rdb'].to_s.empty?
          raise ParameterRequiredError.new('rdb', 'DescribeRDBParametersInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/rdb/describe_rdbs.html
      def describe_rdbs(limit: nil, offset: nil, rdb_engine: '', rdb_name: '', rdbs: [], search_word: '', status: [], tags: [], verbose: nil)
        input = {
          config:         config,
          properties:     properties,
          api_name:       'DescribeRDBs',
          request_method: 'GET',
          request_params: {
            'limit'       => limit,
            'offset'      => offset,
            'rdb_engine'  => rdb_engine,
            'rdb_name'    => rdb_name,
            'rdbs'        => rdbs,
            'search_word' => search_word,
            'status'      => status,
            'tags'        => tags,
            'verbose'     => verbose,
          },
        }

        describe_rdbs_input_validate input

        request = Request.new input
        request.send
      end

      private

      def describe_rdbs_input_validate(input)
        input.deep_stringify_keys!
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/rdb/get_rdb_instance_files.html
      def get_rdb_instance_files(rdb_instance: '')
        input = {
          config:         config,
          properties:     properties,
          api_name:       'GetRDBInstanceFiles',
          request_method: 'GET',
          request_params: {
            'rdb_instance' => rdb_instance,
          },
        }

        get_rdb_instance_files_input_validate input

        request = Request.new input
        request.send
      end

      private

      def get_rdb_instance_files_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['rdb_instance'].nil? && !input['request_params']['rdb_instance'].to_s.empty?
          raise ParameterRequiredError.new('rdb_instance', 'GetRDBInstanceFilesInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/monitor/get_rdb_monitor.html
      def get_rdb_monitor(end_time: '', meters: [], rdb_engine: '', rdb_instance: '', resource: '', role: '', start_time: '', step: '')
        input = {
          config:         config,
          properties:     properties,
          api_name:       'GetRDBMonitor',
          request_method: 'GET',
          request_params: {
            'end_time'     => end_time,
            'meters'       => meters,
            'rdb_engine'   => rdb_engine,
            'rdb_instance' => rdb_instance,
            'resource'     => resource,
            'role'         => role,
            'start_time'   => start_time,
            'step'         => step, # step's available values: 5m, 15m, 2h, 1d
          },
        }

        get_rdb_monitor_input_validate input

        request = Request.new input
        request.send
      end

      private

      def get_rdb_monitor_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['end_time'].nil? && !input['request_params']['end_time'].to_s.empty?
          raise ParameterRequiredError.new('end_time', 'GetRDBMonitorInput')
        end

        unless !input['request_params']['meters'].nil? && !input['request_params']['meters'].to_s.empty?
          raise ParameterRequiredError.new('meters', 'GetRDBMonitorInput')
        end

        unless !input['request_params']['rdb_engine'].nil? && !input['request_params']['rdb_engine'].to_s.empty?
          raise ParameterRequiredError.new('rdb_engine', 'GetRDBMonitorInput')
        end

        unless !input['request_params']['resource'].nil? && !input['request_params']['resource'].to_s.empty?
          raise ParameterRequiredError.new('resource', 'GetRDBMonitorInput')
        end

        unless !input['request_params']['role'].nil? && !input['request_params']['role'].to_s.empty?
          raise ParameterRequiredError.new('role', 'GetRDBMonitorInput')
        end

        unless !input['request_params']['start_time'].nil? && !input['request_params']['start_time'].to_s.empty?
          raise ParameterRequiredError.new('start_time', 'GetRDBMonitorInput')
        end

        unless !input['request_params']['step'].nil? && !input['request_params']['step'].to_s.empty?
          raise ParameterRequiredError.new('step', 'GetRDBMonitorInput')
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

      # Documentation URL: https://docs.qingcloud.com/api/rdb/modify_rdb_parameters.html
      def modify_rdb_parameters(parameters: [], rdb: '')
        input = {
          config:         config,
          properties:     properties,
          api_name:       'ModifyRDBParameters',
          request_method: 'GET',
          request_params: {
            'parameters' => parameters,
            'rdb'        => rdb,
          },
        }

        modify_rdb_parameters_input_validate input

        request = Request.new input
        request.send
      end

      private

      def modify_rdb_parameters_input_validate(input)
        input.deep_stringify_keys!

        input['request_params']['parameters'].map do |x|
        end

        unless !input['request_params']['rdb'].nil? && !input['request_params']['rdb'].to_s.empty?
          raise ParameterRequiredError.new('rdb', 'ModifyRDBParametersInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/rdb/rdbs_join_vxnet.html
      def rdbs_join_vxnet(rdbs: [], vxnet: '')
        input = {
          config:         config,
          properties:     properties,
          api_name:       'RDBsJoinVxnet',
          request_method: 'GET',
          request_params: {
            'rdbs'  => rdbs,
            'vxnet' => vxnet,
          },
        }

        rdbs_join_vxnet_input_validate input

        request = Request.new input
        request.send
      end

      private

      def rdbs_join_vxnet_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['rdbs'].nil? && !input['request_params']['rdbs'].to_s.empty?
          raise ParameterRequiredError.new('rdbs', 'RDBsJoinVxnetInput')
        end

        unless !input['request_params']['vxnet'].nil? && !input['request_params']['vxnet'].to_s.empty?
          raise ParameterRequiredError.new('vxnet', 'RDBsJoinVxnetInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/rdb/rdbs_leave_vxnet.html
      def rdbs_leave_vxnet(rdbs: [], vxnet: '')
        input = {
          config:         config,
          properties:     properties,
          api_name:       'RDBsLeaveVxnet',
          request_method: 'GET',
          request_params: {
            'rdbs'  => rdbs,
            'vxnet' => vxnet,
          },
        }

        rdbs_leave_vxnet_input_validate input

        request = Request.new input
        request.send
      end

      private

      def rdbs_leave_vxnet_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['rdbs'].nil? && !input['request_params']['rdbs'].to_s.empty?
          raise ParameterRequiredError.new('rdbs', 'RDBsLeaveVxnetInput')
        end

        unless !input['request_params']['vxnet'].nil? && !input['request_params']['vxnet'].to_s.empty?
          raise ParameterRequiredError.new('vxnet', 'RDBsLeaveVxnetInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/rdb/resize_rdbs.html
      def resize_rdbs(rdb_type: nil, rdbs: [], storage_size: nil)
        input = {
          config:         config,
          properties:     properties,
          api_name:       'ResizeRDBs',
          request_method: 'GET',
          request_params: {
            'rdb_type'     => rdb_type, # rdb_type's available values: 1, 2, 4, 8, 16, 32
            'rdbs'         => rdbs,
            'storage_size' => storage_size,
          },
        }

        resize_rdbs_input_validate input

        request = Request.new input
        request.send
      end

      private

      def resize_rdbs_input_validate(input)
        input.deep_stringify_keys!

        if input['request_params']['rdb_type'] && !input['request_params']['rdb_type'].to_s.empty?
          rdb_type_valid_values = %w(1 2 4 8 16 32)
          unless rdb_type_valid_values.include? input['request_params']['rdb_type'].to_s
            raise ParameterValueNotAllowedError.new(
              'rdb_type',
              input['request_params']['rdb_type'],
              rdb_type_valid_values,
            )
          end
        end

        unless !input['request_params']['rdbs'].nil? && !input['request_params']['rdbs'].to_s.empty?
          raise ParameterRequiredError.new('rdbs', 'ResizeRDBsInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/rdb/start_rdbs.html
      def start_rdbs(rdbs: [])
        input = {
          config:         config,
          properties:     properties,
          api_name:       'StartRDBs',
          request_method: 'GET',
          request_params: {
            'rdbs' => rdbs,
          },
        }

        start_rdbs_input_validate input

        request = Request.new input
        request.send
      end

      private

      def start_rdbs_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['rdbs'].nil? && !input['request_params']['rdbs'].to_s.empty?
          raise ParameterRequiredError.new('rdbs', 'StartRDBsInput')
        end
      end

      public

      # Documentation URL: https://docs.qingcloud.com/api/rdb/stop_rdbs.html
      def stop_rdbs(rdbs: [])
        input = {
          config:         config,
          properties:     properties,
          api_name:       'StopRDBs',
          request_method: 'GET',
          request_params: {
            'rdbs' => rdbs,
          },
        }

        stop_rdbs_input_validate input

        request = Request.new input
        request.send
      end

      private

      def stop_rdbs_input_validate(input)
        input.deep_stringify_keys!

        unless !input['request_params']['rdbs'].nil? && !input['request_params']['rdbs'].to_s.empty?
          raise ParameterRequiredError.new('rdbs', 'StopRDBsInput')
        end
      end

      public
    end
  end
end
