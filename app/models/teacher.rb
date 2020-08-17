class Teacher < ApplicationRecord
    include ActiveModel::Serializers::JSON

    has_many :teacher_students
    has_many :students, through: :teacher_students

    def attributes
        { 'id' => nil, 'name' => nil, 'email' => nil, 'zoom_url' => nil }
    end
end
