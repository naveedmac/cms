class TopicsController < ApplicationController
  before_action :find_course, only: [:new,:create]
  before_action :find_topic, only: [:show, :destroy]
  before_action :authorize_user!
def new
@topic = Topic.new

end
    def create
        @topic = @course.topics.build(topic_params)

        # @topic.user = User.first
# byebug
        if @topic.save

          redirect_to course_path(@course)
        else
          @topics = @course.topics.order(created_at: :desc)
          render :new
        end
      end
      def show
        # byebug
#################
# def show
#   @topics = @course.topics.order(created_at: :desc)
#   @topic = Topic.new
# end
###########

        @materials = @topic.material.order(created_at: :desc)
        @material = Material.new
    end
    def destroy
      @course=@topic.course
        @topic.destroy
        redirect_to course_path(@course)
      end
    private
    def find_course
        @course = Course.find(params[:course_id])
      end

      def find_topic
        @topic = Topic.find params[:id]
      end

      def topic_params
        params.require(:topic).permit(:title, :description,:no_of_hours_required, :percentage_completed,:file_link, :instructions)
      end
      def authorize_user!

           unless can?(:manage, @topic)
             flash[:alert] = "Access Denied!"
             redirect_to root_path

           end
         end
end
