class TimeZoneNotFoundError < StandardError
  def message
    "Timezone not found."
  end
end