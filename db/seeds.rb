# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
major1 = Major.new
major1.major = "Computer Science"
major1.save!

major2 = Major.new
major2.major = "Computer Engineering"
major2.save!

major3 = Major.new
major3.major = "Other"
major3.save!

user1 = User.new
user1.login = "cnash"
user1.email = "cnash@cedarville.edu"
user1.password = "password"
user1.password_confirmation = "password"
user1.major_id = major1.id
user1.realName = "Cullen Nash"
user1.save!

user2 = User.new
user2.login = "isteptoe"
user2.email = "isteptoe@cedarville.edu"
user2.password = "password"
user2.password_confirmation = "password"
user2.major_id = major2.id
user2.realName = "Ian Steptoe"
user2.save!

user3 = User.new
user3.login = "djacobs"
user3.email = "djacobs@cedarville.edu"
user3.password = "password"
user3.password_confirmation = "password"
user3.major_id = major2.id
user3.realName = "Daniel Jacobs"
user3.save!

user4 = User.new
user4.login = "admin"
user4.email = "admin@cedarville.edu"
user4.password = "password"
user4.password_confirmation = "password"
user4.major_id = major2.id
user4.realName = "Faculty"
user4.save!

catalog1 = Catalog.new
catalog1.catalogYear = 2018
catalog1.save!

catalog2 = Catalog.new
catalog2.catalogYear = 2019
catalog2.save!


plan1 = Plan.new
plan1.name = "Plan 1"
plan1.user_id = user1.id
plan1.catalog_id = catalog1.id
plan1.major_id = major1.id
plan1.currYear = 2020
plan1.currTerm = "Spring"
plan1.save!

plan2 = Plan.new
plan2.name = "Plan 2"
plan2.user_id = user1.id
plan2.catalog_id = catalog1.id
plan2.major_id = major1.id
plan2.currYear = 2020
plan2.currTerm = "Spring"
plan2.save!

plan3 = Plan.new
plan3.name = "Plan 3"
plan3.user_id = user1.id
plan3.catalog_id = catalog1.id
plan3.major_id = major2.id
plan3.currYear = 2020
plan3.currTerm = "Spring"
plan3.save!

plan4 = Plan.new
plan4.name = "Plan 4"
plan4.user_id = user2.id
plan4.catalog_id = catalog1.id
plan4.major_id = major3.id
plan4.currYear = 2020
plan4.currTerm = "Spring"
plan4.save!

plan5 = Plan.new
plan5.name = "Plan 5"
plan5.user_id = user2.id
plan5.catalog_id = catalog1.id
plan5.major_id = major2.id
plan5.currYear = 2020
plan5.currTerm = "Spring"
plan5.save!

plan6 = Plan.new
plan6.name = "Plan 6"
plan6.user_id = user2.id
plan6.catalog_id = catalog1.id
plan6.major_id = major3.id
plan6.currYear = 2020
plan6.currTerm = "Spring"
plan6.save!

