json.plan do
    json.student @plan.user.login
    json.name @plan.name
    json.major @plan.major.major
    json.currYear @plan.currYear
    json.currTerm @plan.currTerm
    json.catalogYear @plan.catalog.catalogYear.to_s
    json.realName @plan.user.realName
    json.courses do
        @plan.plan_courses.each{ |planCourse| json.set! planCourse.course.designator do
            json.id planCourse.course.designator
            json.year planCourse.year
            json.term planCourse.term
        end}

    end
end

json.catalog do
    json.year @plan.catalog.catalogYear.to_s
    json.courses do
        @plan.catalog.course_catalogs.each{ |catCourse| json.set! catCourse.course.designator do
            json.id catCourse.course.designator
            json.name catCourse.course.name
            json.description catCourse.course.description
            json.credits catCourse.course.credits.to_f
        end}

    end 
end

json.requirements do
    json.categories do
        @plan.major.requirements[0].catagories.each{ |cat| json.set! cat.catagory do
            json.courses cat.catagory_courses.collect {|cc| cc.course.designator}
        end }
    end
end

# json.planList do
#     json.plans @plans do |plan|
#         json.id plan.id
#         json.name plan.name
#     end
# end
#
# json.courses do
#     json.courses @courses do |course|
#         json.designator course.designator
#         json.name course.name
#         json.credits course.credits
#     end
# end
