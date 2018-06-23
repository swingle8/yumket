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
       

        
