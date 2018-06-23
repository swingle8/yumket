 $(document).ready(function () {
    //Redirect on Change
    $('#service input').on('change', function() {
        var href = window.location.href.substring(0, window.location.href.indexOf('?'));
        var qs = window.location.href.substring(window.location.href.indexOf('?') + 1, window.location.href.length);
        var newParam = ("service") + '=' + $('input[name=servicetype]:checked', '#service').val();
        if (qs.indexOf("service" + '=') == -1) {
              if (qs == '') {
              qs = '?'
             }
             else {
                 qs = qs + '&'
             }
             qs = qs + newParam;
                    }
         else {
             var start = qs.indexOf("service" + "=");
             var end = qs.indexOf("&", start);
             if (end == -1) {
             end = qs.length;
             }
             var curParam = qs.substring(start, end);
             qs = qs.replace(curParam, newParam);
         }
       window.location.assign(href + '?' + qs); 
    });
});


 
 $(document).ready(function () {
    //Redirect on Change
    $('#offers input').on('change', function() {
        var href = window.location.href.substring(0, window.location.href.indexOf('?'));
        var qs = window.location.href.substring(window.location.href.indexOf('?') + 1, window.location.href.length);
        var newParam = ("offers") + '=' + $('input[name=offername]:checked', '#offers').val();
        if (qs.indexOf("offers" + '=') == -1) {
              if (qs == '') {
              qs = '?'
             }
             else {
                 qs = qs + '&'
             }
             qs = qs + newParam;
                    }
         else {
             var start = qs.indexOf("offers" + "=");
             var end = qs.indexOf("&", start);
             if (end == -1) {
             end = qs.length;
             }
             var curParam = qs.substring(start, end);
             qs = qs.replace(curParam, newParam);
         }
       window.location.assign(href + '?' + qs); 
    });
});

 
 
 jQuery(document).ready(function($) {
    offset = $('.sticker').offset();
    var fromtop = offset.top;
    fromtop = fromtop - 70;
        //var bottom = $('.sticker').parent().offset().top + $('.sticker').parent().height();

    $(document).scroll(function() {
        doc = $(this);
        dist = $(this).scrollTop();

        if (dist >= fromtop) {
            $('.sticker:first').css({
                'position': 'fixed'

            });
        } else {
            $('.sticker').css({
                'position': 'static'
            });
        }
    });

});
 
  jQuery(document).ready(function($) {
    offset = $('.sticker1').offset();
    var fromtop = offset.top;
     fromtop = fromtop - 70;
   //var bottom = $('.sticker').parent().offset().top + $('.sticker').parent().height();

    $(document).scroll(function() {
        doc = $(this);
        dist = $(this).scrollTop();

        if (dist >= fromtop) {
            $('.sticker1:first').css({
                'position': 'fixed',
            //    'margin-left': '191px'
            });
        } else {
            $('.sticker1').css({
                'position': 'static',
             //   'margin-left': '10px'
            });
        }
    });
});   

    jQuery(document).ready(function($) {
    offset = $('.sticker2').offset();
    var fromtop = offset.top;
     fromtop = fromtop - 70;
   //var bottom = $('.sticker').parent().offset().top + $('.sticker').parent().height();

    $(document).scroll(function() {
        doc = $(this);
        dist = $(this).scrollTop();

        if (dist >= fromtop) {
            $('.sticker2:first').css({
                'margin-left': '210px'
            });
        } else {
            $('.sticker2').css({
                'margin-left': '0px'
            });
        }
    });

});

$(function() {
$('a[href^="#"]').on('click', function(event) {

    var target = $( $(this).attr('href') );

    if( target.length ) {
        event.preventDefault();
        $('html, body').animate({
            scrollTop: target.offset().top-70
        }, 500);
    }

});
});

    $(function() {
    $('#fadeout-div').show().delay(600).fadeOut(1600);
    });
   
   $(window).load(function ()
{
    var $contents = $('#cartframe').contents();
    $contents.scrollTop($contents.height());
    
        var objDiv = document.getElementById("cartframe");
        objDiv.scrollTop = objDiv.scrollHeight;
});


 
 
  

   $(document).ready(function () {
        // 1. prepare the validation rules and messages.
        var rules = {
            quantity: {
                required: true,
		number:true,
                minlength: 1,
		maxlength:2
            },			
               tyo_num: {
                required: true,
		number:true,
                minlength: 2,
		maxlength:3
            },               
				
        };
        var messages = {
           quantity:"please enter valid quantity number having 1 or 2 digits.",
            tyo_num:"please enter valid numeric Order number."
            	 };
 
        // 2. Initiate the validator
        var validator
            = new jQueryValidatorWrapper("FormToValidate",
                rules, messages);
 
        // 3. Set the click event to do the validation
        $("#btnValidate").click(function () {
            if (!validator.validate())
                return;
    });
      
   
     
   });
       