course1 = Course.new
course1.designator = 'BTGE-1720'
course1.name = 'SPIFO'
course1.description = 'Introductory Bible Class'
course1.credits = 3.0
course1.save!
course2 = Course.new
course2.designator = 'CHEM-1050'
course2.name = 'Chemistry'
course2.description = 'Bedroom Course'
course2.credits = 3.0
course2.save!
course3 = Course.new
course3.designator = 'CS-1210'
course3.name = 'C++ Programming'
course3.description = 'Feeble effort to teach programming'
course3.credits = 3.0
course3.save!
course4 = Course.new
course4.designator = 'CS-1220'
course4.name = 'OOD'
course4.description = 'Why do we still teach C++'
course4.credits = 3.0
course4.save!
course5 = Course.new
course5.designator = 'CS-2210'
course5.name = 'Java'
course5.description = 'What an awesome prof!!!!'
course5.credits = 3.0
course5.save!
course6 = Course.new
course6.designator = 'CS-3220'
course6.name = 'Web Apps'
course6.description = 'Who won the Medal of Honor at Gettysburg'
course6.credits = 3.0
course6.save!
course7 = Course.new
course7.designator = 'CS-3310'
course7.name = 'O/S'
course7.description = 'Forget Windows; Let us do Linux!'
course7.credits = 3.0
course7.save!
course8 = Course.new
course8.designator = 'CS-3320'
course8.name = 'O/S'
course8.description = 'Linux Kernel'
course8.credits = 3.0
course8.save!
course9 = Course.new
course9.designator = 'CS-3350'
course9.name = 'Foundations'
course9.description = 'I Love DSZQUP'
course9.credits = 3.0
course9.save!
course10 = Course.new
course10.designator = 'CS-3510'
course10.name = 'Compiler'
course10.description = 'The BEST! Way Cool!'
course10.credits = 3.0
course10.save!
course11 = Course.new
course11.designator = 'CS-3610'
course11.name = 'Database'
course11.description = 'What is a left join?'
course11.credits = 3.0
course11.save!
course12 = Course.new
course12.designator = 'CS-4310'
course12.name = 'Cyber Ops'
course12.description = 'Attack!'
course12.credits = 3.0
course12.save!
course13 = Course.new
course13.designator = 'CS-4330'
course13.name = 'Software Security'
course13.description = 'buffer overflow'
course13.credits = 3.0
course13.save!
course14 = Course.new
course14.designator = 'CS-4410'
course14.name = 'Parallel Computing'
course14.description = 'Impossible'
course14.credits = 3.0
course14.save!
course15 = Course.new
course15.designator = 'CS-4710'
course15.name = 'Computer Graphics'
course15.description = 'Just games'
course15.credits = 3.0
course15.save!
course16 = Course.new
course16.designator = 'CS-4810'
course16.name = 'Software Engr I'
course16.description = 'Love Senior Design!'
course16.credits = 3.0
course16.save!
course17 = Course.new
course17.designator = 'CS-4820'
course17.name = 'Software Engr II'
course17.description = 'Love Senior Design!'
course17.credits = 3.0
course17.save!
course18 = Course.new
course18.designator = 'EGCP-1010'
course18.name = 'DLD'
course18.description = 'Cool course with AND, OR, and NOT'
course18.credits = 3.0
course18.save!
course20 = Course.new
course20.designator = 'EGCP-3010'
course20.name = 'ADLD'
course20.description = 'I AM ROBOT'
course20.credits = 3.0
course20.save!
course21 = Course.new
course21.designator = 'EGCP-3210'
course21.name = 'Computer Arch'
course21.description = 'Build the Pipeline!'
course21.credits = 3.0
course21.save!
course22 = Course.new
course22.designator = 'EGCP-4210'
course22.name = 'Adv Comp Arch'
course22.description = 'We love Tomasulo'
course22.credits = 3.0
course22.save!
course23 = Course.new
course23.designator = 'EGCP-4310'
course23.name = 'Networks'
course23.description = 'Networking is very importing for finding a job'
course23.credits = 3.0
course23.save!
course19 = Course.new
course19.designator = 'EGGN-3110'
course19.name = 'Ethics'
course19.description = 'Politicians need to take this course!'
course19.credits = 3.0
course19.save!
course24 = Course.new
course24.designator = 'EGGN-4010'
course24.name = 'Software Engr I'
course24.description = 'Wrong Major!'
course24.credits = 3.0
course24.save!
course25 = Course.new
course25.designator = 'MATH-1710'
course25.name = 'Calc I'
course25.description = 'A weedout course'
course25.credits = 3.0
course25.save!
course26 = Course.new
course26.designator = 'MATH-1720'
course26.name = 'Calc II'
course26.description = 'For the few who passed Calc I'
course26.credits = 3.0
course26.save!
course27 = Course.new
course27.designator = 'MATH-2520'
course27.name = 'Discrete Math w/ Prob'
course27.description = 'We should always be discrete'
course27.credits = 3.0
course27.save!
course28 = Course.new
course28.designator = 'MATH-3500'
course28.name = 'Number Theory'
course28.description = 'Why?'
course28.credits = 3.0
course28.save!
course29 = Course.new
course29.designator = 'MATH-3610'
course29.name = 'Linear Algebra'
course29.description = 'As opposed to non-linear algegra?'
course29.credits = 3.0
course29.save!
course30 = Course.new
course30.designator = 'MATH-3760'
course30.name = 'Numeric Analysis'
course30.description = 'Painful!'
course30.credits = 3.0
course30.save!
course31 = Course.new
course31.designator = 'PHYS-2110'
course31.name = 'Physics I'
course31.description = 'Distance, Velocity, Acceleration'
course31.credits = 3.0
course31.save!
course32 = Course.new
course32.designator = 'PHYS-2120'
course32.name = 'Physics II'
course32.description = 'Why do we take this again?'
course32.credits = 3.0
course32.save!
course33 = Course.new
course33.designator = 'CS-3410'
course33.name = 'Algorithms'
course33.description = 'The heart of Computer Science'
course33.credits = 3.0
course33.save!

