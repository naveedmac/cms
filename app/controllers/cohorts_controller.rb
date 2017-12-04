class CohortsController < ApplicationController
    def new
      @courses=Course.all
      @user=User.where(is_admin:false)  
      @cohort=Cohort.new
    end
    def create
      course = Course.find cohort_params[:course_id]
      user_ids = cohort_params[:user_id]
      user_ids.delete("")
      course.user_ids = user_ids.map(&:to_i)
      course.save
      redirect_to cohort_path(course.id)
      # ##############################################
      #   By Tam
      #   course = Course.find params[:cohort][:course_id]
      #   student_ids = params[:cohort][:student_id]
      #   student_ids.delete("")
      #   course.student_ids = student_ids.map(&:to_i)
      #   redirect_to cohort_path(course.id)
        ########################
        # byebug
            # course = cohort_params["course_id"]
            # students=cohort_params["student_id"]
            # students.each do |student|
                # # if student != ""
                # cohort=Cohort.new cohort_params
                # if cohort.save!
                #     redirect_to cohort_path(@cohort), notice: 'Students enrolled!'
                # else
                #   redirect_to new_cohort_path, alert: errors
                # end
            # end

            # cohort = Cohort.new cohort_params
            
            # if errors.empty?
            #   redirect_to cohort, notice: 'Students enrolled!'
            # else
            #   redirect_to cohort, alert: errors
            # end
        #   end
        end
          def show
                @course=Course.find params[:id]
                @cohort=Cohort.where course_id:params[:id]
                @users=@cohort.map {|cohort_record| cohort_record.user}
                
                #byebug
            #   @cohort= Course.find.map (Cohort.all.group(:course_id).count)
          end
          def index
            # @questions = Question.where(aasm_state: [:published, :answered]).order(created_at: :desc)
            @courses= Cohort.select(:course_id).distinct.map {|course_record| Course.find(course_record.course_id)}
            # p @courses
        end
          private
          def students_params
          params.require(student_id)
            end
          def cohort_params
              
              params.require(:cohort).permit(
                 :course_id, {user_id: []}
              )
            end
          def find_cohort
              @cohort = Cohort.find params[:id]
            end
end
