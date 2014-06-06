$(document).ready(function () {
    $("a.showCode").click(function (e) {
        alert("hit");
        var pageWidth = $("#page").css("min-width");
        alert(pageWidth);
        
        $(this).next().slideToggle(500);
        if (pageWidth != "675px") {
            $("#page").css("min-width", "675px");
        }
        else {
            $("#page").css("min-width", "");
        }

    });
});