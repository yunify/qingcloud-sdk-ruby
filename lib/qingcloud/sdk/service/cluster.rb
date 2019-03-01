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
    class ClusterService
      attr_accessor :config, :properties

      def initialize(config, properties)
        self.config = config
        self.properties = properties.deep_symbolize_keys
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/add_cluster_nodes.html
      def add_cluster_nodes(cluster: "", node_count: nil, node_name: "", node_role: "", private_ips: [], resource_conf: "")
        input = {
          config: config,
          properties: properties,
          api_name: "AddClusterNodes",
          request_method: "GET",
          request_params: {
            "cluster" => cluster,
            "node_count" => node_count,
            "node_name" => node_name,
            "node_role" => node_role,
            "private_ips" => private_ips,
            "resource_conf" => resource_conf,
          },
        }

        add_cluster_nodes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/associate_eip_to_cluster_node.html
      def associate_eip_to_cluster_node(cluster_node: "", eip: "", nic: "")
        input = {
          config: config,
          properties: properties,
          api_name: "AssociateEipToClusterNode",
          request_method: "GET",
          request_params: {
            "cluster_node" => cluster_node,
            "eip" => eip,
            "nic" => nic,
          },
        }

        associate_eip_to_cluster_node_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/cease_clusters.html
      def cease_clusters(clusters: [])
        input = {
          config: config,
          properties: properties,
          api_name: "CeaseClusters",
          request_method: "GET",
          request_params: {
            "clusters" => clusters,
          },
        }

        cease_clusters_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/change_cluster_vxnet.html
      def change_cluster_vxnet(cluster: "", private_ips: [], roles: [], vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ChangeClusterVxnet",
          request_method: "GET",
          request_params: {
            "cluster" => cluster,
            "private_ips" => private_ips,
            "roles" => roles,
            "vxnet" => vxnet,
          },
        }

        change_cluster_vxnet_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/create_cluster.html
      def create_cluster(conf: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateCluster",
          request_method: "GET",
          request_params: {
            "conf" => conf,
          },
        }

        create_cluster_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/create_cluster_from_snapshot.html
      def create_cluster_from_snapshot(conf: "", snapshot_id: "")
        input = {
          config: config,
          properties: properties,
          api_name: "CreateClusterFromSnapshot",
          request_method: "GET",
          request_params: {
            "conf" => conf,
            "snapshot_id" => snapshot_id,
          },
        }

        create_cluster_from_snapshot_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/delete_cluster_nodes.html
      def delete_cluster_nodes(cluster: "", force: nil, nodes: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteClusterNodes",
          request_method: "GET",
          request_params: {
            "cluster" => cluster,
            "force" => force,
            "nodes" => nodes,
          },
        }

        delete_cluster_nodes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/delete_clusters.html
      def delete_clusters(clusters: [], force: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DeleteClusters",
          request_method: "GET",
          request_params: {
            "clusters" => clusters,
            "force" => force,
          },
        }

        delete_clusters_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/describe_cluster_display_tabs.html
      def describe_cluster_display_tabs(cluster: "", display_tabs: "", role: "")
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeClusterDisplayTabs",
          request_method: "GET",
          request_params: {
            "cluster" => cluster,
            "display_tabs" => display_tabs,
            "role" => role,
          },
        }

        describe_cluster_display_tabs_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/describe_cluster_nodes.html
      def describe_cluster_nodes(cluster: "", console: "", limit: nil, nodes: [], offset: nil, owner: "", reverse: nil, role: "", search_word: "", sort_key: "", status: "", verbose: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeClusterNodes",
          request_method: "GET",
          request_params: {
            "cluster" => cluster,
            "console" => console,
            "limit" => limit,
            "nodes" => nodes,
            "offset" => offset,
            "owner" => owner,
            "reverse" => reverse,
            "role" => role,
            "search_word" => search_word,
            "sort_key" => sort_key,
            "status" => status,
            "verbose" => verbose,
          },
        }

        describe_cluster_nodes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/describe_cluster_users.html
      def describe_cluster_users(app_versions: [], apps: [], cluster_status: [], limit: nil, offset: nil, users: [], zones: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeClusterUsers",
          request_method: "GET",
          request_params: {
            "app_versions" => app_versions,
            "apps" => apps,
            "cluster_status" => cluster_status,
            "limit" => limit,
            "offset" => offset,
            "users" => users,
            "zones" => zones,
          },
        }

        describe_cluster_users_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/describe_clusters.html
      def describe_clusters(app_versions: [], apps: [], cfgmgmt_id: "", clusters: [], console: "", external_cluster_id: "", limit: nil, link: "", name: "", offset: nil, owner: "", reverse: nil, role: "", scope: "", search_word: "", sort_key: "", status: "", transition_status: "", users: [], verbose: nil, vxnet: "")
        input = {
          config: config,
          properties: properties,
          api_name: "DescribeClusters",
          request_method: "GET",
          request_params: {
            "app_versions" => app_versions,
            "apps" => apps,
            "cfgmgmt_id" => cfgmgmt_id,
            "clusters" => clusters,
            "console" => console,
            "external_cluster_id" => external_cluster_id,
            "limit" => limit,
            "link" => link,
            "name" => name,
            "offset" => offset,
            "owner" => owner,
            "reverse" => reverse,
            "role" => role,
            "scope" => scope, # scope's available values: all, cfgmgmt
            "search_word" => search_word,
            "sort_key" => sort_key,
            "status" => status,
            "transition_status" => transition_status,
            "users" => users,
            "verbose" => verbose,
            "vxnet" => vxnet,
          },
        }

        describe_clusters_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/dissociate_eip_from_cluster_node.html
      def dissociate_eip_from_cluster_node(eips: [])
        input = {
          config: config,
          properties: properties,
          api_name: "DissociateEipFromClusterNode",
          request_method: "GET",
          request_params: {
            "eips" => eips,
          },
        }

        dissociate_eip_from_cluster_node_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/modify_cluster_attributes.html
      def modify_cluster_attributes(auto_backup_time: nil, cluster: "", description: "", name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyClusterAttributes",
          request_method: "GET",
          request_params: {
            "auto_backup_time" => auto_backup_time,
            "cluster" => cluster,
            "description" => description,
            "name" => name,
          },
        }

        modify_cluster_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/modify_cluster_node_attributes.html
      def modify_cluster_node_attributes(cluster_node: "", name: "")
        input = {
          config: config,
          properties: properties,
          api_name: "ModifyClusterNodeAttributes",
          request_method: "GET",
          request_params: {
            "cluster_node" => cluster_node,
            "name" => name,
          },
        }

        modify_cluster_node_attributes_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/recover_clusters.html
      def recover_clusters(resources: [])
        input = {
          config: config,
          properties: properties,
          api_name: "Lease",
          request_method: "GET",
          request_params: {
            "resources" => resources,
          },
        }

        recover_clusters_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/resize_cluster.html
      def resize_cluster(cluster: "", cpu: nil, gpu: nil, memory: nil, node_role: "", storage_size: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "ResizeCluster",
          request_method: "GET",
          request_params: {
            "cluster" => cluster,
            "cpu" => cpu,
            "gpu" => gpu,
            "memory" => memory,
            "node_role" => node_role,
            "storage_size" => storage_size,
          },
        }

        resize_cluster_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/restart_cluster_service.html
      def restart_cluster_service(cluster: "", role: "")
        input = {
          config: config,
          properties: properties,
          api_name: "RestartClusterService",
          request_method: "GET",
          request_params: {
            "cluster" => cluster,
            "role" => role,
          },
        }

        restart_cluster_service_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/restore_cluster_from_snapshot.html
      def restore_cluster_from_snapshot(cluster: "", service_params: "", snapshot: "")
        input = {
          config: config,
          properties: properties,
          api_name: "RestoreClusterFromSnapshot",
          request_method: "GET",
          request_params: {
            "cluster" => cluster,
            "service_params" => service_params,
            "snapshot" => snapshot,
          },
        }

        restore_cluster_from_snapshot_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/run_cluster_custom_service.html
      def run_cluster_custom_service(cluster: "", role: "", service: "", service_params: "")
        input = {
          config: config,
          properties: properties,
          api_name: "RunClusterCustomService",
          request_method: "GET",
          request_params: {
            "cluster" => cluster,
            "role" => role,
            "service" => service,
            "service_params" => service_params,
          },
        }

        run_cluster_custom_service_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/start_clusters.html
      def start_clusters(clusters: [])
        input = {
          config: config,
          properties: properties,
          api_name: "StartClusters",
          request_method: "GET",
          request_params: {
            "clusters" => clusters,
          },
        }

        start_clusters_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/stop_clusters.html
      def stop_clusters(clusters: [], force: nil)
        input = {
          config: config,
          properties: properties,
          api_name: "StopClusters",
          request_method: "GET",
          request_params: {
            "clusters" => clusters,
            "force" => force,
          },
        }

        stop_clusters_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/update_cluster_environment.html
      def update_cluster_environment(cluster: "", env: [], roles: [])
        input = {
          config: config,
          properties: properties,
          api_name: "UpdateClusterEnvironment",
          request_method: "GET",
          request_params: {
            "cluster" => cluster,
            "env" => env,
            "roles" => roles,
          },
        }

        update_cluster_environment_input_validate input

        request = Request.new input
        request.send
      end

      # Documentation URL: https://docs.qingcloud.com/api/cluster/upgrade_clusters.html
      def upgrade_clusters(app_version: "", clusters: [], service_params: "")
        input = {
          config: config,
          properties: properties,
          api_name: "UpgradeClusters",
          request_method: "GET",
          request_params: {
            "app_version" => app_version,
            "clusters" => clusters,
            "service_params" => service_params,
          },
        }

        upgrade_clusters_input_validate input

        request = Request.new input
        request.send
      end

      private

      def add_cluster_nodes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cluster"].to_s.empty?
          raise ParameterRequiredError.new("cluster", "AddClusterNodesInput")
        end

        if input["request_params"]["node_count"].to_s.empty?
          raise ParameterRequiredError.new("node_count", "AddClusterNodesInput")
        end
      end

      def associate_eip_to_cluster_node_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cluster_node"].to_s.empty?
          raise ParameterRequiredError.new("cluster_node", "AssociateEipToClusterNodeInput")
        end

        if input["request_params"]["eip"].to_s.empty?
          raise ParameterRequiredError.new("eip", "AssociateEipToClusterNodeInput")
        end
      end

      def cease_clusters_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["clusters"].to_s.empty?
          raise ParameterRequiredError.new("clusters", "CeaseClustersInput")
        end
      end

      def change_cluster_vxnet_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cluster"].to_s.empty?
          raise ParameterRequiredError.new("cluster", "ChangeClusterVxnetInput")
        end

        if input["request_params"]["vxnet"].to_s.empty?
          raise ParameterRequiredError.new("vxnet", "ChangeClusterVxnetInput")
        end
      end

      def create_cluster_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["conf"].to_s.empty?
          raise ParameterRequiredError.new("conf", "CreateClusterInput")
        end
      end

      def create_cluster_from_snapshot_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["conf"].to_s.empty?
          raise ParameterRequiredError.new("conf", "CreateClusterFromSnapshotInput")
        end

        if input["request_params"]["snapshot_id"].to_s.empty?
          raise ParameterRequiredError.new("snapshot_id", "CreateClusterFromSnapshotInput")
        end
      end

      def delete_cluster_nodes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cluster"].to_s.empty?
          raise ParameterRequiredError.new("cluster", "DeleteClusterNodesInput")
        end

        if input["request_params"]["nodes"].to_s.empty?
          raise ParameterRequiredError.new("nodes", "DeleteClusterNodesInput")
        end
      end

      def delete_clusters_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["clusters"].to_s.empty?
          raise ParameterRequiredError.new("clusters", "DeleteClustersInput")
        end
      end

      def describe_cluster_display_tabs_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cluster"].to_s.empty?
          raise ParameterRequiredError.new("cluster", "DescribeClusterDisplayTabsInput")
        end

        if input["request_params"]["display_tabs"].to_s.empty?
          raise ParameterRequiredError.new("display_tabs", "DescribeClusterDisplayTabsInput")
        end
      end

      def describe_cluster_nodes_input_validate(input)
        input.deep_stringify_keys!
      end

      def describe_cluster_users_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["apps"].to_s.empty?
          raise ParameterRequiredError.new("apps", "DescribeClusterUsersInput")
        end

        if input["request_params"]["zones"].to_s.empty?
          raise ParameterRequiredError.new("zones", "DescribeClusterUsersInput")
        end
      end

      def describe_clusters_input_validate(input)
        input.deep_stringify_keys!

        unless input["request_params"]["scope"].to_s.empty?
          scope_valid_values = ["all", "cfgmgmt"]
          unless scope_valid_values.include? input["request_params"]["scope"].to_s
            raise ParameterValueNotAllowedError.new(
              "scope",
              input["request_params"]["scope"],
              scope_valid_values
            )
          end
        end
      end

      def dissociate_eip_from_cluster_node_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["eips"].to_s.empty?
          raise ParameterRequiredError.new("eips", "DissociateEipFromClusterNodeInput")
        end
      end

      def modify_cluster_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cluster"].to_s.empty?
          raise ParameterRequiredError.new("cluster", "ModifyClusterAttributesInput")
        end
      end

      def modify_cluster_node_attributes_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cluster_node"].to_s.empty?
          raise ParameterRequiredError.new("cluster_node", "ModifyClusterNodeAttributesInput")
        end
      end

      def recover_clusters_input_validate(input)
        input.deep_stringify_keys!
      end

      def resize_cluster_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cluster"].to_s.empty?
          raise ParameterRequiredError.new("cluster", "ResizeClusterInput")
        end
      end

      def restart_cluster_service_input_validate(input)
        input.deep_stringify_keys!
      end

      def restore_cluster_from_snapshot_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cluster"].to_s.empty?
          raise ParameterRequiredError.new("cluster", "RestoreClusterFromSnapshotInput")
        end

        if input["request_params"]["snapshot"].to_s.empty?
          raise ParameterRequiredError.new("snapshot", "RestoreClusterFromSnapshotInput")
        end
      end

      def run_cluster_custom_service_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["cluster"].to_s.empty?
          raise ParameterRequiredError.new("cluster", "RunClusterCustomServiceInput")
        end

        if input["request_params"]["service"].to_s.empty?
          raise ParameterRequiredError.new("service", "RunClusterCustomServiceInput")
        end
      end

      def start_clusters_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["clusters"].to_s.empty?
          raise ParameterRequiredError.new("clusters", "StartClustersInput")
        end
      end

      def stop_clusters_input_validate(input)
        input.deep_stringify_keys!

        if input["request_params"]["clusters"].to_s.empty?
          raise ParameterRequiredError.new("clusters", "StopClustersInput")
        end
      end

      def update_cluster_environment_input_validate(input)
        input.deep_stringify_keys!
      end

      def upgrade_clusters_input_validate(input)
        input.deep_stringify_keys!
      end
    end
  end
end
