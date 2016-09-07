# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Entry.create([{
                barcode: '00001',
                arrival_at: '2016-09-11 09:00:00',
                departure_at: '2016-09-11 17:00:00'},
              { barcode: '00002',
                arrival_at: '2016-09-11 08:54:12',
                departure_at: '2016-09-11 18:10:12'},
              { barcode: '00003',
                arrival_at: '2016-09-11 09:15:00',
                departure_at: '2016-09-11 09:10:00'},
              { barcode: '00004',
                arrival_at: '2016-09-11 09:08:00',
                departure_at: '2016-09-11 16:49:55'},
              { barcode: '00005',
                arrival_at: '2016-09-11 09:03:09',
                departure_at: '2016-09-11 17:45:32'},
              { barcode: '00006',
                arrival_at: '2016-09-11 08:20:23',
                departure_at: '2016-09-11 16:30:34'},
              { barcode: '00007',
                arrival_at: '2016-09-11 09:11:12',
                departure_at: '2016-09-11 17:59:48'},
              { barcode: '00008',
                arrival_at: '2016-09-11 09:18:12',
                departure_at: '2016-09-11 18:23:22'},
              { barcode: '00009',
                arrival_at: '2016-09-11 09:20:28',
                departure_at: '2016-09-11 19:23:22'},
              { barcode: '00010',
                arrival_at: '2016-09-11 10:15:23',
                departure_at: '2016-09-11 18:00:09'},
              { barcode: '00001',
                arrival_at: '2016-09-30 10:12:21',
                departure_at: '2016-09-30 18:12:22'},
              { barcode: '00002',
                arrival_at: '2016-09-30 9:02:11',
                departure_at: '2016-09-30 17:23:12'},
              { barcode: '00003',
                arrival_at: '2016-09-30 09:15:23',
                departure_at: '2016-09-30 18:22:11'}
             ] )

Period.create([{
                 initial_date: '2016-08-16',
                 final_date: '2016-08-31',
                 payday: '2016-08-31',
                 description: "August's 2nd fortnight"
               },
               {
                 initial_date: '2016-09-01',
                 final_date: '2016-09-15',
                 payday: '2016-09-15',
                 description: "September's 1st fortnight"
               },
               {
                 initial_date: '2016-09-16',
                 final_date: '2016-09-30',
                 payday: '2016-09-30',
                 description: "September's 2nd fortnight"
               },

              ])

Schedule.create([{
                   work_starts_at: '09:00:00',
                   work_ends_at: '18:00:00',
                   arrival_tolerance: '09:10:00'
                 }
                ])
