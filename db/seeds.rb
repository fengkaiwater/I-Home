# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

create_account = User.create([email: 'fengkai@sina.com', password: '111111', password_confirmation: '111111', is_admin: 'true'])
puts "Admin account created."

create_events = for i in 1..10 do
  Event.create!([title: "Event no.#{i}", description: "這是用種子建立的第 #{i} 個Public工作", is_hidden: "false", user_id: 1])
end
puts "10 Public events created."
