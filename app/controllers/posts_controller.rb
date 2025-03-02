class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    # show all posts
    def index
        @post = Post.all

       # @teachers = User.where(role: 'teacher')
        #@students = User.where(role: 'student')
        #@subjects = Subject.all

        #teacher.subject.id = student.su bject.id
    end

    #show one post
    def show
    end

    #create post view
    def new
        @post = Post.new
    end

    #create post
    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post, notice: 'Post has successfully created.'
        else
            render :new
        end
    end

    #fetch existing post for editing
    def edit

    end

    def update
        if @post.update(post_params)
            redirect_to @post, notice: 'Post has successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @post.destroy
        redirect_to post_url, notice: 'Post has successfully deleted.'
    end


    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content)
    end
end