plancourse1 = PlanCourse.new
plancourse1.plan_id = plan1.id
plancourse1.course_id = course1.id
plancourse1.term = "Spring"
plancourse1.year = 2020
plancourse1.save!

plancourse2 = PlanCourse.new
plancourse2.plan_id = plan1.id
plancourse2.course_id = course2.id
plancourse2.term = "Summer"
plancourse2.year = 2020
plancourse2.save!

plancourse3 = PlanCourse.new
plancourse3.plan_id = plan1.id
plancourse3.course_id = course3.id
plancourse3.term = "Fall"
plancourse3.year = 2020
plancourse3.save!

plancourse4 = PlanCourse.new
plancourse4.plan_id = plan2.id
plancourse4.course_id = course4.id
plancourse4.term = "Spring"
plancourse4.year = 2020
plancourse4.save!

plancourse5 = PlanCourse.new
plancourse5.plan_id = plan2.id
plancourse5.course_id = course5.id
plancourse5.term = "Summer"
plancourse5.year = 2020
plancourse5.save!

plancourse6 = PlanCourse.new
plancourse6.plan_id = plan2.id
plancourse6.course_id = course6.id
plancourse6.term = "Fall"
plancourse6.year = 2020
plancourse6.save!

plancourse7 = PlanCourse.new
plancourse7.plan_id = plan3.id
plancourse7.course_id = course7.id
plancourse7.term = "Spring"
plancourse7.year = 2020
plancourse7.save!

plancourse8 = PlanCourse.new
plancourse8.plan_id = plan3.id
plancourse8.course_id = course8.id
plancourse8.term = "Summer"
plancourse8.year = 2020
plancourse8.save!

plancourse9 = PlanCourse.new
plancourse9.plan_id = plan3.id
plancourse9.course_id = course9.id
plancourse9.term = "Fall"
plancourse9.year = 2020
plancourse9.save!

plancourse10 = PlanCourse.new
plancourse10.plan_id = plan4.id
plancourse10.course_id = course10.id
plancourse10.term = "Spring"
plancourse10.year = 2020
plancourse10.save!

plancourse11 = PlanCourse.new
plancourse11.plan_id = plan4.id
plancourse11.course_id = course11.id
plancourse11.term = "Summer"
plancourse11.year = 2020
plancourse11.save!

plancourse12 = PlanCourse.new
plancourse12.plan_id = plan4.id
plancourse12.course_id = course12.id
plancourse12.term = "Fall"
plancourse12.year = 2020
plancourse12.save!

plancourse13 = PlanCourse.new
plancourse13.plan_id = plan5.id
plancourse13.course_id = course13.id
plancourse13.term = "Spring"
plancourse13.year = 2020
plancourse13.save!

plancourse14 = PlanCourse.new
plancourse14.plan_id = plan5.id
plancourse14.course_id = course14.id
plancourse14.term = "Summer"
plancourse14.year = 2020
plancourse14.save!

plancourse15 = PlanCourse.new
plancourse15.plan_id = plan5.id
plancourse15.course_id = course15.id
plancourse15.term = "Fall"
plancourse15.year = 2020
plancourse15.save!

plancourse16 = PlanCourse.new
plancourse16.plan_id = plan6.id
plancourse16.course_id = course16.id
plancourse16.term = "Spring"
plancourse16.year = 2020
plancourse16.save!

plancourse17 = PlanCourse.new
plancourse17.plan_id = plan6.id
plancourse17.course_id = course17.id
plancourse17.term = "Summer"
plancourse17.year = 2020
plancourse17.save!

plancourse18 = PlanCourse.new
plancourse18.plan_id = plan6.id
plancourse18.course_id = course18.id
plancourse18.term = "Fall"
plancourse18.year = 2020
plancourse18.save!

