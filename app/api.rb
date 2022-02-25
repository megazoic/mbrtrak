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
      r.post "users" do
        puts "in post"
        "hello"
      end
    end
  end
end
