class Classroom < ApplicationRecord
  has_many :teacher_students
  has_many :students, through: :teacher_students
  has_many :teachers, through: :teacher_students
  
  has_many :events

  # refactoring note: rename method for ease of use on frontend when handling as json objects
  def unique_teachers
    self.teachers.uniq
  end
end
