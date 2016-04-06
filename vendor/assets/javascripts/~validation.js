
//Client side validation  

//Validation for create a new customer
jQuery(document).ready(function() {
	//validation for tasks form
  jQuery("#customer").validate({
	errorElement:'div',
	rules: {
	  "customer[name]":{
	 				  required: true
				}	,
	    "customer[ein]" :{
	                    number :true,
						minlength:4
	    }
	
		},
	messages: {
	"customer[name]":{
					  required: "Name cannot be blank!"
					 
				}	,
	    "customer[ein]" :{
	                    
						minlength:"do not enter less than 4 digit"
	    }
		}
	});


  //Validation for creating new bank account
  jQuery("#bank_account").validate({
    errorElement:'div',
    rules: {
      "bank_account[name]":{
                      required: true,
					  minlength:2
                },
     "bank_account[account_number]":{
                      required: true,
					  digits: true,
					  minlength:9
                },
    "bank_account[routing_number]" :{
                    required: true,
					  digits: true,
					  minlength:9
    },
    "bank_account[account_type]" :{
                    required: true
    },
    "bank_account[kid_id]" :{
                    required: true
    }
        },
    messages: {
    "bank_account[name]":{
                      required: "Name cannot be blank!",
					  minlength:"do not enter less than 2 characters"
                     
                },
    "bank_account[account_number]":{
                      required: "account_number cannot be blank!",
					  digits: "Please enter only digit",
					  minlength:"do not enter less than 9 digit"
                },  
    "bank_account[routing_number]" :{
                    required: "Routing number cannot be blank",
					digits: "Please enter only digit",
					minlength:"do not enter less than 9 digit"
    },
    "bank_account[account_type]" :{
                    required: "Account type cannot be blank"
    },
    "bank_account[kid_id]" :{
                    required: "Please select kid id"
    }      
   
    }
   });
   //Validation for creating new user
    jQuery("#new_user").validate({
    errorElement:'span',
    rules: {
      "user[email]":{
                      required: true,
                      email: true
                },
     "user[password]":{
                      required: true
                },
       "user[password_confirmation]":{
                      required: true
                }
        },
    messages: {
 "user[email]":{
                      required: "Email cannot be blank"
					
                },
"user[password]":{
                      required: "Password cannot be blank"
                },
"user[password_confirmation]":{
                      required: "Password Confirmation cannot be blank"
                }   
   
    }
   });


    

  jQuery("#admin_goal").validate({
    errorElement:'span',
    rules: {
      "admin_goal[goal_title]":{
                      required: true
                }
        },
    messages: {
 "admin_goal[goal_title]":{
                      required: "This field is required"
                }
   
    }
   });

    jQuery("#admin_relationship_type").validate({
    errorElement:'span',
    rules: {
      "admin_relationship_type[relationship]":{
                      required: true
                }
        },
    messages: {
 "admin_relationship_type[relationship]":{
                      required: "This field is required"
                }
    }
   });
  

	//Validation for confirmation to bank
	jQuery("#confirm_bank").validate({
    errorElement:'span',
    rules: {
      "verified[amount1]":{
                      required: true,
					  digits: true
                },
     "verified[amount2]":{
                      required: true,
					  digits: true
                }
        },
    messages: {
 "verified[amount1]":{
                      required: "Amount1 cannot be blank",
					  digits: "Please enter only digit"
                },
"verified[amount2]":{
                      required: "Amount2 cannot be blank",
					  digits: "Please enter only digit"
                } 
     }
   });


  //Validations for payments
	jQuery("#payment").validate({
	    errorElement:'span',
	    rules: {
	      "amount":{
	                      required: true,
						  digits: true
	                }
	        },
	    messages: {
	 "amount":{
	                      required: "Amount cannot be blank",
						  digits: "Please enter only digit"
	                }
	     }
	   });
	
		 //validations for new bank customers
	   jQuery("#new_bank_customer").validate({
	    errorElement:'span',
	    rules: {
	      "bank_customer[customer_id]":{
	                      required: true
	                },
		   "bank_customer[bank_account_id]":{
				          required: true
				     }
			
	        },
	    messages: {
	 "bank_customer[customer_id]":{
	                      required: "Please select customer"
	                },
	  "bank_customer[bank_account_id]":{
					     required: "Please select bank"
					 }
	     }
	   });
        

    //Validations for new kid
    jQuery("#kid").validate({
      errorElement:'span',
      rules: {
        "kid[kid_name]":{
                        required: true
                  },
       "kid[kid_description]":{
                  required: true
             }
      
          },
      messages: {
   "kid[kid_name]":{
                required: "Please add name"
      },
    "kid[kid_description]":{
               required: "Please add description"
           }
       }
     });




	//Validation for creating new user
	    jQuery("#contact").validate({
	    errorElement:'span',
	    rules: {
		  "contact[name]":{
		                      required: true
		                },
	      "contact[email]":{
	                      required: true,
	                      email: true
	                }
	        },
	    messages: {
	
	  		"contact[name]":{
			                       required: "Name cannot be blank"
			                },
	 "contact[email]":{
	                      required: "Email cannot be blank"

	                }

	    }
	   });
	
	
	
		//Validation for send invitation
		 jQuery("#invite").validate({
		    errorElement:'span',
		    rules: {
			  "contact_emails[]":{
			                      required: function (element) {
								                var boxes = $('.checkbox');
								                if (boxes.filter(':checked').length == 0) {
								                    return true;
								                }
								                return false;
								            },
								            minlength: 1
			                },
		      "message":{
		                      required: true
		                }
		        },
		    messages: {

		  		"contact_emails[]":{
				                       required: "Please select at least one types of checkbox."
				                },
		 		"message":{
		                      required: "Message cannot be blank"

		                }

		    }
		   });
		
		
		
		//Validation for create a event
		 jQuery("#event").validate({
		    errorElement:'span',
		    rules: {
			  "event[title]":{
			                      required: true
			                },
		      "event[kid_id]":{
		                      required: true
		                }
		        },
		    messages: {

		  		"event[title]":{
				                       required: "Name cannot be blank"
				                },
		 		"event[kid_id]":{
		                      required: "Please select a kid"

		                }

		    }
		   });

	
	  
	
});
	