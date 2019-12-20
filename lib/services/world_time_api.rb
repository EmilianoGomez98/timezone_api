require 'json'
require 'net/http'
require_relative '../../exceptions/timezone_not_found_error.rb'

module Services
  module WorldTimeApi

    def self.get_time(area, location)
      uri = URI("http://worldtimeapi.org/api/timezone/#{area}/#{location}")
      res = Net::HTTP.get_response(uri)
      payload = JSON.parse(res.body)
      return payload['datetime'] unless payload['error']
      raise TimeZoneNotFoundError
    end
  end
end
