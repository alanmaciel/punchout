def user_attributes(overrides = {})
  {
    name: "Example Admin User",
    email: "admin@example.com",
    password: "secret",
    password_confirmation: "secret"
  }.merge(overrides)
end

def period_attributes(overrides = {})
  {
    initial_date: Time.now.beginning_of_month.strftime("%Y-%m-%d"),
    final_date: Time.now.end_of_month.strftime("%Y-%m-%d"),
    payday: (Time.now + 3.days).strftime("%Y-%m-%d"),
    description: Time.now.strftime("%B %Y")
  }.merge(overrides)
end

def schedule_attributes(overrides = {})
  {
    work_starts_at: '09:00:00',
    work_ends_at: '17:00:00',
    arrival_tolerance: '09:10:00'
  }.merge(overrides)
end