coursecatalog1 = CourseCatalog.new
coursecatalog1.course_id = course1.id
coursecatalog1.catalog_id = catalog1.id
coursecatalog1.save!

coursecatalog2 = CourseCatalog.new
coursecatalog2.course_id = course2.id
coursecatalog2.catalog_id = catalog1.id
coursecatalog2.save!

coursecatalog3 = CourseCatalog.new
coursecatalog3.course_id = course3.id
coursecatalog3.catalog_id = catalog1.id
coursecatalog3.save!

coursecatalog4 = CourseCatalog.new
coursecatalog4.course_id = course4.id
coursecatalog4.catalog_id = catalog1.id
coursecatalog4.save!

coursecatalog5 = CourseCatalog.new
coursecatalog5.course_id = course5.id
coursecatalog5.catalog_id = catalog1.id
coursecatalog5.save!

coursecatalog6 = CourseCatalog.new
coursecatalog6.course_id = course6.id
coursecatalog6.catalog_id = catalog1.id
coursecatalog6.save!

coursecatalog7 = CourseCatalog.new
coursecatalog7.course_id = course7.id
coursecatalog7.catalog_id = catalog1.id
coursecatalog7.save!

coursecatalog8 = CourseCatalog.new
coursecatalog8.course_id = course8.id
coursecatalog8.catalog_id = catalog1.id
coursecatalog8.save!

coursecatalog9 = CourseCatalog.new
coursecatalog9.course_id = course9.id
coursecatalog9.catalog_id = catalog1.id
coursecatalog9.save!

coursecatalog10 = CourseCatalog.new
coursecatalog10.course_id = course10.id
coursecatalog10.catalog_id = catalog1.id
coursecatalog10.save!

coursecatalog11 = CourseCatalog.new
coursecatalog11.course_id = course11.id
coursecatalog11.catalog_id = catalog1.id
coursecatalog11.save!

coursecatalog12 = CourseCatalog.new
coursecatalog12.course_id = course12.id
coursecatalog12.catalog_id = catalog1.id
coursecatalog12.save!

coursecatalog13 = CourseCatalog.new
coursecatalog13.course_id = course13.id
coursecatalog13.catalog_id = catalog1.id
coursecatalog13.save!

coursecatalog14 = CourseCatalog.new
coursecatalog14.course_id = course14.id
coursecatalog14.catalog_id = catalog1.id
coursecatalog14.save!

coursecatalog15 = CourseCatalog.new
coursecatalog15.course_id = course15.id
coursecatalog15.catalog_id = catalog1.id
coursecatalog15.save!

coursecatalog16 = CourseCatalog.new
coursecatalog16.course_id = course16.id
coursecatalog16.catalog_id = catalog1.id
coursecatalog16.save!

coursecatalog17 = CourseCatalog.new
coursecatalog17.course_id = course17.id
coursecatalog17.catalog_id = catalog1.id
coursecatalog17.save!

coursecatalog18 = CourseCatalog.new
coursecatalog18.course_id = course18.id
coursecatalog18.catalog_id = catalog1.id
coursecatalog18.save!

coursecatalog19 = CourseCatalog.new
coursecatalog19.course_id = course19.id
coursecatalog19.catalog_id = catalog1.id
coursecatalog19.save!

coursecatalog20 = CourseCatalog.new
coursecatalog20.course_id = course20.id
coursecatalog20.catalog_id = catalog1.id
coursecatalog20.save!

coursecatalog21 = CourseCatalog.new
coursecatalog21.course_id = course21.id
coursecatalog21.catalog_id = catalog1.id
coursecatalog21.save!

coursecatalog22 = CourseCatalog.new
coursecatalog22.course_id = course22.id
coursecatalog22.catalog_id = catalog1.id
coursecatalog22.save!

coursecatalog23 = CourseCatalog.new
coursecatalog23.course_id = course23.id
coursecatalog23.catalog_id = catalog1.id
coursecatalog23.save!

coursecatalog24 = CourseCatalog.new
coursecatalog24.course_id = course24.id
coursecatalog24.catalog_id = catalog1.id
coursecatalog24.save!

coursecatalog25 = CourseCatalog.new
coursecatalog25.course_id = course25.id
coursecatalog25.catalog_id = catalog1.id
coursecatalog25.save!

