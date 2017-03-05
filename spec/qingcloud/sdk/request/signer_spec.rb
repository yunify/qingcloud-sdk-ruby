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

require 'spec_helper'

module QingCloud
  module SDK
    RSpec.describe Signer do
      it 'signs qingcloud request' do
        config     = Config.init 'QYACCESSKEYIDEXAMPLE', 'SECRETACCESSKEY'
        input      = {
          config:         config,
          request_method: 'GET',
          request_params: {
            'action'            => 'RunInstances',
            'count'             => '1',
            'image_id'          => 'centos64x86a',
            'instance_name'     => 'demo',
            'instance_type'     => 'small_b',
            'login_mode'        => 'passwd',
            'login_passwd'      => 'QingCloud20130712',
            'signature_method'  => 'HmacSHA256',
            'signature_version' => 1,
            'time_stamp'        => '2013-08-27T14:30:10Z',
            'version'           => 1,
            'vxnets.1'          => 'vxnet-0',
            'zone'              => 'pek1',
            'access_key_id'     => 'QYACCESSKEYIDEXAMPLE',
          },
        }
        input[:id] = 743_423

        result    = Signer.do input
        signature = 'MQ6mgjLWuCOj09FGPT0YrZbxq13f%2Fr0OxEzn6hmv3hM%3D'
        expect(result[:request_params][:signature]).to eq signature
      end
    end
  end
end
