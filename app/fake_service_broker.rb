require 'yaml'

class FakeServiceBroker < Sinatra::Base

  get '/v2/catalog' do
    content_type :json
    status 200

    YAML.load_file('app/catalog.yml').to_json
  end
end