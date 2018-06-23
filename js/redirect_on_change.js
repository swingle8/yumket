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
    $('#cuisine input').on('change', function() {
        var href = window.location.href.substring(0, window.location.href.indexOf('?'));
        var qs = window.location.href.substring(window.location.href.indexOf('?') + 1, window.location.href.length);
        var newParam = ("cuisine") + '=' + $('input[name=cuisinetype]:checked', '#cuisine').val();
        if (qs.indexOf("cuisine" + '=') == -1) {
              if (qs == '') {
              qs = '?'
             }
             else {
                 qs = qs + '&'
             }
             qs = qs + newParam;
                    }
         else {
             var start = qs.indexOf("cuisine" + "=");
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
    $('#foodtype input').on('change', function() {
        var href = window.location.href.substring(0, window.location.href.indexOf('?'));
        var qs = window.location.href.substring(window.location.href.indexOf('?') + 1, window.location.href.length);
        var newParam = ("foodtype") + '=' + $('input[name=food]:checked', '#foodtype').val();
        if (qs.indexOf("foodtype" + '=') == -1) {
              if (qs == '') {
              qs = '?'
             }
             else {
                 qs = qs + '&'
             }
             qs = qs + newParam;
                    }
         else {
             var start = qs.indexOf("foodtype" + "=");
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
    $('#sort input').on('change', function() {
        var href = window.location.href.substring(0, window.location.href.indexOf('?'));
        var qs = window.location.href.substring(window.location.href.indexOf('?') + 1, window.location.href.length);
        var newParam = ("sort") + '=' + $('input[name=sorttype]:checked', '#sort').val();
        if (qs.indexOf("sort" + '=') == -1) {
              if (qs == '') {
              qs = '?'
             }
             else {
                 qs = qs + '&'
             }
             qs = qs + newParam;
                    }
         else {
             var start = qs.indexOf("sort" + "=");
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


// star rating script
   $(function () {
                $('.example-f').barrating('show', {
            showSelectedRating:false,        
            readonly:true
                });
            });

// data tables script
$(document).ready(function() {
				$('#example').dataTable( {
                                   "aaSorting": [[ 7, "desc" ]],
                                   "sPaginationType": "full_numbers"
                               });
                         
        		} );


 $(document).ready(function () {
        // 1. prepare the validation rules and messages.
        var rules = {
            tyo_num: {
                required: true,
		number:true,
                minlength: 2,
		maxlength:3
            },			
        };
        var messages = {
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
