# README

## Welcome to Punchout App
Problem background
In your first day as developer you are consulting for a customer who owns a 
textile company named Textile.Co. The company has 1000 employees.

When a new employee joins Textile.Co, the employee receives a new BADGE card
imprinted with a unique barcode, each employee has a different BADGE card.

Textile.Co bought a punch card machine that can send a HTTP’s JSON POST 
payloads to a server and wants to use it to track arrivals and departures of 
employees. 

Working hours for employees are from 9 am to 6 pm, Monday to Friday.

### Features

1. Be able to see which employees are arriving late.
Effort points: 3

#### Assumptions:
- This part (Employees Arriving Late) is only accessible to an registered user 
(admin).
- Assuming that the entries table is already loaded with data from the 
punchcard.
- The current period is calculated automatically using today date.

2. Know which employees are not coming to work at all.
Effort points: 2

#### Assumptions:

3. Give each of his employees the opportunity to review their current period 
working hours report 3 days before the paycheck day.
Effort points: 2

#### Assumptions:


### Schedules

- There is a table called 'Schedules' with the following fields: 
  -- 'work_starts_at' is '9:00'
  -- 'works_ends_at' is '18:00'
  -- 'arrival_tolerance' is '9:30'

### Periods
- There is a table called 'Periods' with the following fields:
  -- 'initial_date': Initial date of the period Eg: '2016-09-01' 
  -- 'final_date': Final  date of the period Eg: '2016-09-15' 
  -- 'payday': Payday date Eg: '2016-09-15' 
  -- 'description': Descriptive text Eg: 'September first fortnight'

### Entries
- There is a table called 'Entries' with the following fields:
  -- 'barcode': Employee card number from his/her personal badge
  -- 'arrival_at': Date and time when the employee arrived.
  -- 'departure_at': Date and time when the employee leave.

### Users
- There is a table called 'Users' with the following fields:
  -- 'name': User full name Eg. 'Human Resources Administrator'
  -- 'email': Email is used as username to make a log in Eg: 'admin@example.com'
  -- 'password_digest': User encrypted password
  
