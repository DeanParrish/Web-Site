/// <reference path="jQuery_1.11.1.js" />

$(document).ready(function () {
    $("div.imageThum").hover(function () {
        $(this).children().children("span").css("display", "block");
    }, function () {
        $(this).children().children("span").css("display", "none")
    });
});