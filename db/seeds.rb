# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PASSWORD = '123'
# Instructor.destroy_all
Course.destroy_all
# Student.destroy_all
User.destroy_all
School.destroy_all
# UserType.destroy_all




# Cohort.destroy_all
# Course.destroy_all
# Topic.destroy_all
# Material.destroy_all

# 3.times.each do |no|
#   UserType.create(
#     title: ["Student", "Teaching Assistant", "Instructor"][no],
#     description: Faker::Company.buzzword
#   )
# end
school = School.create(
  address: Faker::Address.street_address,
  city: "Vancouver",
  country_id:1,
  description: "School",
  name: "FMS"
)
# school=School.find_by(name: "FMS")

super_user = User.create(
  email: 'nav@nav.com',
  password: PASSWORD,
  secret_question_1: "Name of your best friend?",
  answer_1_digest: Faker::Friends.character,
  secret_question_2: "Middle name of your elder kid?",
  answer_2_digest: Faker::Friends.character,
  school_id: school.id,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  about_me: "I am a student",
  telephone: Faker::PhoneNumber.cell_phone,
  address:Faker::Address.street_address,
  is_admin: true
  # user_type: UserType.find_by(title: "Instructor")
)
puts super_user.errors.full_messages
30.times.each do

  User.create(
    email: Faker::Internet.free_email,
    password: PASSWORD,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    about_me: "I am a student",
    telephone: Faker::PhoneNumber.cell_phone,
    address:Faker::Address.street_address,
    secret_question_1: "Name of your best friend?",
    answer_1_digest: Faker::Friends.character,
    secret_question_2: "Middle name of your elder kid?",
    answer_2_digest: Faker::Friends.character,
    school_id: school.id
    # user_type: UserType.find_by(title: "Student")
    )
  end
  # 2.times.each do
    
  #     User.create(
  #       email: Faker::Internet.free_email,
  #       password: PASSWORD,
  #       secret_question_1: "Name of your best friend?",
  #       answer_1_digest: Faker::Friends.character,
  #       secret_question_2: "Middle name of your elder kid?",
  #       answer_2_digest: Faker::Friends.character,
  #       school_id: school.id
  #       # user_type: UserType.find_by(title: "Instructor")
  #       )
  #     end
  #     6.times.each do
        
  #         User.create(
  #           email: Faker::Internet.free_email,
  #           password: PASSWORD,
  #           secret_question_1: "Name of your best friend?",
  #           answer_1_digest: Faker::Friends.character,
  #           secret_question_2: "Middle name of your elder kid?",
  #           answer_2_digest: Faker::Friends.character,
  #           school_id: school.id,
  #           user_type: UserType.find_by(title: "Teaching Assistant")
  #           )
  #         end
  users = User.all


  # instructors = User.where(user_type: UserType.find_by(title: "Instructor"), school_id: school.id)
  # instructors.each do |i|
  #   Instructor.create(
  #     about_me: '',
  #     email: "a@gmail.com",
  #     first_name: Faker::Name.first_name,
  #     last_name: Faker::Name.last_name,
  #     telephone_no: "604-604-6044",
  #     user_id: i.id
  #     )
  # end

  # teaching_assistant = User.where(user_type: UserType.find_by(title: "Teaching Assistant"), school_id: school.id)
  # teaching_assistant.each do |i|
  #   Instructor.create(
  #     about_me: '',
  #     email: "a@gmail.com",
  #     first_name: Faker::Name.first_name,
  #     last_name: Faker::Name.last_name,
  #     telephone_no: "604-604-6044",
  #     user_id: i.id
  #     )
  # end
  # 10.times.each do
    
  #     Instructor.create(
  #       about_me: '',
  #       email: Faker::Internet.free_email,
  #       first_name: Faker::Name.first_name,
  #       last_name: Faker::Name.last_name,
  #       telephone_no: Faker::PhoneNumber.cell_phone,
  #       school_id: 1,
  #       user_id: UserType.find_by(title: "Instructor")
  #       )
  #     end
    

  # student = User.where(user_type: UserType.find_by(title: "Student"), school_id: School.all.sample.id)
  # student.each do |i|
  #   Student.create(
  #     about_me: Faker::WorldOfWarcraft.quote,
  #     email: Faker::Internet.free_email,
  #     first_name: Faker::Name.first_name,
  #     last_name: Faker::Name.last_name,
  #     middle_name: "M",
  #     telephone_no: Faker::PhoneNumber.cell_phone,
  #     user_id: i.id
  #     )do |student|
  #     puts student.errors.full_messages
  #   end
  # end

  # students=Student.all

  10.times.each do |no|
    start_date=Faker::Date.forward(23)
    end_date=Faker::Date.forward(23)+90
    course=Course.create(
      description:Faker::Lorem.sentence(3, true),
      start_date:start_date,
      end_date:end_date,
      title: Faker::Educator.course,
      # instructor_id: instructors.sample.id,
      user_id: User.all.sample.id
      )do |course| 
      puts course.errors.full_messages
    end
    puts start_date
    puts end_date
  end
  courses=Course.all
  users.all
  users.each do |u|
    cohort=Cohort.create(
    course_id: courses.sample.id,
    user_id: u.id
    )
    # puts "*****************************"
    # puts instructors.all.sample.id
    puts cohort.errors.full_messages
    # puts "*****************************"
  end
  # do |cohort| 
  #   puts cohort.errors.full_messages
  #   end
30.times.each do
  topic=Topic.create(
    description: Faker::SiliconValley.quote,
    no_of_hours_required:rand(1..5),
    percentage_completed:rand(0..100),
    title: Faker::ProgrammingLanguage.name,
    course_id: Course.all.sample.id
  )
topic.errors.full_messages
end

topics=Topic.all 
topics.each do |t|
rand(0..9).times.each do |no|
Material.create(
  description: Faker::MostInterestingManInTheWorld.quote,
  instructions: Faker::Hacker.say_something_smart,
  title: Faker::Hacker.adjective,
  topic_id: t.id,
  file_link:Faker::File.file_name('path/to')
)
end
end

  # puts Cowsay.say("Created #{UserType.count} users type", :tux)
  puts Cowsay.say("Created #{users.count} users ", :tux)
  # puts Cowsay.say("Created #{students.count} student ", :tux)
  # puts Cowsay.say("Created #{Instructor.count} Instructors and TAs ", :tux)
  puts Cowsay.say("Created #{courses.count} courses", :tux)
  puts Cowsay.say("Created #{Cohort.count} Cohort", :tux)
  puts Cowsay.say("Created #{Topic.count} Topic", :tux)
  puts Cowsay.say("Created #{Material.count} material.", :tux)
