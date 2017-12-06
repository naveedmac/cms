class CoursesController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :find_course, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user!, except: [:index, :show]
    def new
        @course=Course.new
        # @user=User.where(is_admin: true)

    end
    def create
        @course = Course.new course_params
        @course.user = current_user

        # @course.user_id=User.where(is_admin: true).first
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
        if current_user.is_admin
          @courses= Course.all.order(created_at: :desc).limit(7)
        else
         @courses=Cohort.where(user_id:current_user.id).map {|course_record| Course.find(course_record.course_id)}
       end
    end
    def show

        @topics = @course.topics.order(created_at: :desc).limit(2)
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
           :title, :description, :start_date,:end_date, :user_id
        )
      end
    def find_course
        @course = Course.find params[:id]
      end
      def authorize_user!
            unless can?(:manage, @course)
              flash[:alert] = "Access Denied!"
              redirect_to root_path
            end
          end #
end
