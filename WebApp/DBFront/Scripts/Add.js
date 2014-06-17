/// <reference path="jquery_1.10.2.js" />

$(document).ready(function () {

    if ($("#ContentPlaceHolder1_lblCorrect").text().length != 0) {
            alert("a");
            setTimeout(function (e) {
                $("#ContentPlaceHolder1_lblCorrect").text("");
            }, 10000);
    }
    //   
    //NUMERIC
    //phones
    $("#ContentPlaceHolder1_txtPhone1").keydown(function (e) {
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105) && (e.keyCode != 8) && (e.keyCode != 9)) {
            e.preventDefault();
            $(this).next().text("This field must be numeric");

        }
        else {
            $(this).next().text("");
        }


        //cap on 12 char
        if (($(this).val().length == 12) && (e.keyCode != 8) && (e.keyCode != 9)) {
            e.preventDefault();
        }
    });

    $("#ContentPlaceHolder1_txtPhone2").keydown(function (e) {

        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105) && (e.keyCode != 8) && (e.keyCode != 9)) {
            e.preventDefault();

            $(this).next().text("This field must be numeric");
        }
        else {
            $(this).next().text("");
        }

        //cap on 12 char
        if (($(this).val().length == 12) && (e.keyCode != 8) && (e.keyCode != 9)) {
            e.preventDefault();

        }
    });

    $("#ContentPlaceHolder1_txtPhone3").keydown(function (e) {
        //NUMERIC
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105) && (e.keyCode != 8) && (e.keyCode != 9)) {
            e.preventDefault();

            $(this).next().text("This field must be numeric");
        }
        else {
            $(this).next().text("");
        }

        //cap on 12 char
        if (($(this).val().length == 12) && (e.keyCode != 8) && (e.keyCode != 9)) {
            e.preventDefault();

        }
    });

    //zip
    $("#ContentPlaceHolder1_txtZip").keydown(function (e) {

        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105) && (e.keyCode != 8) && (e.keyCode != 9)) {
            e.preventDefault();

            $(this).next().text("This field must be numeric");
        }
        else {
            $(this).next().text("");
        }

        //cap on 5 char
        if (($(this).val().length == 5) && (e.keyCode != 8) && (e.keyCode != 9)) {
            e.preventDefault();

        }
    });



    //DASHES
    //phone1
    $("#ContentPlaceHolder1_txtPhone1").keyup(function (e) {
        var inp = $("#ContentPlaceHolder1_txtPhone1").val();
        if (inp.length == 3 || inp.length == 7) {
            if (e.keyCode != 8) {
                $(this).val(inp + '-');
            }
        }
    });
    //phone2
    $("#ContentPlaceHolder1_txtPhone2").keyup(function (e) {
        var inp = $("#ContentPlaceHolder1_txtPhone2").val();
        if (inp.length == 3 || inp.length == 7) {
            if (e.keyCode != 8) {
                $("#ContentPlaceHolder1_txtPhone2").val(inp + '-');
            }
        }
    });
    //phone3
    $("#ContentPlaceHolder1_txtPhone3").keyup(function (e) {
        var inp = $("#ContentPlaceHolder1_txtPhone3").val();
        if (inp.length == 3 || inp.length == 7) {
            if (e.keyCode != 8) {
                $("#ContentPlaceHolder1_txtPhone3").val(inp + '-');
            }
        }
    });

    /* $("#imgMPAdd").hover( function() {
    $("#imfMPAdd").attr("src", "./Images/AddHover.jpg");
    }, function(){
    $("#imgMPAdd").attr("src", "./Images/Add.jpg") ;
    });*/

    /*$("#imgMPSearch").mouseover(function () {
    $("#imgMPSearch").attr("src", "~../Images/SearchHover.jpg"); /// <reference path="../Images/SearchHover.jpg" />


    }).mouseout(function () {
    $("#imgMPSearch").attr("src", "Search.jpg");
    });*/

    $("#page img").hover(function () {
        var source = $(this).attr("src").replace("_Reg", "_Hover");
        $(this).attr("src", source);
        //this.src = this.src.replace("_Reg", "_Hover");
    }, function () {
        this.src = this.src.replace("_Hover", "_Reg");
    });
})
