class Period < ActiveRecord::Base
  def self.current_period
    Period.all.detect { |p| Date.today > p.initial_date && Date.today < p.final_date }
  end
end
