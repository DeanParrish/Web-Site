/// <reference path="jQuery_1.11.1.js" />

$(document).ready(function () {
    $("a.showCode").click(function (e) {
        $(this).next().slideToggle(200);
    });
});