class StudentsController < ApplicationController
  before_action :set_student, only: [:show,:edit,:update,:destroy]
  def index
    @students = Student.all
  end
  def show
  end
  def new
    @student = Student.new
  end
  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to @student,notice:'successfully created.'
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'successfully updated.'
    else
      render :edit
    end
  end
  def destroy
    @student.destroy
    redirect_to students_url, notice: 'deleted successfully'
    
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end
  def student_params
    params.require(:student).permit(:name,:subject)
  end
end
