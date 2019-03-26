@eip
Feature: the Eip service
  The Eip service should be available
  As a QingCloud user
  I can operate all action of eip

  # 为绑定公网创建一台主机
  Scenario: need a eip instance
    Given eip instance configuration:
      | image_id    | instance_type | count | login_mode | login_passwd |
      | centos7x64d | c1m1          | 1     | passwd     | Hello2333    |
    When run eip instance
    Then run eip instance should get a job ID
    Then run eip instance be sure that instance is running 
  
  # AllocateEips 从IP池中分配一个公网IP，分配时可指定带宽、数量、IP组、名称及是否需要备案
  Scenario: need to allocate eips
    Given eip configuration:
      | bandwidth    |
      | 2            |
    When allocate eips
    Then allocate eips should be success

  # DescribeEips 获取一个或多个公网IP
  Scenario: want to know all eips
    When describe eips 
    Then describe eips should be success
    And describe eips will list all eips I have been allocated

  # ChangeEipsBandwidth 动态改变一个或多个公网IP的带宽，改变后计费系统会同步更新
  Scenario: need to change eips bandwidth
    Given eip bandwidth configuration:
      | bandwidth    |
      | 3            |
    When change eips bandwidth 
    Then change eips bandwidth should get a job ID 
    Then change eips bandwidth will be finished
    And change eips bandwidth will change the bandwidth 

  # ChangeEipsBillingMode 动态改变一个或多个公网IP的计费模式，改变后计费系统会及时更新
  Scenario: need to change eips billing mode
    Given eip billing mode configuration:
      |billing_mode |
      |traffic      |
    When change eips billing mode
    Then change eips billing mode should get a job ID 
    Then change eips billing mode will be finished
    And change eips billing mode will change the billing mode

  # ChangeEipAttributes 修改一个公网IP的名称和描述
  Scenario: need to change eip attributes 
    Given eip attributes configuration:
      | eip_name      | description   |
      | cucumber_demo | cucumber_demo |
    When change eip attributes 
    Then change eip attributes should be success 
    And change eip attributes will change the name and description of eip
  
  # 为绑定公网创建新的私有网络
  Scenario: need to create eip vxnets
    When create eip vxnets
    Then create eip vxnets should be successfull
    And create eip vxnets should get 1 vxnets at least

  # 为绑定公网创建一台或多台路由器
  Scenario: need to create eip routers 
    When create eip routers 
    Then create eip routers should get a job ID 
    Then create eip routers will be finished

  # 为绑定公网将一个受管私有网络连接到一台路由器
  Scenario: need to join eip router 
    When join eip router 
    Then join eip router should get a job ID 
    Then join eip router will be finished

  # 为绑定公网将主机加入到私有网络
  Scenario: need to join eip vxnet 
    When join eip vxnet 
    Then join eip vxnet should get a job ID
    Then join eip vxnet will be finished

  # AssociateEip 将一个“可用”（ available ）状态的公网IP绑定到主机
  Scenario: need to assocate eip 
    When associate eip 
    Then associate eip should get a job ID
    Then associate eip should be finished 

  # DissociateEips 将一个或多个“绑定中”（ associated ）状态的公网IP解绑
  Scenario: need to dissociate eips
    When dissociate eips 
    Then dissociate eips should get a job ID 
    Then dissociate eips will be finished 
  
  # 为解除绑定公网将主机从私有网络中断开
  Scenario: need to leave eip vxnet
    When leave eip vxnet 
    Then leave eip vxnet should get a job ID
    Then leave eip vxnet will be finished 

  # 为解除绑定公网将一个或多个受管私有网络从一台路由器上断开
  Scenario: need to leave eip router
    When leave eip router 
    Then leave eip router should get a job ID 
    Then leave eip router will be finished
    
  # 删除为绑定公网创建的私有网络
  Scenario: need to delete eip vxnets 
    When delete eip vxnets 
    Then delete eip vxnets should be successfull

  # 删除为绑定公网创建的一台或多台路由器
  Scenario: need to delete eip routers 
    When delete eip routers 
    Then delete eip routers should get a job ID 
    Then delete eip routers will be finished 
    
  # ReleaseEips 将一个或多个公网IP释放回IP池，同时相关IP的计费也会停止
  Scenario: need to release eips
    When release eips 
    Then release eips should get a job ID 
    Then release eips will be finished

  # 销毁为绑定公网创建的主机
  Scenario: remove eip instance
    When remove eip instances
    Then remove eip instances should get a job ID

  

  