require 'swagger_helper'

RSpec.describe 'api/v1/albums', type: :request do
  path 'api/v1/albums' do

    get('list albums') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
end
