class Period < ActiveRecord::Base
  def self.current_period
    Period.all.detect { |p| Date.today > p.initial_date && Date.today < p.final_date }
  end

  def days_to_payday(payday)
    payday = Time.parse(payday.strftime("%Y-%m-%d"))
    today = Time.parse(Time.now.strftime("%Y-%m-%d"))
    
    total_minutes = (payday - today)/60
    hours = (total_minutes / 60).floor
    hours/24 
  end
end
