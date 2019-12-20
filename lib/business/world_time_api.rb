require_relative '../services/world_time_api.rb'

module Business
  module WorldTimeApi
  
    def self.get_time(area, location)
      Services::WorldTimeApi.get_time(area, location)
    end
  end
end