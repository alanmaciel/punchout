require "rails_helper"

RSpec.describe "Working Hours Report" do

  before :each do

    Entry.create([
                   { barcode: '00001',
                     arrival_at: 15.days.ago.strftime("%Y-%m-%d") + ' 09:00:00',
                     departure_at: 15.days.ago.strftime("%Y-%m-%d")+ ' 17:00:00'},
                   { barcode: '00002',
                     arrival_at: 15.days.ago.strftime("%Y-%m-%d") + ' 09:01:00',
                     departure_at: 15.days.ago.strftime("%Y-%m-%d")+ ' 17:00:00'},
                   { barcode: '00003',
                     arrival_at: 15.days.ago.strftime("%Y-%m-%d") + ' 09:11:00',
                     departure_at: 15.days.ago.strftime("%Y-%m-%d")+ ' 17:00:00'},
                   { barcode: '00005',
                     arrival_at: 15.days.ago.strftime("%Y-%m-%d") + ' 08:50:00',
                     departure_at: 15.days.ago.strftime("%Y-%m-%d")+ ' 17:00:00'}
                 ])
    
    Schedule.create!(schedule_attributes)

  end
  
  scenario "An employee can review their current period Working Hours Report
            exactly 3 days before the paycheck day" do

    Period.create!(period_attributes(payday: (Time.now + 3.days).strftime("%Y-%m-%d")))
    
    visit root_url

    click_link "Review Your Working Hours Report"

    fill_in "barcode", with: "00001"

    click_button "Continue"
 
    expect(page).to have_text("Working hours employee with badge 00001")
    expect(page).not_to have_text("Working hours employee with badge 00002")
    expect(current_path).to eq(working_hours_path)
  end

  scenario "An employee can't review their current period Working Hours Report
            more than 3 days before the paycheck day" do

    Period.create!(period_attributes(payday: (Time.now + 4.days).strftime("%Y-%m-%d")))
    
    visit root_url

    click_link "Review Your Working Hours Report"

    fill_in "barcode", with: "00001"

    click_button "Continue"

    expect(page).to have_text("This report is available only 3 days before the paycheck day")
    expect(current_path).to eq(employee_menu_path)
  end
  
end
