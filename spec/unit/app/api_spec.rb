require_relative '../../../app/api'

module MbrTrak
  OUTER_APP = Rack::Builder.parse_file("config.ru").first
  RSpec.describe API do
    describe 'POST /users' do
      context 'when the user is successfully recorded' do
        it 'returns the user id'
        it 'responds with a 200 (OK)'
      end
      context 'when the expxnse fails validation' do
        it 'returns an error message'
        it 'responds with a 422 (Unprocessable entity)'
      end
    end
  end
end