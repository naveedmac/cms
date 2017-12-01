class CoursesController < ApplicationController
    before_action :find_course, only: [:show, :edit, :update, :destroy]
    def new
        @course=Course.new
        @instructor=Instructor.all
        
    end
    def create
        @course = Course.new course_params

        @course.user_id=User.first.id
        # byebug
        # @course.instructor_id=instructor_id
        if @course.save
            redirect_to course_path(@course)
        else
            render :new
        end
    end
    def index
        # @questions = Question.where(aasm_state: [:published, :answered]).order(created_at: :desc)
        @courses= Course.all
    end
    def show
        @topics = @course.topics.order(created_at: :desc)
        @topic = Topic.new
    end
    def edit
        
    end

    def destroy
        
    end
    def update
        
    end
    private
    def course_params
        
        params.require(:course).permit(
           :title, :description, :start_date,:end_date, :instructor_id
        )
      end
    def find_course
        @course = Course.find params[:id]
      end
end
