class MaterialsController < ApplicationController
    before_action :find_topic, only: [:create]

    def create
        @material = @topic.material.new material_params
        
        # @material.user = User.first
    
        if @material.save
          
          redirect_to topic_path(@topic)
        else
          @material = @topic.material.order(created_at: :desc)
          render 'topics/show'
        end
      end
    def destroy
        @material.destroy
        redirect_to topic_path(@material.topic)
      end
    private
    def find_topic
        @topic = Topic.find(params[:topic_id])
      end
    
      def find_material
        @material = Material.find(params[:id])
      end
    
      def material_params
        params.require(:material).permit(:title, :description,:instructions, :file_link)
      end
end
