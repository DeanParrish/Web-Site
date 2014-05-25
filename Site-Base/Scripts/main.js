/// <reference path="jQuery_1.11.1.js" />

$(document).ready(function () {
    //clone jQuery nav ul to #menu-button && remove slash
    $("nav ul").clone().appendTo("#menu-button");
    $('nav ul li a[href^="/' + location.pathname.split("/")[1] + '"]').addClass('navactive');
//    $("nav ul li a").click(function () {
//        alert("hit");
//        $("nav ul li a").each(function () {
//            $(this).removeClass("navactive");
//        });

//        $(this).addClass("navactive");
//    });



    //slide function
    $('#menu-button').hover(function () {
        $(this).find('ul').stop().slideToggle(200);
    })


});