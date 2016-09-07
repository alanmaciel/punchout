class EntriesController < ApplicationController
  before_action :require_signin

  def late_entries
    @current_period = Period.current_period
    @arrival_tolerance = Schedule.first.arrival_tolerance.strftime("%H:%M")
    @late_entries = Entry.late_entries(@arrival_tolerance) 
  end

end
