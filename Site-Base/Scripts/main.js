/// <reference path="jQuery_1.11.1.js" />

$(document).ready(function () {
    //clone jQuery nav ul to #menu-button && remove slash
    $("nav ul").clone().appendTo("#menu-button");
    $("nav ul li a").each(function () {
        if ($(this).attr("href") === location.pathname) {
            $(this).addClass("activenav");
        }
    });
    
    $("nav ul li a").click(function () {
    });



    //slide function
    $('#menu-button').hover(function () {
        $(this).find('ul').stop().slideToggle(200);
    })


});