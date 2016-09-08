module EntriesHelper

  def calculate_hours(arrival, departure)
    arrival = Time.parse(arrival.strftime("%H:%M"))
    departure = Time.parse(departure.strftime("%H:%M"))
    
    total_minutes = (departure - arrival)/60

    hours = (total_minutes / 60).floor
    minutes = total_minutes.to_i % 60

    "#{hours} hour(s) #{minutes} minute(s)"
  end

end
