/// <reference path = "Scripts/jquery_1.10.2.js" />
$(document).ready(function () {

    //TEXTBOX
    $("#ContentPlaceHolder1_txtSearch").keydown(function (e) {
        if ($("#ContentPlaceHolder1_ddlSearch").val() == "Phone") {
            var inp = $("#ContentPlaceHolder1_txtSearch").val();
            //NUMERIC
            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105) && (e.keyCode != 8) && (e.keyCode != 9)) {
                e.preventDefault();
                $(this).next().text("This field must be numeric");
            }
            else {
                $(this).next().text("");
            }

            //DASHES

            if (inp.length == 3 || inp.length == 7) {
                if (e.keyCode != 8) {
                    $("#ContentPlaceHolder1_txtSearch").val(inp + '-');
                }
            }

            //cap on 12 char
            if ((inp.length == 12) && (e.keyCode != 8) && (e.keyCode != 9)) {
                e.preventDefault();

            }
        }
    });

    $("#ContentPlaceHolder1_ddlSearch").change(function (e) {
        $("#ContentPlaceHolder1_txtSearch").val("");

    });

    //DETAILSVIEW
    //phone1
    $("#ContentPlaceHolder1_DetailsView1_txtPhone1").keydown(function (e) {
        var inp = $("#ContentPlaceHolder1_DetailsView1_txtPhone1").val();
        //NUMERIC
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105) && (e.keyCode != 8) && (e.keyCode != 9)) {
            e.preventDefault();
            $(this).next().text("This field must be numeric");
        }
        else {
            $(this).next().text("");
        }
        //DASHES
        if (inp.length == 3 || inp.length == 7) {
            if (e.keyCode != 8) {
                $("#ContentPlaceHolder1_DetailsView1_txtPhone1").val(inp + '-');
            }
        }

        //cap on 12 char
        if ((inp.length == 12) && (e.keyCode != 8) && (e.keyCode != 9)) {
            e.preventDefault();
        }
    });

    //phone2
    $("#ContentPlaceHolder1_DetailsView1_txtPhone2").keydown(function (e) {
        var inp = $("#ContentPlaceHolder1_DetailsView1_txtPhone2").val();
        //NUMERIC
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105) && (e.keyCode != 8) && (e.keyCode != 9)) {
            e.preventDefault();
            $(this).next().text("This field must be numeric");
        }
        else {
            $(this).next().text("");
        }
        //DASHES
        if (inp.length == 3 || inp.length == 7) {
            if (e.keyCode != 8) {
                $("#ContentPlaceHolder1_DetailsView1_txtPhone2").val(inp + '-');
            }
        }
        //cap on 12 char
        if ((inp.length == 12) && (e.keyCode != 8) && (e.keyCode != 9)) {
            e.preventDefault();
        }
    });

    //phone 3
    $("#ContentPlaceHolder1_DetailsView1_txtPhone3").keydown(function (e) {
        var inp = $("#ContentPlaceHolder1_DetailsView1_txtPhone3").val();
        //NUMERIC
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105) && (e.keyCode != 8) && (e.keyCode != 9)) {
            e.preventDefault();
            $(this).next().text("This field must be numeric");
        }
        else {
            $(this).next().text("");
        }
        //DASHES
        if (inp.length == 3 || inp.length == 7) {
            if (e.keyCode != 8) {
                $("#ContentPlaceHolder1_DetailsView1_txtPhone3").val(inp + '-');
            }
        }
        //cap on 12 char
        if ((inp.length == 12) && (e.keyCode != 8) && (e.keyCode != 9)) {
            e.preventDefault();
        }
    });

    //zip
    $("#ContentPlaceHolder1_DetailsView1_txtZip").keydown(function (e) {
        //NUMERIC
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105) && (e.keyCode != 8) && (e.keyCode != 9)) {
            e.preventDefault();
            $(this).next().text("This field must be numeric");
        }
        else {
            $(this).next().text("");
        }
        //cap on 12 char
        if (($(this).val().length == 5) && (e.keyCode != 8) && (e.keyCode != 9)) {
            e.preventDefault();
        }
    });



    //GRIDVIEW
    //    $("#ContentPlaceHolder1_GridView1 tr").slice(1).click(function (e) {
    //        //e.preventDefault();
    //        window.location.href = window.location + "#anchorDetailsView";
    //    });
    $("#ContentPlaceHolder1_GridView1 tr").slice(1).hover(function (e) {
        $(this).toggleClass("highlight");
    });

})