require 'spec_helper'

describe FakeServiceBroker do

  def app
    FakeServiceBroker
  end


  describe 'GET /v2/catalog' do
    it 'returns status 200' do
      get '/v2/catalog'
      expect(last_response.status).to eq 200

      json_response = JSON.parse(last_response.body)
      services = json_response['services']

      expect(services.length).to(eq(1))

      services.each do |service|
        expect(service['name']).to(eq('fake-service'))
        expect(service['id']).to(eq('acb56d7c-XXXX-XXXX-XXXX-feb140a59a66'))
        expect(service['description']).to(eq('fake service'))
        expect(service['bindable']).to(eq(true))

        plans = service['plans']
        expect(plans.length).to(eq(2))

        plans.each do |plan|
          expect(plan).to(include('id'))
          expect(plan).to(include('name'))
          expect(plan).to(include('description'))
        end
      end

    end

  end

end