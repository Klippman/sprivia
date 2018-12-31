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

// Game functionality

let questionQueue = [];
let triviaQuestions = [];
let answerSelectionsElement;
let questionsElement;
let currentQuestionIndex = 0;
let currentQuestion;



window.onload = () => {
    answerSelectionsElement = document.getElementsByClassName('answerSelections');
    questionsElement = document.getElementsByClassName('questions');
}
// calling trivia API for questions
$(document).ready( () => {
    const Url = 'https://opentdb.com/api.php?amount=49&category=21'
    $.ajax({
        url: Url,
        type: "GET",
        success: function (response) {
            triviaQuestions = response.results;
            showNextQuestion();
        }
    })

    // start game

    nextQuestion = () => {
        $("#flex_container2").empty();
        showNextQuestion();
    }

    // Skip to next question
    document.getElementById('start_game').onclick = nextQuestion;

    showNextQuestion = () => {
        // Displaying questions to the screen
        $("#flex_container").html("<h2 class='questions'>" +
            triviaQuestions[currentQuestionIndex].question + "</h2>")

        let answers = triviaQuestions[currentQuestionIndex].incorrect_answers
        let randomIdx = Math.floor(Math.random() * answers.length - 1)

        answers.splice(randomIdx, 0, triviaQuestions[currentQuestionIndex].correct_answer)
        // Displaying answer selections
        for (let i = 0; i < answers.length; i++){
            $("#flex_container2").append("<h2> <input type='radio' class='answerSelections' value=\""+answers[i]+"\">" + " " + answers[i] + "</h2>")
        };
        // Checking for correct/incorrect answer
        for (let x = 0; x < answerSelectionsElement.length; x++) {
            answerSelectionsElement[x].addEventListener('click', () => {
                if(answerSelectionsElement[x].value === triviaQuestions[currentQuestionIndex-1].correct_answer){
                    alert("Correct!");
                } else {
                    alert("WRONG! The answer is: " + triviaQuestions[currentQuestionIndex-1].correct_answer );
                }
                nextQuestion();
            })
        }
        currentQuestionIndex++;
    }

    // Tracking correct vs incorrect answers
    keepScore = () => {

        for (let y = 0; y < answerSelectionsElement.length; y++) {
            answerSelectionsElement[y].addEventListener('click', (correct = 0, incorrect = 0) => {
                if(answerSelectionsElement[y].value === triviaQuestions[currentQuestionIndex-1].correct_answer){
                    console.log(correct);
                    correct++;
                } else {
                    console.log(incorrect);
                    incorrect++;
                }
            })
        }
    }

    keepScore();
})







