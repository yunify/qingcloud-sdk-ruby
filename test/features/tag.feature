@tag
Feature: the Tag service
  The Tag service should be available
  As a QingCloud user
  I can operate all action of Tag

  # CreateTag
  Scenario: need to create tag
    Given tag configuration:
      | tag_name      |
      | cucumber_demo |
    When create tag
    Then create tag should be success 

  # DescribeTags
  Scenario: want to know all tags
  When describe tags
  Then describe tags should be success 
  And describe tags should get at least 1 tags

  # ModifyTagAttributes
  Scenario: need to modify tag attributes
    Given modify tag attributes configuration:
      |  tag_name      | description    |
      |  cucumber_demo | cucumber_demo  |
    When modify tag attributes
    Then modify tag attributes should be success
    And modify tag attributes will change the tag attributes 

  # 为绑定标签创建一台主机
  Scenario: need a tag instance
    Given tag instance configuration:
      | image_id    | instance_type | count | login_mode | login_passwd |
      | centos7x64d | c1m1          | 1     | passwd     | Hello2333    |
    When run tag instance
    Then run tag instance should get a job ID
    Then run tag instance be sure that instance is running 

  # AttachTags
  Scenario: need to attach tags
    When attach tags 
    Then attach tags should be success 

  # DetachTags
  Scenario: need to detach tags
    When detach tags 
    Then dttach tags should be success

  # 销毁为绑定标签创建的主机
  Scenario: remove tag instance
    When remove tag instances
    Then remove tag instances should get a job ID

  # DeleteTags
  Scenario: need to delete tags
    When delete tags
    Then delete tags should be success
    And delete tags should respond the tag I have created
    