$(document).ready(function () {
    //clone jQuery nav ul to #menu-button && remove slash
    $("nav ul").clone().appendTo("#menu-button");
    $("#menu-button ul li").remove(".slash");

    //slide function
    $('#menu-button').hover(function () {
        $(this).find('ul').stop().slideToggle(200);
    })
});