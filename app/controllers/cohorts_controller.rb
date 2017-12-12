class CohortsController < ApplicationController
  before_action :find_cohort, only: [:destroy]
  def new
    @courses=Course.all               #fetching all the courses
    @user=User.where(is_admin:false)  #fetching all the students
    @cohort=Cohort.new                #creating new instance of class(cohort)
  end
  def create
    course = Course.find cohort_params[:course_id] #fetching selected course
    user_ids = cohort_params[:user_id]             #fething selected students
    user_ids.delete("")                            #removing garbage from array
    course.user_ids = user_ids.map(&:to_i)         #mapping students to course
    course.save                                    #saving it to class (cohort table)
    redirect_to cohort_path(course.id)             #displaying list of students in class
  end
  def show
    @course=Course.find params[:id]                         #fetching course id from params and finding respective course
    @cohort=Cohort.where course_id:params[:id]              #finding class(cohort) w.r.t course
    @users=@cohort.map {|cohort_record| cohort_record.user} #mapping students w.r.t class

  end
  def destroy
    @course=@cohort.course_id          #fetching cohort id
    @cohort.destroy                    #removing student from class
    redirect_to cohort_path(@course)   #redirecting to same class again

  end

  def index
    @courses= Cohort.select(:course_id).distinct.map {|course_record| Course.find(course_record.course_id)}
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
