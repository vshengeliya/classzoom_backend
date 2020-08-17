class Student < ApplicationRecord
    include ActiveModel::Serializers::JSON

    has_many :teacher_students
    has_many :teachers, through: :teacher_students

    
    def attributes
        { 'id' => nil, 'name' => nil, 'email' => nil, 'zoom_url' => nil }
    end
end