class MaterialsController < ApplicationController
    before_action :find_topic, only: [:create]
    before_action :find_material, only: [:destroy,:show]

    def create
        @material = @topic.material.new material_params

        # @material.user = User.first

        if @material.save

          redirect_to topic_path(@topic)
        else
          @materials = @topic.material.order(created_at: :desc)
          render 'topics/show'
        end
      end
    def destroy
        @material.destroy
        redirect_to topic_path(@material.topic)
      end
      def show
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
