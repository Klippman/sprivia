// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
//= require jquery_ujs

let correctAn;
let incorrectAn;
let correct = 0; // keeping track of score
let incorrect = 0; // keeping track of score
let questionQueue = [];
let answerSelectionsElement;
let questionsElement;
let shuffle = puzzles[Math.floor(Math.random() * puzzles.length)];

// let attributes = {
//     "type": {
//         "boolean": true,
//         "multiple": true
//     },
//     "difficulty": {
//         "easy": false,
//         "medium": true,
//         "hard": false,
//     },
//     "categories": {}
// };

window.onload =  function(){
    answerSelectionsElement = document.getElementById('answerSelections');
    questionElement = document.getElementById('questions');
}
// calling trivia API for questions
$(document).ready(function(){
    const Url ='https://opentdb.com/api.php?amount=49&category=21'
    $.ajax({
        url: Url,
        type: "GET",
        success: function(response){
            "<div id='flex_container'>"
            var trivia = response.results;
            console.log(trivia);
        }
    })
})

// start game
document.getElementById('startGame').onclick = startGame;



function startGame() {
    answerSelectionsElement.innerHTML = "";
    questionsElement.innerHTML = "Retrieving...";
    if (questionQueue.length == 0) {
        retrieveQuestions();
    } else {
        showQuestion();
    }
}

