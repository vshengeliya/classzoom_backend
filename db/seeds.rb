puts "Seeding database..."

puts "#1 - Destroying seeded data"
Event.destroy_all
TeacherStudent.destroy_all
Classroom.destroy_all
Student.destroy_all
Teacher.destroy_all

puts "#2 - Seeding database with..."

flatiron = Classroom.create!( name: "The Best Cohort: 06-22-20" )
teacher_obj = Teacher.create!( name: "Steven", email: "steven@flatiron.js", password_digest: BCrypt::Password.create('password'), current_zoom_meeting_url: "https://us04web.zoom.us/j/1234567890?pwd=R3ZBU2JBN3NnOTlDbHh1VjR4Q1NhUT09", current_zoom_meeting_id: "1234567890", current_zoom_meeting_password: "password", current_zoom_meeting_start_time: "08-20-2020 20:00", current_zoom_meeting_duration: 60)

puts "#2a - ... students, teacher:"
require 'csv'
students = CSV.parse(File.read("./storage/flatiron_cohort_062220_student_list.csv"), headers: true)

students.each { |student| Student.create!( name: student, email: student["name"].downcase.split(" ").first + "@gmail.com", password_digest: BCrypt::Password.create('password'), current_zoom_meeting_url: "https://us04web.zoom.us/j/1234567890?pwd=R3ZBU2JBN3NnOTlDbHh1VjR4Q1NhUT09", current_zoom_meeting_id: "1234567890", current_zoom_meeting_password: "password", current_zoom_meeting_start_time: "08-20-2020 20:00", current_zoom_meeting_duration: 60)}

Student.all.each do |student|
    TeacherStudent.create!( student: student, teacher: teacher_obj, classroom_id: flatiron.id )
end


puts "#2b - ... events to one classroom"

(1..5).each do |i|
    Event.create!( name: "Test-Event#{i}", date: Time.now.strftime("%F"), time: Time.now.strftime("%H:%M"), description: "Test-Desc#{i}" , zoom_url: "https://us04web.zoom.us/j/1234567890?pwd=R3ZBU2JBN3NnOTlDbHh1VjR4Q1NhUT09", classroom: flatiron )
end

puts "Seeding is complete"