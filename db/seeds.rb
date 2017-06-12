# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_city
  city = City.new
  city.name = "Houston"
  city.save!
end

create_city


def create_bob
  user = User.new
  user.first_name = "Bob"
  user.last_name = "Lawblah"
  user.email = "123@123.com"
  user.password = "12345678"
  user.save!
  user
  city = City.first
  city.users << user
end

create_bob

def create_user
  user = User.new
  user.first_name = Faker::Name.first_name
  user.last_name = Faker::Name.last_name
  user.email = Faker::Internet.email
  user.password = Faker::Internet.password(8)
  user.save!
  user
  city = City.first
  city.users << user
end

3.times do
  create_user
end

def create_cohort
  cohort = Cohort.new
  cohort.start_date = "2017-07-17"
  cohort.save!
  cohort

  users = User.where(city_id: City.first.id)
  users.each do |user|
    cohort.users << user
  end
end

create_cohort

def create_student
  cohort = Cohort.last
  student = cohort.students.new
  student.first_name = Faker::Name.first_name
  student.last_name = Faker::Name.last_name
  student.email = Faker::Internet.email
  student.down_payment = [true, false].sample
  student.financially_cleared = [true, false].sample
  student.enrollment_agreement = [true, false].sample
  student.transcript = [true, false].sample
  student.yes_we_code = [true, false].sample
  student.save!
end

25.times do
  create_student
end

def create_announcments
  cohort = Cohort.last
  announcement = cohort.announcements.new
  announcement.date = Faker::Date.forward(30)
  announcement.title = Faker::ChuckNorris.fact
  announcement.location = Faker::Company.name
  announcement.save!
end

5.times do
  create_announcments
end

def create_code_challenges
  cc = CodeChallenge.new
  cc.newline_url = Faker::Internet.url
  cc.description = Faker::Hacker.say_something_smart
  cc.save!
end

10.times do
  create_code_challenges
end
