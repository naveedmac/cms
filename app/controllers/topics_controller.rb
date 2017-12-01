class TopicsController < ApplicationController
    before_action :find_topic, only: [:show, :create]
    def create
        @topic = @course.topics.build(topic_params)
        
        # @topic.user = User.first
    
        if @topic.save
          
          redirect_to course_path(@course)
        else
          @topic = @course.topic.order(created_at: :desc)
          render 'courses/show'
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
        @topic.destroy
        redirect_to course_path(@topic.course)
      end
    private
    def find_course
        @course = Course.find(params[:course_id])
      end
    
      def find_topic
        @topic = Topic.find(params[:id])
      end
    
      def topic_params
        params.require(:topic).permit(:title, :description,:file_link, :instructions)
      end
end
