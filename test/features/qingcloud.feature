# Read the Gherkin grammar here: https://cucumber.io/docs/reference

@qingcloud
Feature: the QingCloud service
  The QingCloud service should be available
  As a QingCloud user
  I can list all zones

  # qingcloud_service
  Scenario: need to use QingCloud service
    When initialize QingCloud service
    Then the QingCloud service is initialized

  # DescribeZones
  Scenario: want to know all QingCloud zones
    When describe zones
    Then describe zones should get 1 zone at least
    Then describe zones should have the zone I'm using

  # app_service
  Scenario: need to use app service
    When initialize app service
    Then the app service is initialized

  # cache_service
  Scenario: need to use cache service
    When initialize cache service
    Then the cache service is initialized

  # cluster_service
  Scenario: need to use cluster service
    When initialize cluster service
    Then the cluster service is initialized

  # dns_alias_service
  Scenario: need to use dns_alias service
    When initialize dns_alias service
    Then the dns_alias service is initialized

  # eip_service
  Scenario: need to use eip service
    When initialize eip service
    Then the eip service is initialized

  # image_service
  Scenario: need to use eip service
    When initialize eip service
    Then the eip service is initialized

  # instance_service
  Scenario: need to use instance service
    When initialize instance service
    Then the instance service is initialized

  # job service
  Scenario: need to use job service
    When initialize job service
    Then the job service is initialized

  # key_pair_service
  Scenario: need to use key_pair service
    When initialize key_pair service
    Then the key_pair service is initialized

  # load_balancer_service
  Scenario: need to use load_balancer service
    When initialize load_balancer service
    Then the load_balancer service is initialized

  # misc_service
  Scenario: need to use misc service
    When initialize misc service
    Then the misc service is initialized

  # mongo_service
  Scenario: need to use mongo service
    When initialize mongo service
    Then the mongo service is initialized

  # nic_service 
  Scenario: need to use nic service
    When initialize nic service
    Then the nic service is initialized

  # rdb_service 
  Scenario: need to use rdb service
    When initialize rdb service
    Then the rdb service is initialized

  # router_service
  Scenario: need to use router service
    When initialize router service
    Then the router service is initialized

  # security_group_service
  Scenario: need to use security_group service
    When initialize security_group service
    Then the security_group service is initialized

  # shared_storage_service
  Scenario: need to use shared_storage service
    When initialize shared_storage service
    Then the shared_storage service is initialized

  # snapshot_service
  Scenario: need to use snapshot service
    When initialize snapshot service
    Then the snapshot service is initialized

  # tag_service
  Scenario: need to use tag service
    When initialize tag service
    Then the tag service is initialized

  # user_data_service
  Scenario: need to use user_data service
    When initialize user_data service
    Then the user_data service is initialized

  # volume_service 
  Scenario: need to use volume service
    When initialize volume service
    Then the volume service is initialized

  # vxnet_service
  Scenario: need to use vxnet service
    When initialize vxnet service
    Then the vxnet service is initialized
