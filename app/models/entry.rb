class Entry < ActiveRecord::Base

  def self.late_entries(tolerance, initial_date, final_date)
    late_entries = Entry.all.select do |e|
      e.arrival_at.strftime("%H:%M:%S") > tolerance &&
        e.arrival_at.strftime("%Y-%m-%d") >= initial_date.strftime("%Y-%m-%d") &&
        e.arrival_at.strftime("%Y-%m-%d") <= final_date.strftime("%Y-%m-%d")
    end
    late_entries.group_by { |e| e.barcode }.sort
  end

  def self.current_period_entries(initial_date, final_date)
    Entry.all.select do |e|
      e.arrival_at.strftime("%Y-%m-%d") >= initial_date.strftime("%Y-%m-%d") &&
        e.arrival_at.strftime("%Y-%m-%d") <= final_date.strftime("%Y-%m-%d")
    end
  end

  def self.extract_employees_list(entries)
    employees_list = []

    barcodes = entries.map { |e| e.barcode }
    barcodes.each { |b| employees_list << b unless employees_list.include? b }
    employees_list
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
          entry.barcode == emp &&
            entry.arrival_at.strftime("%Y-%m-%d") == d.strftime("%Y-%m-%d")
        end
      end
      absences[emp] = absences_counter
      absences_counter = []
    end
    absences
  end

end
