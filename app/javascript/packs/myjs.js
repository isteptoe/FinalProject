var catalog = false;
var plan = false;
var currPlan = false;
var req = "";
var courseName = "";
var first = true;
var turn = "X";
var win = [448, 56, 7, 292, 146, 73, 273, 84];
var currentCourses = [];


$(window).resize(function () {
     $('#accordion').accordion("refresh");
});


window.getReqs = function(location){
    $.get(location + ".json").done(function(data){
        console.log(data);
        req = data.requirements;
        console.log(req);
        let html = "";
        for(let i in req.categories){
            html += "<h3>" + i + "</h3><div><ul>";
            for(let j in req.categories[i].courses){
                if(currentCourses.indexOf(req.categories[i].courses[j]) != -1){
                    html += "<li class=\"inPlan\" draggable=\"true\" ondragstart=\"dragFromRequirements(event)\">" + req.categories[i].courses[j] + " - " + catalog.courses[req.categories[i].courses[j]].name + "</li>";
                }else{
                    html += "<li class=\"notInPlan\" draggable=\"true\" ondragstart=\"dragFromRequirements(event)\">" + req.categories[i].courses[j] + " - " + catalog.courses[req.categories[i].courses[j]].name + "</li>";
                }
            }
            html += "</ul></div>";
        }
        $('#accordion').html(html);
        $('#accordion').accordion({
            heightStyle: "fill"
        });
        $("h3").addClass("flex-row").addClass("flex-space");
        $("#ui-id-1").append("<div id=\"coreHeader\"></div>");
        $("#ui-id-3").append("<div id=\"electiveHeader\"></div>");
        $("#ui-id-5").append("<div id=\"cognateHeader\"></div>");
        let count = 0;
        let requirementNum = 0;
        for(let i in req.categories){
            for(let j in req.categories[i].courses){
                if(currentCourses.indexOf(req.categories[i].courses[j]) == -1){
                    count++;
                }
            }
            if(requirementNum == 0){
                if(count != 0){
                    $("#coreHeader").html("<div class=\"missingClass\">" + count + "</div>");
                }else{
                    $("#coreHeader").html("");
                }
            }else if(requirementNum == 1){
                if(count != 0){
                    $("#electiveHeader").html("<div class=\"missingClass\">" + count + "</div>");
                }else{
                    $("#electiveHeader").html("");
                }
            }else if(requirementNum == 2){
                if(count != 0){
                    $("#cognateHeader").html("<div class=\"missingClass\">" + count + "</div>");
                }else{
                    $("#cognateHeader").html("");
                }
            }
            count = 0;
            requirementNum++;
        }
    });
};


window.makePlan = function(location){
    console.log(location);

    $.get(location + ".json").done(function(data){
        console.log(data);
        let combined  = data;
        plan = combined.plan;
        catalog = combined.catalog;
        currentCourses = [];
        for (let c in plan.courses){
            currentCourses.push(c);
        }
        if(first){
            first = false;
            let courses = [];
            for(let i in catalog.courses) {
                courses.push(catalog.courses[i]);
            }
            $("#table").DataTable( {
                "dom": '<"top"if>t',
                "data": courses,
                "columns": [
                    { "data": "id" },
                    { "data": "name" },
                    { "data": "description" },
                    { "data": "credits"}
                ],
                "scrollY": "95px",
                "paging": false,
                "scrollCollapse": false
            });
            $("#table tr").attr("ondragstart", "dragFromCatalog(event)").attr("draggable", "true");
            $(".top").addClass("flex-row flex-space");
            console.log("getting reqs");
            getReqs(location);
        } else{
            let count = 0;
            let requirementNum = 0;
            for(let i in req.categories){
                for(let j in req.categories[i].courses){
                    if(currentCourses.indexOf(req.categories[i].courses[j]) == -1){
                        count++;
                    }
                }
                if(requirementNum == 0){
                    if(count != 0){
                        $("#coreHeader").html("<div class=\"missingClass\">" + count + "</div>");
                    }else{
                        $("#coreHeader").html("");
                    }
                }else if(requirementNum == 1){
                    if(count != 0){
                        $("#electiveHeader").html("<div class=\"missingClass\">" + count + "</div>");
                    }else{
                        $("#electiveHeader").html("");
                    }
                }else if(requirementNum == 2){
                    if(count != 0){
                        $("#cognateHeader").html("<div class=\"missingClass\">" + count + "</div>");
                    }else{
                        $("#cognateHeader").html("");
                    }
                }
                count = 0;
                requirementNum++;
            }
        }
        currPlan.convertPlan();
        $('#planArea').html(currPlan.makeHTML());
        $('#totalCredits').html("Hours: " + currPlan.getTotalHours());
    });
};

