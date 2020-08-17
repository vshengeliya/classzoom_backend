class ClassroomsController < ApplicationController
    before_action :find_classroom, only: [:show]

    def index
        classrooms = Classroom.all
        render json: classrooms
    end

    def show
        render json: @classroom.serializable_hash(include: [{students: {except: ['created_at', 'updated_at']}}, {unique_teachers: {except: ['created_at', 'updated_at']}}] )
    end


    private

    def find_classroom
        @classroom = Classroom.find(params[:id])
    end
end
