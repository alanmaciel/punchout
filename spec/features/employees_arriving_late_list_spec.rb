require "rails_helper"

RSpec.describe "Admin Area Reports" do

  before :each do
    Entry.create([
                   { barcode: '00001',
                     arrival_at: Time.now.strftime("%Y-%m-%d") + ' 09:00:00',
                     departure_at: Time.now.strftime("%Y-%m-%d")+ ' 17:00:00'},
                   { barcode: '00002',
                     arrival_at: Time.now.strftime("%Y-%m-%d") + ' 09:01:00',
                     departure_at: Time.now.strftime("%Y-%m-%d")+ ' 17:00:00'},
                   { barcode: '00003',
                     arrival_at: Time.now.strftime("%Y-%m-%d") + ' 08:50:00',
                     departure_at: Time.now.strftime("%Y-%m-%d")+ ' 17:00:00'},
                 ])
    
    Schedule.create!(schedule_attributes)
    
  end
 
  scenario "An authenticated admin user can get the list of employees arriving late" do
    Period.create!(period_attributes)
    Entry.create([
                   { barcode: '00005',
                     arrival_at: Time.now.strftime("%Y-%m-%d") + ' 09:11:00',
                     departure_at: Time.now.strftime("%Y-%m-%d")+ ' 17:00:00'}
                 ])
    
    admin_user = User.create!(user_attributes)

    signin(admin_user)

    expect(page).to have_text "Welcome, #{admin_user.name}!"

    click_link "Employees arriving late"

    expect(page).to have_text "Employees arriving late"
    expect(page).to have_text('00005')
    expect(page).to_not have_text('00003')
    expect(current_path).to eq(late_entries_path)
  end

  scenario "A person not authenticated can't access the list of employees arriving late" do
    visit late_entries_path

    expect(page).to have_text "Please sign in first!"
    expect(current_path).to eq(new_session_path)
  end

  
  scenario "An authenticated admin user can get the list of employees absences" do
    Period.create!(period_attributes(
                      initial_date: (Time.now - 2.days).strftime("%Y-%m-%d"),
                      final_date: (Time.now).strftime("%Y-%m-%d"),
                      payday: (Time.now - 1.day).strftime("%Y-%m-%d"),
                      description: "Small testing period"
                    ))

    Entry.create!([
                   { barcode: '00004',
                     arrival_at: (Time.now - 2.days).strftime("%Y-%m-%d") + ' 09:00:00',
                     departure_at: (Time.now - 2.days).strftime("%Y-%m-%d") + ' 17:00:00'},
                   { barcode: '00004',
                     arrival_at: (Time.now - 1.day).strftime("%Y-%m-%d") + ' 09:01:00',
                     departure_at: (Time.now - 1.day).strftime("%Y-%m-%d") + ' 17:00:00'},
                   { barcode: '00004',
                     arrival_at: Time.now.strftime("%Y-%m-%d") + ' 09:01:00',
                     departure_at: Time.now.strftime("%Y-%m-%d") + ' 17:00:00'}
                 ])
    admin_user = User.create!(user_attributes)

    signin(admin_user)

    expect(page).to have_text("Welcome, #{admin_user.name}!")

    click_link "Employees with absences"

    expect(page).to have_text "Employees with absences"
    expect(page).to have_css( 'tr#00004 td.value', :text => "0")
    expect(current_path).to eq(employees_absences_path)
  end
  
  scenario "A person not authenticated can't access the list of employees absences" do
    visit employees_absences_path

    expect(page).to have_text "Please sign in first!"
    expect(current_path).to eq(new_session_path)
  end
end