window.updatePlan = function(){
    let count = 0;
    let requirementNum = 0;
    for(let i in req.categories){
        for(let j in req.categories[i].courses){
            if(currentCourses.indexOf(req.categories[i].courses[j]) == -1){
                count++;
            }
        }
        if(requirementNum == 0){
            if(count != 0){
                $("#coreHeader").html("<div class=\"missingClass\">" + count + "</div>");
            }else{
                $("#coreHeader").html("");
            }
        }else if(requirementNum == 1){
            if(count != 0){
                $("#electiveHeader").html("<div class=\"missingClass\">" + count + "</div>");
            }else{
                $("#electiveHeader").html("");
            }
        }else if(requirementNum == 2){
            if(count != 0){
                $("#cognateHeader").html("<div class=\"missingClass\">" + count + "</div>");
            }else{
                $("#cognateHeader").html("");
            }
        }
        count = 0;
        requirementNum++;
    }
    currPlan.convertPlan();
    $('#planArea').html(currPlan.makeHTML());
    $('#totalCredits').html("Hours: " + currPlan.getTotalHours());
};


class Plan {
    constructor(name, catalogYear, major, studentName, currYear, currTerm, realName) {
        this.name = name;
        this.catalogYear = catalogYear;
        this.major = major;
        this.student = studentName;
        this.currYear = currYear;
        this.currTerm = currTerm;
        this.realName = realName;
        this.courses = {};
        this.years = {};
    }
    addCourse(id, name, term, year, credits){
        if (term == "Fall") {
            this.courses[id] = new Course(id, name, term, year + 1, credits);
        } else{
            this.courses[id] = new Course(id, name, term, year, credits);
        }
    }
    removeCourse(id){

    }
    convertPlan(){
        for (var i = 0; i < 4; i++) {
            this.years[parseInt(this.catalogYear) + i] = new Year(parseInt(this.catalogYear) + i);
        }
        for (let c in this.courses) {
            let course = this.courses[c];
            let year = course.year;
            let term = course.term;
            if(this.years[year] == undefined){
                this.years[year] = new Year(year);
            }
            let schoolYear = this.years[year];
            schoolYear.addCourse(course);
        }
    }
    makeHTML(){
        document.getElementById('student').innerHTML = this.realName;
        document.getElementById('major').innerHTML = this.major;
        document.getElementById('planName').innerHTML = this.name;
        document.getElementById('studentUser').innerHTML = this.student;
        document.getElementById('catalogYear').innerHTML = this.catalogYear;

        let afterCurrentYear = false;
        let afterCurrentTerm = false;
        let html = "";
        Object.keys(this.years).sort();
        for(let i in this.years){
            let year = this.years[i];
            if(i == this.currYear){
                afterCurrentYear = true;
            }
            html += "<div class=\"year flex-row\">";
            for (let j in year) {
                let term = year[j];
                html += "<div class=\"semester";
                if(afterCurrentYear && !afterCurrentTerm){
                    if(this.currTerm == j){
                        html += " past";
                        afterCurrentTerm = true;
                    }
                }
                if (!afterCurrentTerm){
                    html += " past";
                }
                html += "\" ondrop=\"dropOnPlan(event)\" ondragover=\"dragOver(event)\">";
                html += "<div class=\"semester-header flex-row flex-space bold\"><div class=\"semester-title\">" + term.name + "</div><div class=\"semester-hours\">Hours: " + term.credits + "</div></div><div class=\"class-names\"><ul>";
                for (let c in term.courses){
                    let course = term.courses[c];
                    html += "<li draggable=\"true\" ondragstart=\"dragFromPlan(event)\">" + course.id + " " + course.name + "</li>";
                }
                html += "</ul></div></div>";
            }
            html += "</div>";
        }
        return html;
    }
    getTotalHours(){
        let total = 0;
        for(let i in this.years){
            let year = this.years[i];
            for (let j in year) {
                total += year[j].credits;
            }
        }
        return total;
    }
}

