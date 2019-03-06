# Read the Gherkin grammar here: https://cucumber.io/docs/reference

@instance
Feature: the Instance service
  The Instance service should be available
  As a QingCloud user
  I can operate all action of instance

  # RunInstances 创建指定配置，指定数量的主机
  Scenario: need instance
    Given instance configuration:
      | image_id    | instance_type | count | login_mode | login_passwd |
      | centos7x64d | c1m1          | 1     | passwd     | Hello2333    |
    When run instances
    Then run instances should get a job ID
    Then run instances will be finished

  # DescribeInstances 获取一个或多个主机
  Scenario: want to know all instances
    When describe instances 
    Then describe instances should get 1 instance at least 
    Then describe instances should hava the instance I just created
  
  # StopInstances 关闭一台或多台运行状态的主机
  Scenario: need to stop instances 
    When stop instances 
    Then stop instances should get a job ID 
    Then stop instances will be finished
  
  # StartInstances 启动一台或多台关闭状态的主机
  Scenario: need to start instances
    When start instances 
    Then start instances should get a job ID 
    Then start instances will be finished

  # RestartInstances 重启一台或多台运行状态的主机
  Scenario: need to restart instances
    When restart instances 
    Then restart instances should get a job ID 
    Then restart instances will be finished

  # ResetInstances 将一台或多台主机的系统盘重置到初始状态
  Scenario: need to reset instances
    Given reset instance configuration:
      | login_mode | login_passwd |
      | passwd     | Hello2333    |
    When reset instances 
    Then reset instances should get a job ID 
    Then reset instances will be finished

  # CeaseInstances 
  # Scenario: need to reset instances
  #  When reset instances 
  #  Then reset instances should get a job ID 
  #  Then reset instances will be finished

  # ModifyInstanceAttributes 修改一台主机的名称和描述
  Scenario: need to modify instance attributes
    Given instance attributes:
      | instance_name    |  description   |
      | cucumber_demo    |  cucumber_demo |
    When modify instance attributes
    Then modify instance attributes should be successfull
    And modify instance attributes should change the instance attribuites

  # DescribeInstanceTypes 获取区域支持的主机类型
  Scenario: want to know all instance types
    When describe instance types
    Then describe instance types should get 1 instance type at least
    And describe instance types should have the types I just created

  # TerminateInstances 销毁一台或多台主机
  Scenario: need to remove instance
    When terminate instances
    Then terminate instances should get a job ID
    Then terminate instances will be finished

  # DescribeJobs
  Scenario: want to know all jobs
    When describe jobs
    Then describe jobs should get 2 job at least
    Then describe jobs should have the jobs I just created
