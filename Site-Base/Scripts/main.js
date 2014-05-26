/// <reference path="jQuery_1.11.1.js" />

$(document).ready(function () {
    //clone jQuery nav ul to #menu-button
    $("nav ul").clone().appendTo("#menu-button");

    //border under active page
    $("nav ul li a").each(function () {
        if ($(this).attr("href") === location.pathname) {
            $(this).addClass("activenav");
        }
    });

    //slide function
    $('#menu-button').hover(function () {
        $(this).find('ul').stop().slideToggle(200);
    })


});