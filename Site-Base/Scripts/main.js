/// <reference path="jQuery_1.11.1.js" />

$(document).ready(function () {
    $("#wrapper").hide().fadeIn(2000);

    //clone jQuery nav ul to #menu-button
    $("nav ul").clone().appendTo("#menu-button");

    //slide function
    $('#menu-button').hover(function () {
        $(this).find('ul').stop().slideToggle(200);
    })

    //border under active page
    var currPage = document.location.pathname.match(/[^\/]+$/)[0];

    $("nav ul li a").each(function () {
        if ($(this).attr("href") === currPage) {
            $(this).addClass("activenav");
        }
    });

    //hover border
    $("nav ul li a").hover(function () {
        if ($(this).attr("href") != currPage) {
            $(this).css("border-bottom", "solid #4099FF 2px");
        }
    }, function () {
        if ($(this).attr("href") != currPage) {
            $(this).animate({ borderBottomWidth: "0px" }, 200);
        }
    });

    $("nav ul li a").click(function () {
        $("#wrapper").fadeOut(200);
    });
});

