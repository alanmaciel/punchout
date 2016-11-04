# coding: utf-8
# First create the admin user, this user is used by the HR department to get
# the reports in the 'Admin Menu', 'Employees arrving late' and 'Employees with
# absences'.
User.create([{  name: 'Admin',
                email: 'admin@example.com',
                password: '1234567890',
                password_confirmation: '1234567890'
             }])

# Second create three periods, the HR department using the admin user must create
# the periods, if they work by week, then they need to create four periods each
# month, if they work by fortnight then they need to create two periods for
# month. if they pay monthly then they only need to create twelve periods per
# year.

# crear los periodos para probar 6 meses atras y 6 meses en el futuro
# por quincena:
#
# crear periodo del mes pasado al dia de hoy
# crear periodo del mes actual al dia de hoy
# creat periodo del mes siguiente al actual al dia de hoy

# last month first day
# last month end day

# this month first day
# this month end day


Period.create([{
                 initial_date: 1.month.ago.beginning_of_month.strftime("%Y-%m-%d"),
                 final_date: 1.month.ago.end_of_month.strftime("%Y-%m-%d"),
                 payday: 1.month.ago.end_of_month.strftime("%Y-%m-%d"),
                 description: 1.month.ago.strftime("%B %Y")
               },
               {
                 initial_date: Time.now.beginning_of_month.strftime("%Y-%m-%d"),
                 final_date: Time.now.end_of_month.strftime("%Y-%m-%d"),
                 payday: (Time.now + 3.days).strftime("%Y-%m-%d"),
                 description: Time.now.strftime("%B %Y")
               }])

# Third we create the arrival tolerance and the working hours: Check in time
# and check out time:

Schedule.create([{
                   work_starts_at: '09:00:00',
                   work_ends_at: '17:00:00',
                   arrival_tolerance: '09:10:00'
                 }])

# Finally We need some employees entries:
# Arriving on time:
# Arriving late:

# Crear entradas para 5 empleados hipotéticos de la empresa con las
# tarjetas con el codigo de barras:
# 00001 hasta 00004
# Ejemplo de formato de fecha y hora: '2016-09-12 09:00:00'
#
# Quincena pasada
# 00001 siempre llega a tiempo 9:00 en punto 
# 00002 llega 1 minuto tarde 9:01
# 00003 siempre llega tarde 11 minutos tarde 9:11 (fuera de la tolerancia)
# 00004 esta ausente (no hay registro)
# 00005 en adelante llegan 10 minutos antes 8:50
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
# Quincena actual
# 00001 llega a tiempo 9:00 en punto 
# 00002 llega 1 minuto tarde 9:01
# 00003 llega 11 minutos tarde 9:11 (fuera de la tolerancia)
# 00004 esta ausente (no hay registro)
# 00005 llega 10 minutos antes 8:50
Entry.create([
               { barcode: '00001',
                 arrival_at: Time.now.strftime("%Y-%m-%d") + ' 09:00:00',
                 departure_at: Time.now.strftime("%Y-%m-%d")+ ' 17:00:00'},
               { barcode: '00002',
                 arrival_at: Time.now.strftime("%Y-%m-%d") + ' 09:01:00',
                 departure_at: Time.now.strftime("%Y-%m-%d")+ ' 17:00:00'},
               { barcode: '00003',
                 arrival_at: Time.now.strftime("%Y-%m-%d") + ' 09:11:00',
                 departure_at: Time.now.strftime("%Y-%m-%d")+ ' 17:00:00'},
               { barcode: '00005',
                 arrival_at: Time.now.strftime("%Y-%m-%d") + ' 08:50:00',
                 departure_at: Time.now.strftime("%Y-%m-%d")+ ' 17:00:00'}
             ])
