class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.newest_first
        @teachers = Teacher.includes(:admins) 
        @students = Student.includes(:admins)
        @admins = Admin.all
        
        @teachers.each do |teacher|
            @students.each do |student|
                if  teacher.subject == student.subject &&  !teacher.students.include?(student)
                    teacher.students << student
                    break  # Exit the inner loop after adding one student
                end
            end
        end
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.password == @user.confirm_password  
            if @user.save
                redirect_to @user, notice: 'Successfully created.'
            else
                render :new
            end
        else
            @user.errors.add(:confirm_password, "doesn't match Password")
            render :new
          end
    end

    def edit
    end

    def update
        if @user.update(user_params)
           redirect_to @user, notice: "user updated successfully" 
        else
           render :edit
        end
    end

    def destroy
        @user.destroy
        redirect_to users_url, notice:  "deleted successfully"
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:username, :password, :confirm_password, :address)
    end
end 