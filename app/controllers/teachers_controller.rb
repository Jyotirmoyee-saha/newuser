class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  def index
    @teachers = Teacher.all
  end
  def show
  end
  def new
    @teacher = Teacher.new
  end
  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to @teacher, notice: 'Teacher was successfully created.'
    else
      flash.now[:alert] = 'Failed to create teacher.'
      render :new
    end
  end
  def edit
  end
  def update
    if @teacher.update(teacher_params)
      redirect_to @teacher, notice: 'Teacher was successfully updated.'
    else
      flash.now[:alert] = 'Failed to update teacher.'
      render :edit
    end
  end
  def destroy
    @teacher.destroy
    redirect_to teachers_url, notice: 'Teacher was successfully deleted.'
  end

  private

  def set_teacher
    @teacher = Teacher.find_by(id: params[:id])
    redirect_to teachers_url, alert: 'Teacher not found.' unless @teacher
  end

  def teacher_params
    params.require(:teacher).permit(:name, :subject)
  end
end

