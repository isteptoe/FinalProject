
var request;
var courseRequest;
var reqRequest;
var catalog = false;
var plan = false;
var currPlan = false;
var req = "";
var courseName = "";
var first = true;
var turn = "X";
var win = [448, 56, 7, 292, 146, 73, 273, 84];
var planRequest;
var planRefresh;

$(window).resize(function () {
     $('#accordion').accordion("refresh");
});


window.getReqs = function(){
    console.log("in getting reqs")
    $.get("/plans/1.json").done(function(data){
        console.log(data)
        req = data.requirements;
        console.log(req);
        let html = "";
        for(let i in req.categories){
            html += "<h3>" + i + "</h3><div><ul>";
            for(let j in req.categories[i].courses){
                html += "<li draggable=\"true\" ondragstart=\"dragFromRequirements(event)\">" + req.categories[i].courses[j] + " - " + catalog.courses[req.categories[i].courses[j]].name + "</li>";
            }
            html += "</ul></div>";
        }
        $('#accordion').html(html);
        $('#accordion').accordion({
            heightStyle: "fill"
        });
    });
};


window.makePlan = function(){
    // planRefresh = createRequest();
    // if(planRefresh) {
    //     planRefresh.open("GET", "/~steptoe/TermProject/php/functions.php?refresh=true", true);
    //     planRefresh.onreadystatechange = refreshButton;
    //     planRefresh.send(null);
    // }

    console.log("hi");
    $.get("/plans/1.json").done(function(data){
        console.log(data);
        let combined  = data;
        plan = combined.plan;
        catalog = combined.catalog;
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
            $(".top").addClass("flex-row flex-space")
            console.log("getting reqs");
            getReqs();
        }
        currPlan = new Plan(plan.name, catalog.year, plan.major, plan.student, plan.currYear, plan.currTerm, plan.realName);

        for (let c in plan.courses){
            currPlan.addCourse(plan.courses[c].id, catalog.courses[c].name, plan.courses[c].term, plan.courses[c].year, catalog.courses[c].credits);
        }
        currPlan.convertPlan();
        $('#planArea').html(currPlan.makeHTML());
        $('#totalCredits').html("Hours: " + currPlan.getTotalHours());
    });
}

window.refreshButton = function() {
    if(planRefresh.readyState == 4){
        $("#planChooser").html(planRefresh.responseText);
        planRefresh = null;
    }
}


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

window.createRequest  = function(){
    let request = null;
    if(window.XMLHttpRequest && !(window.ActiveXObject)) {
        try {
            request = new XMLHttpRequest();
        }
        catch(e) {
            request = false;
        }
    }
    else if (window.ActiveXObject) {
        try {
            request = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch(e) {
            try {
                request = new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch(e) {request = false; }
        }
    }
    return request;
};

window.dragFromPlan = function(event){
    $(".tempDrag").remove();
    // dragging from plan to somewhere
    makeDrag(event.target.innerHTML);
    courseName = event.target.innerHTML.split(" ")[0];

    //remove from current semester and plan
    if(courseRequest == null){
        courseRequest = createRequest();
        if(courseRequest){
            let get = "/~steptoe/TermProject/php/functions.php?modify=delete&user=" + $("#studentUser")[0].innerHTML + "&plan=" + $("#planName")[0].innerHTML + "&course=" + event.target.innerHTML.split(" ")[0];
            courseRequest.open("GET", get, true);
            courseRequest.onreadystatechange = updatedCourse;
            courseRequest.send(null);
        }
    }
}

window.dragFromRequirements = function(event) {
    $(".tempDrag").remove();
    //dragging from left side
    makeDrag(event.target.innerHTML.replace(" - ", " "));
    courseName = event.target.innerHTML.replace(" - ", " ").split(" ")[0];
}

window.dragFromCatalog = function(event) {
    $(".tempDrag").remove();
    //drag from catalog
    makeDrag(event.target.cells[0].innerHTML + " " + event.target.cells[1].innerHTML);
    courseName = event.target.cells[0].innerHTML;


}

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
}

window.dropOnPlan = function(event) {
    event.preventDefault();
    let semester = "";
    let year = 0;
    for (var i = 0; i < event.path.length; i++) {
        if(event.path[i].className == "semester" || event.path[i].className == "semester past"){
            event.path[i].style.background = "";
            semester = event.path[i].children[0].children[0].innerText.split(" ")[0];
            year = parseInt(event.path[i].children[0].children[0].innerText.split(" ")[1]);
            break;
        }
    }
    // dropping on semester
    if(courseRequest == null){
        courseRequest = createRequest();
        if(courseRequest){
            let get = "/~steptoe/TermProject/php/functions.php?modify=add&user=" + $("#studentUser")[0].innerHTML + "&plan=" + $("#planName")[0].innerHTML + "&course=" + courseName + "&year=" + year + "&semester=" + semester;
            console.log(get);
            courseRequest.open("GET", get, true);
            courseRequest.onreadystatechange = updatedCourse;
            courseRequest.send(null);
        }
    }

}

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

}

window.updatedCourse = function() {
    if(courseRequest.readyState == 4){
        makePlan();
        courseRequest = null;
    }
}


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
}

window.dropPlans = function() {
  document.getElementById("dropPlans").classList.toggle("show");
}

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
}

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
}

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
}

window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
};

window.changePlan = function(event){
  let newPlan = event.target.innerHTML;
  planRequest = createRequest();
  if(planRequest){
      let get = "/~steptoe/TermProject/php/functions.php?newPlan=" + newPlan;
      planRequest.open("GET", get, true);
      planRequest.onreadystatechange = gotTemp;
      planRequest.send(null);
  }
}


window.gotTemp = function() {
    if(planRequest.readyState == 4){
        makePlan();

        planRequest = null;
    }
}
