class StudentsController < ApplicationController
    def new
        @user=Student.new
        
    end
end
