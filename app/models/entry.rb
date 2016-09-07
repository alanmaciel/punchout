class Entry < ActiveRecord::Base

  def self.late_entries(tolerance)
    late_entries = Entry.all.select { |e| e.arrival_at.strftime("%H:%M:%S") > tolerance }
    late_entries.group_by { |e| e.barcode }.sort
  end
end
