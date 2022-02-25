require 'rack/test'
require 'json'
require_relative '../../app/api'

module MbrTrak
  OUTER_APP = Rack::Builder.parse_file("config.ru").first
  
  RSpec.describe User, 'record keeping', roda: :app do
    include Rack::Test::Methods
    def app
      OUTER_APP
      #MbrTrak::API.new("test")
    end
		it 'records a profile, returns id' do
      usr1 = {'fname' => 'Nick',
        'lname' => 'Appelmans',
        'callsign' => 'KI7PTT'}
        post '/users', JSON.generate(usr1), { 'CONTENT_TYPE' => 'application/json' }
        expect(last_response.status).to eq(200)
    end
		it 'updates a profile'
    #context 'when presenting authentic credentials' do
      # not sure that this is what I should expect since rodauth will deal with authentication
      # I would think I can ignore this for now and should focus on what the site will deliver
      # for a successfully authenticated user
      #it 'returns a user id'
    #end
  end
  RSpec.describe Payment, 'record keeping' do
    include Rack::Test::Methods
		it 'records a payment'
		it 'updates a payment'
  end
end