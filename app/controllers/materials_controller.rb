class MaterialsController < ApplicationController
    before_action :find_topic, only: [:new,:create]
    before_action :find_material, only: [:destroy,:show]
    before_action :authorize_user!, except: [:index, :show]
    def new
      @material=Material.new
    end
    def create
        @material = @topic.material.new material_params

        # @material.user = User.first

        if @material.save

          redirect_to topic_path(@topic)
        else
          @materials = @topic.material.order(created_at: :desc)
          render :new
          # 'topics/show'
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
        params.require(:material).permit(:title, :description,:instructions, :file_link,:url_link)
      end
      def authorize_user!
            unless can?(:manage, @course)
              flash[:alert] = "Access Denied!"
              redirect_to root_path
            end
          end #
end
