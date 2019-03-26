# Read the Gherkin grammar here: https://cucumber.io/docs/reference

@image
Feature: the Image service
  The Image service should be available
  As a QingCloud user
  I can operate all action of Image
  
  # 为映像创建一台stopped的主机
  Scenario: need a stopped instance
    Given one instance configuration:
      | image_id    | instance_type | count | login_mode | login_passwd |
      | centos7x64d | c1m1          | 1     | passwd     | Hello2333    |
    When run instance
    Then should get a job ID
    Then be sure that instance is running 
    Then stop instance 
    Then be sure that instance is stopped 

  # CaptureInstance 将某个已关闭的主机制作成模板（或称“自有映像”），之后便可将其用于创建新的主机
  Scenario: need to capture instance 
    When capture instance 
    Then capture instance should get a job ID 
    Then capture instance will be finished 

  # DescribeImages 获取一个或多个映像
  Scenario: want to know all images
    When describe images 
    Then describe images should get 1 instance at least

  # ModifyImageAttributes 修改映像的名称和描述
  Scenario: need to modify image attributes 
    Given image configuration:
      | image_name        | description      |
      | cucumber_demo     | cucumber_demo    |
    When modify image attributes 
    Then modify image attributes should be successfull
    And modify image attributes should change the image attribuites

  # GrantImageToUsers 共享镜像给指定的用户
  Scenario: need to grant image to users 
    When grant image to users 
    Then grant image to users should be successfull 

  # DescribeImageUsers 根据映像ID, 查询该映像分享给的用户的列表
  Scenario: want to know all of the users of image shared
    When describe image users 
    Then describe image users should be successful
    And describe image users will return the users

  # RevokeImageFromUsers 撤销共享给用户
  Scenario: need to revoke image from users 
    When revoke image from users 
    Then revoke image from users should be successfull 

  # DeleteImages 删除一个或多个自有映像
  Scenario: need to delete images 
    When delete images 
    Then delete images should get a job ID 
    Then delete images will be finished 
    
  # 销毁为映像创建的主机
  Scenario: remove instance
    When remove instances
    Then remove instances should get a job ID