coursecatalog26 = CourseCatalog.new
coursecatalog26.course_id = course26.id
coursecatalog26.catalog_id = catalog1.id
coursecatalog26.save!

coursecatalog27 = CourseCatalog.new
coursecatalog27.course_id = course27.id
coursecatalog27.catalog_id = catalog1.id
coursecatalog27.save!

coursecatalog28 = CourseCatalog.new
coursecatalog28.course_id = course28.id
coursecatalog28.catalog_id = catalog1.id
coursecatalog28.save!

coursecatalog29 = CourseCatalog.new
coursecatalog29.course_id = course29.id
coursecatalog29.catalog_id = catalog1.id
coursecatalog29.save!

coursecatalog30 = CourseCatalog.new
coursecatalog30.course_id = course30.id
coursecatalog30.catalog_id = catalog1.id
coursecatalog30.save!

coursecatalog31 = CourseCatalog.new
coursecatalog31.course_id = course31.id
coursecatalog31.catalog_id = catalog1.id
coursecatalog31.save!

coursecatalog32 = CourseCatalog.new
coursecatalog32.course_id = course32.id
coursecatalog32.catalog_id = catalog1.id
coursecatalog32.save!

coursecatalog33 = CourseCatalog.new
coursecatalog33.course_id = course33.id
coursecatalog33.catalog_id = catalog1.id
coursecatalog33.save!

coursecatalog34 = CourseCatalog.new
coursecatalog34.course_id = course1.id
coursecatalog34.catalog_id = catalog2.id
coursecatalog34.save!

coursecatalog35 = CourseCatalog.new
coursecatalog35.course_id = course2.id
coursecatalog35.catalog_id = catalog2.id
coursecatalog35.save!

coursecatalog36 = CourseCatalog.new
coursecatalog36.course_id = course3.id
coursecatalog36.catalog_id = catalog2.id
coursecatalog36.save!

coursecatalog37 = CourseCatalog.new
coursecatalog37.course_id = course4.id
coursecatalog37.catalog_id = catalog2.id
coursecatalog37.save!

coursecatalog38 = CourseCatalog.new
coursecatalog38.course_id = course5.id
coursecatalog38.catalog_id = catalog2.id
coursecatalog38.save!

coursecatalog39 = CourseCatalog.new
coursecatalog39.course_id = course6.id
coursecatalog39.catalog_id = catalog2.id
coursecatalog39.save!

coursecatalog40 = CourseCatalog.new
coursecatalog40.course_id = course7.id
coursecatalog40.catalog_id = catalog2.id
coursecatalog40.save!

coursecatalog41 = CourseCatalog.new
coursecatalog41.course_id = course8.id
coursecatalog41.catalog_id = catalog2.id
coursecatalog41.save!

coursecatalog42 = CourseCatalog.new
coursecatalog42.course_id = course9.id
coursecatalog42.catalog_id = catalog2.id
coursecatalog42.save!

coursecatalog43 = CourseCatalog.new
coursecatalog43.course_id = course10.id
coursecatalog43.catalog_id = catalog2.id
coursecatalog43.save!

coursecatalog44 = CourseCatalog.new
coursecatalog44.course_id = course11.id
coursecatalog44.catalog_id = catalog2.id
coursecatalog44.save!

coursecatalog45 = CourseCatalog.new
coursecatalog45.course_id = course12.id
coursecatalog45.catalog_id = catalog2.id
coursecatalog45.save!

coursecatalog46 = CourseCatalog.new
coursecatalog46.course_id = course13.id
coursecatalog46.catalog_id = catalog2.id
coursecatalog46.save!

coursecatalog47 = CourseCatalog.new
coursecatalog47.course_id = course14.id
coursecatalog47.catalog_id = catalog2.id
coursecatalog47.save!

coursecatalog48 = CourseCatalog.new
coursecatalog48.course_id = course15.id
coursecatalog48.catalog_id = catalog2.id
coursecatalog48.save!

coursecatalog49 = CourseCatalog.new
coursecatalog49.course_id = course16.id
coursecatalog49.catalog_id = catalog2.id
coursecatalog49.save!

coursecatalog50 = CourseCatalog.new
coursecatalog50.course_id = course17.id
coursecatalog50.catalog_id = catalog2.id
coursecatalog50.save!

