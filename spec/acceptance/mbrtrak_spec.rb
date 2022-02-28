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
    def post_mbr(user)
      post '/users', JSON.generate(user), { 'CONTENT_TYPE' => 'application/json' }
      expect(last_response.status).to eq(200)
      parsed = JSON.parse(last_response.body)
      expect(parsed).to include('user_id' => a_kind_of(Integer))
      user.merge('id' => parsed['user_id'])
    end
		it 'records a profile, returns id' do
      pending 'need to persist users'
      usr1 = post_mbr('fname' => 'Nick',
        'lname' => 'Appelmans',
        'callsign' => 'KI7PTT',
        'paid_up' => 2022)
      usr2 = post_mbr('fname' => 'Joe',
        'lname' => 'Smith',
        'callsign' => 'K7WAA',
        'paid_up' => 2021)
      usr3 = post_mbr('fname' => 'Jane',
        'lname' => 'Bundy',
        'callsign' => 'A7ZQQ',
        'paid_up' => 2022)
        get '/users/2022'
        expect(last_response.status).to eq(200)
        mbrs = JSON.parse(last_response.body)
        expect(mbrs).to contain_exactly(usr1, usr3)
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