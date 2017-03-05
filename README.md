# QingCloud::SDK

<span style="display: inline-block">
[![Build Status](https://travis-ci.org/yunify/qingcloud-sdk-ruby.svg?branch=master)](https://travis-ci.org/yunify/qingcloud-sdk-ruby)
[![Gem Version](https://badge.fury.io/rb/qingcloud-sdk.svg)](http://badge.fury.io/rb/qingcloud-sdk)
[![API Reference](http://img.shields.io/badge/api-reference-green.svg)](https://docs.qingcloud.com/)
[![License](http://img.shields.io/badge/license-apache%20v2-blue.svg)](https://github.com/yunify/qingcloud-sdk-ruby/blob/master/LICENSE)
</span>

The official QingCloud SDK for Ruby programming language.

## Installation

This Gem uses Ruby's _keyword arguments_ feature, thus Ruby v2.1.5 or higher is
required.  See [this article](https://robots.thoughtbot.com/ruby-2-keyword-arguments)
for more details about _keyword arguments_.

### Install with Bundler

Specify `qingcloud-sdk` as dependency in your application's Gemfile:

``` ruby
gem 'qingcloud-sdk'
```

Ensure `qingcloud-sdk` is installed as dependency with `bundle install`:

``` bash
$ bundle install
```

### Install from Source Code

Get code from GitHub:

``` bash
$ git clone git@github.com:yunify/qingcloud-sdk-ruby.git
```

Build and install with bundler:

``` bash
$ cd qingcloud-sdk-ruby
$ bundle install
$ bundle exec rake install
```

### Uninstall

``` bash
$ gem uninstall qingcloud-sdk
```

## Usage

### Notice
* API action name was mapped to ruby method.
* API parameter name was mapped to ruby method parameter.
* API optional parameter can be ignored when call ruby method.

___Example:___

``` ruby
Action: "DescribeInstances" -> "describe_instances"
Parameter: "zone" -> "zone: 'pek3a'"
Array Parameter: "instances.n" -> "instances: ['i-xxxxxxxx', ...]"
Map Parameter: "statics.n.static_type" -> "statics: [{val1: '', ...}, ...]"
```

### Prepare

Before your start, please go to [QingCloud Console](https://console.qingcloud.com/access_keys/) to create a pair of QingCloud API keys.

___API AccessKey Example:___

``` yaml
qy_access_key_id: 'ACCESS_KEY_ID_EXAMPLE'
qy_secret_access_key: 'SECRET_ACCESS_KEY_EXAMPLE'
```

### Code Example

```ruby
require 'qingcloud/sdk'

# Create a configuration from AccessKeyID and SecretAccessKey
config = QingCloud::SDK::Config.init ENV['ENV_ACCESS_KEY_ID'],
                                     ENV['ENV_SECRET_ACCESS_KEY']

# Initialize a QingCloud service with a configuration
qingcloud_service = QingCloud::SDK::QingCloudService.new config

# Initialize service of Instance
instance = qingcloud_service.instance 'pek3a'

# DescribeInstances
result = instance.describe_instances verbose: 1,
                                     limit:   5
# Print instances count
puts result[:total_count]

# RunInstances
result = instance.run_instances image_id:      'centos7x64b',
                                cpu:           1,
                                memory:        1024,
                                login_mode:    'keypair',
                                login_keypair: 'kp-xxxxxxxx'
# Print the job ID
puts result[:job_id]
```

### More Configuration

Except for AccessKeyID and SecretAccessKey, you can also configure the API servers for private cloud usage.

___Code Example:___

``` ruby
require 'qingcloud/sdk'

# Load default configuration
config = QingCloud::SDK::Config.new.load_default_config

# Create with default value
config = QingCloud::SDK::Config.new({
  host:      'api.qingcloud.dev',
  log_level: 'debug',
})

# Create a configuration from AccessKeyID and SecretAccessKey
config = QingCloud::SDK::Config.init ENV['ENV_ACCESS_KEY_ID'],
                                     ENV['ENV_SECRET_ACCESS_KEY']

# Load configuration from config file
config = QingCloud::SDK::Config.new
config = config.load_config_from_file '~/qingcloud/config.yaml'

# Create configuration from AccessKey
config = QingCloud::SDK::Config.init 'ACCESS_KEY_ID',
                                     'SECRET_ACCESS_KEY'

# Change API server
config.update({host: 'api.qingcloud.dev'})
```

___Default Configuration File:___

``` yaml
# QingCloud services configuration

qy_access_key_id: 'ACCESS_KEY_ID'
qy_secret_access_key: 'SECRET_ACCESS_KEY'

host: 'api.qingcloud.com'
port: 443
protocol: 'https'
uri: '/iaas'
connection_retries: 3

# Valid log levels are "debug", "info", "warn", "error", and "fatal".
log_level: 'warn'
```

## Change Log
All notable changes to QingCloud SDK for Ruby will be documented here.

### 2.0.0-alpha.1 - 2017-03-05

#### Added

- QingCloud SDK for the Ruby programming language.

## Reference Documentations

- [QingCloud Documentation Overview](https://docs.qingcloud.com)
- [QingCloud API](https://docs.qingcloud.com/api/index.html)

## Contributing

1. Fork it ( https://github.com/yunify/qingcloud-sdk-ruby/fork )
2. Create your feature branch (`git checkout -b new-feature`)
3. Commit your changes (`git commit -asm 'Add some feature'`)
4. Push to the branch (`git push origin new-feature`)
5. Create a new Pull Request

## LICENSE

The Apache License (Version 2.0, January 2004).
