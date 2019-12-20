require_relative '../lib/business/world_time_api.rb'

class TimeRequests < Angus::BaseResource

  def show
    area = params[:area]
    location = params[:location]
    { time: Business::WorldTimeApi::get_time(area, location) }
  end

  def show_missing_param
    area = params[:area]
    if location = params[:location]
      { time: Business::WorldTimeApi::get_time(area, location) }
    else
      raise TimeZoneNotFoundError
    end
  end

end
