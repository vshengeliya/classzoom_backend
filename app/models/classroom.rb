class Classroom < ApplicationRecord
  has_many :teacher_students
  has_many :students, through: :teacher_students
  has_many :teachers, through: :teacher_students
  
  has_many :events
end
