@key_pair
Feature: the KeyPair service
  The Eip service should be available
  As a QingCloud user
  I can operate all action of key pairs

  # CreateKeyPair 创建 SSH 密钥对，每对密钥都可加载到任意多台主机中
  Scenario: need to create key pair
    When create key pair 
    Then create key pair should be success 
    And create key pair will get a keypair_id

  # ModifyKeyPairAttributes
  Scenario: need to modify key pair attributes
    Given key pair attributes configuration:
      | keypair_name | description  |
      | cucumber_demo| cucumber_demo|
    When modify key pair attributes
    Then modify key pair attributes will be success 
    And modify key pair attributes should change the name and description

  # DescribeKeyPairs 获取一个或多个 SSH 密钥
  Scenario: want to know all key pairs 
    When describe key pairs 
    Then describe key pair should be success
    And describe key pairs should get at least 1 key pairs

  # 为绑定密钥创建一台主机
  Scenario: need a keypairs instance
    Given keypairs instance configuration:
      | image_id    | instance_type | count | login_mode | login_passwd |
      | centos7x64d | c1m1          | 1     | passwd     | Hello2333    |
    When run keypairs eip instance
    Then run keypairs instance should get a job ID
    Then run keypairs instance be sure that instance is running 
  
  # AttachKeyPairs 将任意数量密钥对加载到任意数量的主机
  Scenario: need to attach key pairs
    When attach key pairs
    Then attach key pairs should get a job ID 
    Then attach key pairs will be finished

  # DetachKeyPairs 将任意数量的密钥对从主机中卸载
  Scenario: need to detach key pairs
    When detach key pairs
    Then detach key pairs should get a job ID 
    Then detach key pairs will be finished

  # DeleteKeyPairs 删除一个或多个你拥有的密钥对
  Scenario: need to delete key pairs 
    When delete key pairs 
    Then delete key pairs should be success 
    And delete key pairs should get the keypairs deleted

  # 销毁为绑定密钥创建的主机
  Scenario: remove keypairs instance
    When remove keypairs instances
    Then remove keypairs instances should get a job ID
