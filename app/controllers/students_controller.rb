class StudentsController < ApplicationController
    before_action :find_student, only: [:show, :update, :destroy]

    def index
        students = Student.all
        render json: students
    end

    def show
        render json: @student.serializable_hash(include: {teachers: {except: ['created_at', 'updated_at']}})
    end

    def update
        #byebug
        # explore student_params and params to confirm structure
        #* I think the parmas on frontend should specify key for model-type (i.e., student or teacher); this should help resolve potential bugs on 'zoom_meeting_controller.rb' side
        @student.update(student_params)

        render json: @student
    end

    def destroy
        @student.destroy

        render json: {status: 'success'}
    end


    private

    def find_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.require(:student).permit(:name, :email)
    end
end
