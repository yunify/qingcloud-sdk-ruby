# Read the Gherkin grammar here: https://cucumber.io/docs/reference

@vxnet
Feature: the Vxnet service
  The Vxnet service should be available
  As a QingCloud user
  I can operate all action of Vxnet

  # 为私有网络新建一个主机
  Scenario: need a running instance
      Given vxnet a instance configuration:
        | image_id    | instance_type | count | login_mode | login_passwd |
        | centos7x64d | c1m1          | 1     | passwd     | Hello2333    |
      When run vxnet instance
      Then run vxnet instance should get a job ID
      Then run vxnet instance should be sure that instance is running

  # CreateVxnets 创建新的私有网络
  Scenario: need to create vxnets
    When create vxnets
    Then create vxnets should be successfull
    And create vxnets should get 1 vxnets at least

  # DescribeVxnets 获取私有网络列表
  Scenario: want to know all of the vxnets
    When describe vxnets 
    Then describe vxnets should be successfull
    And describe vxnets should have the one I created 

  # ModifyVxnetAttributes 修改私有网络的名称和描述
  Scenario: need to modify vxnet attributes 
     Given vxnet configuration:
      | vxnet_name        | description      |
      | cucumber_demo     | cucumber_demo    |
      When modify vxnet attributes 
      Then modify vxnet attributes should be successfull 
      And modify vxnet attributes should change the vxnet attributes 

    # CreateRouters 创建一台或多台路由器
    Scenario: need to create routers 
      When create routers 
      Then create routers should get a job ID 
      Then create routers will be finished

    # JoinRouter 将一个受管私有网络连接到一台路由器
    Scenario: need to join router 
      When join router 
      Then join router should get a job ID 
      Then join router will be finished

    # JoinVxnet 将主机加入到私有网络
    Scenario: need to join vxnet 
      When join vxnet 
      Then join vxnet should get a job ID
      Then join vxnet will be finished

    # DescribeVxnetInstances 
    Scenario: want to know all of the describe vxnet instances 
      When describe vxnet instances 
      Then describe vxnet instances should be successfull 
      And describe vxnet instances should have the instance I created just before

    # LeaveVxnet 将主机从私有网络中断开
    Scenario: need to leave vxnet
      When leave vxnet 
      Then leave vxnet should get a job ID
      Then leave vxnet will be finished 

    # LeaveRouter 将一个或多个受管私有网络从一台路由器上断开
    Scenario: need to leave router
      When leave router 
      Then leave router should get a job ID 
      Then leave router will be finished

     # DeleteVxnets 删除私有网络
    Scenario: need to delete vxnets 
      When delete vxnets 
      Then delete vxnets should be successfull

    # DeleteRouters 删除一台或多台路由器
    Scenario: need to delete routers 
      When delete routers 
      Then delete routers should get a job ID 
      Then delete routers will be finished 

    # 销毁为私有网络新建的主机
    Scenario: remove vxnet instance
      When remove vxnet instances
      Then remove vxnet instances should get a job ID


    