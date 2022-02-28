require 'roda'
require 'json'
require 'lucid_http'
require_relative 'user'
require_relative 'payment'

#https://www.kdobson.net/2019/ruby-roda-guide-1/
#require 'tilt'

module MbrTrak
  class API < Roda
    plugin :render, escape: true
    plugin :json
    plugin :type_routing
    puts "made new api"
    route do |r|
      puts "in route"
      r.on "users" do
        puts "in users"
        "users"
        r.is Integer do |id|
          r.get do
            puts "in users/yr"
            JSON.generate([])
          end
        end
        r.post do
          response.status = 200
          response['Content-Type'] = 'application/json'
          response.write JSON.generate('user_id' => 42)
        end
      end
    end
  end
end
