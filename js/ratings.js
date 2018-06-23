        $(function () {
                $('#example-f').barrating('show', {
            showSelectedRating:false,        
            readonly:true
                });
                $('#example-a').barrating();
               $('#example-b').barrating();
               $('#example-c').barrating();
               
});
  
  

        
 $.validator.addMethod('regexpname', function(value, element, param) {
        return this.optional(element) || value.match(param);
    },
		"The First Name and Last Name should must contain only Alphabets."
 );
 
 
  $.validator.addMethod('regexpSpecial', function(value, element, param) {
        return this.optional(element) || value.match(param);
    },
		"Exculde Special Character."
 );
   
   

   $(document).ready(function () {
        // 1. prepare the validation rules and messages.
        var rules = {
            ratings_mobile: {
                required: true,
		number:true,
                minlength: 10,
		maxlength:10
            },			
            fname: 
			{  required: true,
				regexpname: /^[A-Za-z ]*$/							
			} ,
	    lname: 
			{  required: true,
				regexpname: /^[A-Za-z ]*$/							
			} ,
	
       
            ratings_id: {
				 required: true ,
				  email: true               
			} ,
                            
				
        };
        var messages = {
            ratings_mobile:"please enter valid mobile number having 10 digits.",
            
            ratings_id: "Please enter your valid email address.",
		testSpecial:
			{
			 required: "Special Test Field is required"
               
			} ,
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
       
  