class Course {
    constructor(id, name, term, year, credits){
        this.id = id;
        this.name = name;
        this.term = term;
        this.year = year;
        this.credits = credits;
    }
}

class Year {
    constructor(year){
        this.Fall = new Term("Fall " + (year - 1));
        this.Spring = new Term("Spring " + year);
        this.Summer = new Term("Summer " + year);
    }
    addCourse(course){
        this[course.term].addCourse(course);
    }
}

class Term {
    constructor(name){
        this.name = name;
        this.credits = 0;
        this.courses = [];
    }
    addCourse(course){
        this.courses.push(course);
        this.credits += course.credits;
    }
}



window.dragFromPlan = function(event){
    $(".tempDrag").remove();
    // dragging from plan to somewhere
    makeDrag(event.target.innerHTML);
    courseName = event.target.innerHTML.split(" ")[0];
    $(".inPlan").each(function() {
        if(this.innerText.split(" ")[0] == event.target.innerHTML.split(" ")[0]){
            this.className = "notInPlan";
        }
    });

    //remove from current semester and plan
    $.get("/plan_courses", {user: $("#studentUser")[0].innerHTML, plan: $("#planName")[0].innerHTML, course: event.target.innerHTML.split(" ")[0]}, function() {
        //makePlan(location.href);
    });
    //updateCurrPLan


    updatePlan();
};

window.dragFromRequirements = function(event) {
    $(".tempDrag").remove();
    //dragging from left side
    makeDrag(event.target.innerHTML.replace(" - ", " "));
    courseName = event.target.innerHTML.replace(" - ", " ").split(" ")[0];
};

window.dragFromCatalog = function(event) {
    $(".tempDrag").remove();
    //drag from catalog
    makeDrag(event.target.cells[0].innerHTML + " " + event.target.cells[1].innerHTML);
    courseName = event.target.cells[0].innerHTML;
};

window.dragOver = function(event){
    //dragging over semester
    $(".semester").css("background", "");
    event.preventDefault();
    for (var i = 0; i < event.path.length; i++) {
        if(event.path[i].className == "semester" || event.path[i].className == "semester past"){
            event.path[i].style.background = "#b0b4c3";
            break;
        }
    }
};

window.dropOnPlan = function(event) {
    // if(originalDrag != null){
    //     originalDrag.remove();
    //     originalDrag = null;
    // }
    event.preventDefault();
    let semester = "";
    let year = 0;
    for (var i = 0; i < event.path.length; i++) {
        if(event.path[i].className == "semester" || event.path[i].className == "semester past"){
            event.path[i].style.background = "";
            semester = event.path[i].children[0].children[0].innerText.split(" ")[0];
            year = parseInt(event.path[i].children[0].children[0].innerText.split(" ")[1]);

            //put course in plan
            // let original = event.path[i].children[1].innerHTML;
            // let newCourse = "<li draggable=\"true\" ondragstart=\"dragFromPlan(event)\">" + courseName + " " + catalog.courses[courseName].name + "</li>";
            // event.path[i].children[1].innerHTML = original.substr(0, original.length - 5) + newCourse + "</ul>";
            break;
        }
    }
    // dropping on semester
    $(".notInPlan").each(function() {
        if(this.innerText.split(" ")[0] == courseName){
            this.className = "inPlan";
        }
    });

    $.post("/plan_courses", {user: $("#studentUser")[0].innerHTML, plan: $("#planName")[0].innerHTML, course: courseName, year: year, semester: semester}, function(){
        //makePlan(location.href);
    });
    //updateCurrPLan
    currPlan.addCourse(courseName, catalog.courses[courseName].name, semester, year, catalog.courses[courseName].credits);
    updatePlan();



};

window.dragOverOther = function(event){
    let overSemester = false;
    for (var i = 0; i < event.path.length; i++) {
        if(event.path[i].className == "semester" || event.path[i].className == "semester past"){
            overSemester = true;
            break;
        }
    }
    if (overSemester == false){
        $(".semester").css("background", "");
    }

};


