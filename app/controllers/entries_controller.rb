class EntriesController < ApplicationController
  before_action :require_signin, except: :working_hours

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

  def working_hours
    @current_period = Period.current_period

    if  @current_period.days_to_payday(@current_period.payday) == 3
      @initial_date = @current_period.initial_date
      @final_date = @current_period.final_date
      @barcode = params[:barcode]

      entries = Entry.current_period_entries(@initial_date, @final_date)

      @employee_entries = entries.where("barcode = ?", params[:barcode] )

    else
      redirect_to employee_menu_url, warning: "This report is available only 3 days
                                          before the paycheck day. Please check
                                          again the #{@current_period.payday - 3.days}"
    end
  end

end