coursecatalog51 = CourseCatalog.new
coursecatalog51.course_id = course18.id
coursecatalog51.catalog_id = catalog2.id
coursecatalog51.save!

coursecatalog52 = CourseCatalog.new
coursecatalog52.course_id = course19.id
coursecatalog52.catalog_id = catalog2.id
coursecatalog52.save!

coursecatalog53 = CourseCatalog.new
coursecatalog53.course_id = course20.id
coursecatalog53.catalog_id = catalog2.id
coursecatalog53.save!

coursecatalog54 = CourseCatalog.new
coursecatalog54.course_id = course21.id
coursecatalog54.catalog_id = catalog2.id
coursecatalog54.save!

coursecatalog55 = CourseCatalog.new
coursecatalog55.course_id = course22.id
coursecatalog55.catalog_id = catalog2.id
coursecatalog55.save!

coursecatalog56 = CourseCatalog.new
coursecatalog56.course_id = course23.id
coursecatalog56.catalog_id = catalog2.id
coursecatalog56.save!

coursecatalog57 = CourseCatalog.new
coursecatalog57.course_id = course24.id
coursecatalog57.catalog_id = catalog2.id
coursecatalog57.save!

coursecatalog58 = CourseCatalog.new
coursecatalog58.course_id = course25.id
coursecatalog58.catalog_id = catalog2.id
coursecatalog58.save!

coursecatalog59 = CourseCatalog.new
coursecatalog59.course_id = course26.id
coursecatalog59.catalog_id = catalog2.id
coursecatalog59.save!

coursecatalog60 = CourseCatalog.new
coursecatalog60.course_id = course27.id
coursecatalog60.catalog_id = catalog2.id
coursecatalog60.save!

coursecatalog61 = CourseCatalog.new
coursecatalog61.course_id = course28.id
coursecatalog61.catalog_id = catalog2.id
coursecatalog61.save!

coursecatalog62 = CourseCatalog.new
coursecatalog62.course_id = course29.id
coursecatalog62.catalog_id = catalog2.id
coursecatalog62.save!

coursecatalog63 = CourseCatalog.new
coursecatalog63.course_id = course30.id
coursecatalog63.catalog_id = catalog2.id
coursecatalog63.save!

coursecatalog64 = CourseCatalog.new
coursecatalog64.course_id = course31.id
coursecatalog64.catalog_id = catalog2.id
coursecatalog64.save!

coursecatalog65 = CourseCatalog.new
coursecatalog65.course_id = course32.id
coursecatalog65.catalog_id = catalog2.id
coursecatalog65.save!

coursecatalog66 = CourseCatalog.new
coursecatalog66.course_id = course33.id
coursecatalog66.catalog_id = catalog2.id
coursecatalog66.save!

requirement1 = Requirement.new
requirement1.major_id = major1.id
requirement1.catalog_id = catalog1.id
requirement1.save!

requirement2 = Requirement.new
requirement2.major_id = major2.id
requirement2.catalog_id = catalog1.id
requirement2.save!

requirement3 = Requirement.new
requirement3.major_id = major3.id
requirement3.catalog_id = catalog2.id
requirement3.save!

catagory1 = Catagory.new
catagory1.requirement_id = requirement1.id
catagory1.catagory = "Core"
catagory1.save!

catagory2 = Catagory.new
catagory2.requirement_id = requirement1.id
catagory2.catagory = "Electives"
catagory2.save!

catagory3 = Catagory.new
catagory3.requirement_id = requirement1.id
catagory3.catagory = "Cognates"
catagory3.save!

catagory4 = Catagory.new
catagory4.requirement_id = requirement2.id
catagory4.catagory = "Core"
catagory4.save!

catagory5 = Catagory.new
catagory5.requirement_id = requirement2.id
catagory5.catagory = "Electives"
catagory5.save!

catagory6 = Catagory.new
catagory6.requirement_id = requirement2.id
catagory6.catagory = "Cognates"
catagory6.save!

catagory7 = Catagory.new
catagory7.requirement_id = requirement3.id
catagory7.catagory = "Core"
catagory7.save!

catagory8 = Catagory.new
catagory8.requirement_id = requirement3.id
catagory8.catagory = "Electives"
catagory8.save!

