class CohortsController < ApplicationController
    def new
      @courses=Course.all
      @student=Student.all  
      @cohort=Cohort.new
    end
    def create
        course = Course.find params[:cohort][:course_id]
        student_ids = params[:cohort][:student_id]
        student_ids.delete("")
        course.student_ids = student_ids.map(&:to_i)
        # redirect_to course
        redirect_to cohort_path(course.id)
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
            
                @cohort=Cohort.where course_id:params[:id]
                @students=@cohort.map {|cohort_record| cohort_record.student}
                
                #byebug
            #   @cohort= Course.find_course.map (Cohort.all.group(:course_id).count)
          end
          private
          def students_params
          params.require(student_id)
            end
          def cohort_params
              
              params.require(:cohort).permit(
                 :course_id, {student_id: []}
              )
            end
          def find_cohort
              @cohort = Cohort.find params[:id]
            end
end
