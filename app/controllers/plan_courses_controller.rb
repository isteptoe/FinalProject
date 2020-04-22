class PlanCoursesController < ApplicationController
    def create
        plancourse = PlanCourse.new
        plancourse.plan_id = Plan.where(user_id: User.where(login: params[:user])[0].id, name: params[:plan])[0].id
        plancourse.course_id = Course.where(designator: params[:course])[0].id
        plancourse.term = params[:semester]
        plancourse.year = params[:year]
        plancourse.save!
    end

    def index
        plancourse = PlanCourse.where(course_id: Course.where(designator: params[:course])[0].id, plan_id: Plan.where(user_id: User.where(login: params[:user])[0].id, name: params[:plan])[0].id)[0]
        plancourse.destroy
    end
    def destroy
        @plan_course.destroy
    end
    private
    def set_plan_course
      @plan_course = PlanCourse.find(params[:id])
    end

end