window.makeDrag = function(str){
    let drag = document.createElement("div");
    drag.className = "tempDrag";
    drag.id = "tempDrag";
    drag.innerHTML = "&nbsp" + str + "&nbsp";
    drag.style.position = "absolute";
    drag.style.top = "-100px";
    drag.style.background = "#EEEBE7";
    drag.style.border = "2px solid #50423d";
    document.body.appendChild(drag);
    event.dataTransfer.setDragImage(drag, drag.clientWidth / 2, drag.clientHeight + 4);
};


window.updateTicTacToe = function(event){
    if(event.target.classList.contains("filledIn")){
        return;
    }
    let grid = [];
    event.target.innerHTML = turn;
    $("#" + event.target.id).addClass("filledIn");
    grid.push($("#ul").html() == turn);
    grid.push($("#uc").html() == turn);
    grid.push($("#ur").html() == turn);
    grid.push($("#cl").html() == turn);
    grid.push($("#cc").html() == turn);
    grid.push($("#cr").html() == turn);
    grid.push($("#ll").html() == turn);
    grid.push($("#lc").html() == turn);
    grid.push($("#lr").html() == turn);

    let state = 0;

    for (let i = 0; i < grid.length; i++) {
        if(grid[i] == true){
            state = state << 1;
            state = state + 1;
        }else{
            state = state << 1;
        }
    }

    for (let i = 0; i < win.length; i++) {
        if ((win[i] & state) == win[i]){
            boldWinners(i);
            $("#ul").addClass("filledIn");
            $("#uc").addClass("filledIn");
            $("#ur").addClass("filledIn");
            $("#cl").addClass("filledIn");
            $("#cc").addClass("filledIn");
            $("#cr").addClass("filledIn");
            $("#ll").addClass("filledIn");
            $("#lc").addClass("filledIn");
            $("#lr").addClass("filledIn");
            break;
        }
    }


    if (turn == "X"){
        turn = "O";
    } else{
        turn = "X";
    }
};

window.boldWinners = function(i){
    switch (i) {
        case 0:
            $("#ul").addClass("winningSquares");
            $("#uc").addClass("winningSquares");
            $("#ur").addClass("winningSquares");
            break;
        case 1:
            $("#cl").addClass("winningSquares");
            $("#cc").addClass("winningSquares");
            $("#cr").addClass("winningSquares");
            break;
        case 2:
            $("#ll").addClass("winningSquares");
            $("#lc").addClass("winningSquares");
            $("#lr").addClass("winningSquares");
            break;
        case 3:
            $("#ul").addClass("winningSquares");
            $("#cl").addClass("winningSquares");
            $("#ll").addClass("winningSquares");
            break;
        case 4:
            $("#uc").addClass("winningSquares");
            $("#cc").addClass("winningSquares");
            $("#lc").addClass("winningSquares");
            break;
        case 5:
            $("#ur").addClass("winningSquares");
            $("#cr").addClass("winningSquares");
            $("#lr").addClass("winningSquares");
            break;
        case 6:
            $("#ul").addClass("winningSquares");
            $("#cc").addClass("winningSquares");
            $("#lr").addClass("winningSquares");
            break;
        case 7:
            $("#ur").addClass("winningSquares");
            $("#cc").addClass("winningSquares");
            $("#ll").addClass("winningSquares");
            break;
    }
};

window.resetTicTacToe = function(){
    $("#uc").removeClass("filledIn").removeClass("winningSquares").html("");
    $("#ul").removeClass("filledIn").removeClass("winningSquares").html("");
    $("#ur").removeClass("filledIn").removeClass("winningSquares").html("");
    $("#cl").removeClass("filledIn").removeClass("winningSquares").html("");
    $("#cc").removeClass("filledIn").removeClass("winningSquares").html("");
    $("#cr").removeClass("filledIn").removeClass("winningSquares").html("");
    $("#ll").removeClass("filledIn").removeClass("winningSquares").html("");
    $("#lc").removeClass("filledIn").removeClass("winningSquares").html("");
    $("#lr").removeClass("filledIn").removeClass("winningSquares").html("");
    turn = "X";
};