catagory9 = Catagory.new
catagory9.requirement_id = requirement3.id
catagory9.catagory = "Cognates"
catagory9.save!

cc1 = CatagoryCourse.new
cc1.course_id = course3.id
cc1.catagory_id = catagory1.id
cc1.save!
cc2 = CatagoryCourse.new
cc2.course_id = course4.id
cc2.catagory_id = catagory1.id
cc2.save!
cc3 = CatagoryCourse.new
cc3.course_id = course5.id
cc3.catagory_id = catagory1.id
cc3.save!
cc4 = CatagoryCourse.new
cc4.course_id = course6.id
cc4.catagory_id = catagory1.id
cc4.save!
cc5 = CatagoryCourse.new
cc5.course_id = course7.id
cc5.catagory_id = catagory1.id
cc5.save!
cc6 = CatagoryCourse.new
cc6.course_id = course9.id
cc6.catagory_id = catagory1.id
cc6.save!
cc7 = CatagoryCourse.new
cc7.course_id = course33.id
cc7.catagory_id = catagory1.id
cc7.save!
cc8 = CatagoryCourse.new
cc8.course_id = course10.id
cc8.catagory_id = catagory1.id
cc8.save!
cc9 = CatagoryCourse.new
cc9.course_id = course11.id
cc9.catagory_id = catagory1.id
cc9.save!
cc10 = CatagoryCourse.new
cc10.course_id = course16.id
cc10.catagory_id = catagory1.id
cc10.save!
cc11 = CatagoryCourse.new
cc11.course_id = course17.id
cc11.catagory_id = catagory1.id
cc11.save!
cc12 = CatagoryCourse.new
cc12.course_id = course18.id
cc12.catagory_id = catagory1.id
cc12.save!
cc13 = CatagoryCourse.new
cc13.course_id = course20.id
cc13.catagory_id = catagory1.id
cc13.save!
cc14 = CatagoryCourse.new
cc14.course_id = course22.id
cc14.catagory_id = catagory1.id
cc14.save!
cc15 = CatagoryCourse.new
cc15.course_id = course23.id
cc15.catagory_id = catagory1.id
cc15.save!
cc16 = CatagoryCourse.new
cc16.course_id = course24.id
cc16.catagory_id = catagory1.id
cc16.save!
cc17 = CatagoryCourse.new
cc17.course_id = course27.id
cc17.catagory_id = catagory1.id
cc17.save!
cc18 = CatagoryCourse.new
cc18.course_id = course8.id
cc18.catagory_id = catagory2.id
cc18.save!
cc19 = CatagoryCourse.new
cc19.course_id = course12.id
cc19.catagory_id = catagory2.id
cc19.save!
cc20 = CatagoryCourse.new
cc20.course_id = course13.id
cc20.catagory_id = catagory2.id
cc20.save!
cc21 = CatagoryCourse.new
cc21.course_id = course14.id
cc21.catagory_id = catagory2.id
cc21.save!
cc22 = CatagoryCourse.new
cc22.course_id = course15.id
cc22.catagory_id = catagory2.id
cc22.save!
cc23 = CatagoryCourse.new
cc23.course_id = course19.id
cc23.catagory_id = catagory2.id
cc23.save!
cc24 = CatagoryCourse.new
cc24.course_id = course21.id
cc24.catagory_id = catagory2.id
cc24.save!
cc25 = CatagoryCourse.new
cc25.course_id = course29.id
cc25.catagory_id = catagory2.id
cc25.save!
cc26 = CatagoryCourse.new
cc26.course_id = course2.id
cc26.catagory_id = catagory3.id
cc26.save!
cc27 = CatagoryCourse.new
cc27.course_id = course25.id
cc27.catagory_id = catagory3.id
cc27.save!
cc28 = CatagoryCourse.new
cc28.course_id = course26.id
cc28.catagory_id = catagory3.id
cc28.save!
cc29 = CatagoryCourse.new
cc29.course_id = course31.id
cc29.catagory_id = catagory3.id
cc29.save!
cc30 = CatagoryCourse.new
cc30.course_id = course32.id
cc30.catagory_id = catagory3.id
cc30.save!

#alternate syntax
#Plan.create(user_id: user1.id, name: "Plan1")
#Plan.create(user_id: user1.id, name: "Plan2")
