# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

User.create!(username: "testmanager_name", password: "testmanager_pass", email: "testmanager@email.com", employee_type: "manager")
User.create!(username: "testhost_name", password: "testhost_pass", email: "testhost@email.com", employee_type: "host")
User.create!(username: "testwaitstaff_name", password: "testwaitstaff_pass", email: "testwaitstaff@email.com", employee_type: "waitstaff")
User.create!(username: "testbartender_name", password: "testbartender_pass", email: "testbartender@email.com", employee_type: "bartender")
User.create!(username: "testcook_name", password: "testcook_pass", email: "testcook@email.com", employee_type: "cook")
User.create!(username: "testbusser_name", password: "testbusser_pass", email: "testbusser@email.com", employee_type: "busser")

Table.create!(name: "table1)", status: 2)
Table.create!(name: "table2)", status: 2)
Table.create!(name: "table3)", status: 3)
Table.create!(name: "table4)", status: 1)
Table.create!(name: "table5)", status: 2)

Order.create!(table_id: 1, user_id: 1, ispaid: true)
Order.create!(table_id: 1, user_id: 3, ispaid: false)
Order.create!(table_id: 2, user_id: 1, ispaid: true)
Order.create!(table_id: 2, user_id: 4, ispaid: false)
Order.create!(table_id: 3, user_id: 1, ispaid: true)
Order.create!(table_id: 4, user_id: 1, ispaid: true)
Order.create!(table_id: 5, user_id: 1, ispaid: true)
Order.create!(table_id: 5, user_id: 5, ispaid: false)