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
    RSpec.describe Preprocessor do
      Logger.set_level 'debug'

      it 'processes qingcloud request' do
        config = Config.new.load_default_config.update(host: 'api.qc.dev')
        input = {
          config:           config,
          properties:       {
            a:    'a',
            b:    'b',
            c:    'c',
            d:    nil,
            e:    '',
            zone: 'moon',
          },
          api_name:         'DescribeWhatever',
          request_method:   'GET',
          request_params:   {
            'image_id'       => ['img-xxxxxxxx', 'img-zzzzzzzz'],
            'instance_class' => 0,
            'instance_type'  => %w(type0 type1),
            'instances'      => ['i-xxxxxxxx', 'i-zzzzzzzz'],
            'limit'          => 0,
            'offset'         => 0,
            'search_word'    => 'search_word',
            'status'         => 'running',
            'tags'           => %w(tag0 tag1),
            'verbose'        => 1,
            'zone'           => 'beta',
            'map'            => {
              'map_key_a' => 'a',
              map_key_b:  'b',
            },
            'array'          => [{
              'array_map_key_a' => 'a_a',
              array_map_key_b:  'b_b',
            }],
            'empty'          => '',
            'nil'            => nil,
          },
          request_headers:  {
          },
          request_elements: {
          },
          request_body:     nil,
          status_codes:     [
            200,
          ],
        }

        result = Preprocessor.do input

        expect(result[:properties].key?('d')).to be false
        expect(result[:properties].key?('e')).to be false
        expect(result[:request_endpoint]).to eq 'https://api.qc.dev:443'
        expect(result[:request_params][:zone]).to eq 'moon'
        expect(result[:request_params][:'image_id.0']).to eq 'img-xxxxxxxx'
        expect(result[:request_params][:instance_class]).to eq 0
        expect(result[:request_params][:'instance_type.0']).to eq 'type0'
        expect(result[:request_params][:'instances.1']).to eq 'i-zzzzzzzz'
        expect(result[:request_params][:'map.map_key_a']).to eq 'a'
        expect(result[:request_params][:'map.map_key_b']).to eq 'b'
        expect(result[:request_params][:'array.0.array_map_key_a']).to eq 'a_a'
        expect(result[:request_params][:'array.0.array_map_key_b']).to eq 'b_b'
        expect(result[:request_params].key?('empty')).to be false
      end
    end
  end
end
