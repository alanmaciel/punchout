class EntriesController < ApplicationController
  before_action :require_signin

  def late_entries
    @current_period = Period.current_period
    @initial_date = @current_period.initial_date
    @final_date = @current_period.final_date

    @arrival_tolerance = Schedule.first.arrival_tolerance.strftime("%H:%M")
    @late_entries = Entry.late_entries(@arrival_tolerance, @initial_date, @final_date) 
  end

  def employees_absences
    @current_period = Period.current_period
    @initial_date = @current_period.initial_date
    @final_date = @current_period.final_date
    
    entries = Entry.current_period_entries(@initial_date, @final_date)
    days = Entry.get_period_working_days(@initial_date, @final_date)
    employees = Entry.extract_employees_list(entries)
    @absences = Entry.get_absences(employees, days, entries)
  end

end
