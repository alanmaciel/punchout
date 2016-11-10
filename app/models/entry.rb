class Entry < ActiveRecord::Base

  def self.late_entries(tolerance, initial_date, final_date)
    late_entries = Entry.where("to_char(arrival_at, 'HH:MI') > ? AND
                 arrival_at BETWEEN ? AND ? ",
                 tolerance, initial_date, final_date)
    late_entries.group_by { |e| e.barcode }.sort
  end

  def self.current_period_entries(initial_date, final_date)
    Entry.where("cast(arrival_at as date) BETWEEN ? AND ?",
                initial_date.strftime("%Y-%m-%d"),
                final_date.strftime("%Y-%m-%d"))
  end

  def self.extract_employees_list(entries)
    entries.find_by_sql("SELECT DISTINCT barcode FROM entries;")
  end

  def self.get_period_working_days(initial_date, final_date)
    working_days = []
    
    (initial_date.day.to_i..final_date.day.to_i).to_a.each_with_index do |d, i|
      working_days << initial_date + i.day unless (initial_date + i.day).saturday? ||
                                                  (initial_date + i.day).sunday?
    end
    working_days
  end

  def self.get_absences(employees_list, working_days, entries)
    absences_counter = []
    absences = {}
    employees_list.each do |emp|
      working_days.each.with_index do |d, i|
        absences_counter << d.strftime("%Y-%m-%d") unless entries.detect do |entry|
          entry.barcode == emp.barcode &&
            entry.arrival_at.strftime("%Y-%m-%d") == d.strftime("%Y-%m-%d")
        end
      end
      absences[emp] = absences_counter
      absences_counter = []
    end
    absences
  end

end
