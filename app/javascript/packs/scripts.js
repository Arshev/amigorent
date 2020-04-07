function FixTable(table) {
    var inst = this;
    this.table  = table;
 
    $('tr > th',$(this.table)).each(function(index) {
        var div_fixed = $('<div/>').addClass('fixtable-fixed');
        var div_relat = $('<div/>').addClass('fixtable-relative');
        div_fixed.html($(this).html());
        div_relat.html($(this).html());
        $(this).html('').append(div_fixed).append(div_relat);
        $(div_fixed).hide();
    });
 
    this.StyleColumns();
    this.FixColumns();
 
    $(window).scroll(function(){
        inst.FixColumns()
    }).resize(function(){
        inst.StyleColumns()
    });
}
 
FixTable.prototype.StyleColumns = function() {
    var inst = this;
    $('tr > th', $(this.table)).each(function(){
        var div_relat = $('div.fixtable-relative', $(this));
        var th = $(div_relat).parent('th');
        $('div.fixtable-fixed', $(this)).css({
            'width': $(th).outerWidth(true) - parseInt($(th).css('border-left-width')) + 'px',
            'height': $(th).outerHeight(true) + 'px',
            'left': $(div_relat).offset().left - parseInt($(th).css('padding-left')) + 'px',
            'padding-top': $(div_relat).offset().top - $(inst.table).offset().top + 'px',
            'padding-left': $(th).css('padding-left'),
            'padding-right': $(th).css('padding-right')
        });
    });
}
 
FixTable.prototype.FixColumns = function() {
    var inst = this;
    var show = false;
    var s_top = $(window).scrollTop();
    var h_top = $(inst.table).offset().top;
 
    if (s_top < (h_top + $(inst.table).height() - $(inst.table).find('.fixtable-fixed').outerHeight()) && s_top > h_top) {
        show = true;
    }
 
    $('tr > th > div.fixtable-fixed', $(this.table)).each(function(){
        show ? $(this).show() : $(this).hide()
    });
}
 
$(document).ready(function(){
    $('.fixtable').each(function() {
        new FixTable(this);
    });
});





$( document ).ready(function() {
    $(".block6 .col1 .pere .za").click(function(){
        if($(this).parent().hasClass("opened")) {
            $(this).parent().removeClass("opened");
            $(this).parent().find(".skrito").slideToggle();
        } else {
            $(this).parent().addClass("opened");
            $(this).parent().find(".skrito").slideToggle();
        }
        return false;
    });

    var $topp = $(".header .menu_top").offset().top;

    function fixed() {
        if($(document).scrollTop()>$topp) {
            $(".polosa:not(.ne_lipko)").addClass("fixed");
        } else {
            $(".polosa:not(.ne_lipko)").removeClass("fixed");
        }
    }
    fixed();
    $(document).scroll(function(){
        fixed();
    });

    $(".content .bl_avto .bl_perekl a").click(function(){
        $(this).parent().find("a").removeClass("active");
        $(this).addClass("active");
        $(".content .bl_avto .perek").removeClass("active");
        $(".content .bl_avto .perek#"+$(this).attr("data-per")).addClass("active");
        return false;
    });

    $(".content .bl_avto .bl_ostav form .rating p").click(function(){
        $(this).parent().find("p").removeClass("active");
        if($(this).hasClass("num1")) {
            $(".content .bl_avto .bl_ostav form .rating p.num1").addClass("active");
        }
        if($(this).hasClass("num2")) {
            $(".content .bl_avto .bl_ostav form .rating p.num1").addClass("active");
            $(".content .bl_avto .bl_ostav form .rating p.num2").addClass("active");
        }
        if($(this).hasClass("num3")) {
            $(".content .bl_avto .bl_ostav form .rating p.num1").addClass("active");
            $(".content .bl_avto .bl_ostav form .rating p.num2").addClass("active");
            $(".content .bl_avto .bl_ostav form .rating p.num3").addClass("active");
        }
        if($(this).hasClass("num4")) {
            $(".content .bl_avto .bl_ostav form .rating p.num1").addClass("active");
            $(".content .bl_avto .bl_ostav form .rating p.num2").addClass("active");
            $(".content .bl_avto .bl_ostav form .rating p.num3").addClass("active");
            $(".content .bl_avto .bl_ostav form .rating p.num4").addClass("active");
        }
        if($(this).hasClass("num5")) {
            $(".content .bl_avto .bl_ostav form .rating p.num1").addClass("active");
            $(".content .bl_avto .bl_ostav form .rating p.num2").addClass("active");
            $(".content .bl_avto .bl_ostav form .rating p.num3").addClass("active");
            $(".content .bl_avto .bl_ostav form .rating p.num4").addClass("active");
            $(".content .bl_avto .bl_ostav form .rating p.num5").addClass("active");
        }
    });

    $(".content .bl_avto .bl_ostav form .rating p").mouseover(function(){
        $(this).parent().find("p").removeClass("active2");
        if($(this).hasClass("num1")) {
            $(".content .bl_avto .bl_ostav form .rating p.num1").addClass("active2");
        }
        if($(this).hasClass("num2")) {
            $(".content .bl_avto .bl_ostav form .rating p.num1").addClass("active2");
            $(".content .bl_avto .bl_ostav form .rating p.num2").addClass("active2");
        }
        if($(this).hasClass("num3")) {
            $(".content .bl_avto .bl_ostav form .rating p.num1").addClass("active2");
            $(".content .bl_avto .bl_ostav form .rating p.num2").addClass("active2");
            $(".content .bl_avto .bl_ostav form .rating p.num3").addClass("active2");
        }
        if($(this).hasClass("num4")) {
            $(".content .bl_avto .bl_ostav form .rating p.num1").addClass("active2");
            $(".content .bl_avto .bl_ostav form .rating p.num2").addClass("active2");
            $(".content .bl_avto .bl_ostav form .rating p.num3").addClass("active2");
            $(".content .bl_avto .bl_ostav form .rating p.num4").addClass("active2");
        }
        if($(this).hasClass("num5")) {
            $(".content .bl_avto .bl_ostav form .rating p.num1").addClass("active2");
            $(".content .bl_avto .bl_ostav form .rating p.num2").addClass("active2");
            $(".content .bl_avto .bl_ostav form .rating p.num3").addClass("active2");
            $(".content .bl_avto .bl_ostav form .rating p.num4").addClass("active2");
            $(".content .bl_avto .bl_ostav form .rating p.num5").addClass("active2");
        }
    });

    $(".content .bl_avto .bl_ostav form .rating").mouseout(function(){
        $(this).find("p").removeClass("active2");
    });

    $(".content .bl_contact .slider .bxslider").bxSlider();
    setInterval(function(){
        $(".content .bl_contact .slider .bx-next").click();
    }, 5000);

    $("#menu_tg1").click(function(){
        $(".header .menu_top").slideUp();
        $("#menu_tg2").removeClass("opened");
        $(".header .addr, .header .phone, .header .vrem").slideToggle();
        return false;
    });
    $("#menu_tg2").click(function(){
        $(".header .addr, .header .phone, .header .vrem").slideUp();
        $(".header .menu_top").slideToggle();
        $("#menu_tg2").toggleClass("opened");
        return false;
    });

    $(".header .menu_top li a span").click(function(){
        $(this).parent().parent().toggleClass("opened");
        return false;
    });
});