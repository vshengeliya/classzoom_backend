class TeachersController < ApplicationController
    before_action :find_teacher, only: [:show]

    def index
        teachers = Teacher.all
        render json: teachers
    end

    def show
        render json: @teacher.serializable_hash(include: {students: {except: ['created_at', 'updated_at']}})
    end


    private

    def find_teacher
        @teacher = Teacher.find(params[:id])
    end
end
