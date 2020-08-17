class TeacherStudent < ApplicationRecord
    belongs_to :student
    belongs_to :teacher
    belongs_to :classroom
end