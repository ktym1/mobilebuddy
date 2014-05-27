class NewsletterController < ApplicationController
	def new
	end

	def create
	
        email = params['email']
		begin
			  # merge_vars = {
					#           "groupings" => 0 =>{[ 
					#           	               "name" => 'Devices',
     #                                           "groups" => params[:dev_name]
     #                                        ]}
					          
					#         }
					# puts @mailchimp.lists.interest_groupings('6ae858fa9a')

		     email_struct = @mailchimp.lists.subscribe('6ae858fa9a', 
				    	                      {'email' => email}, 
				    	                      'double_optin' => false,
                                              'send_welcome' => false,
				    	                      'update_existing'=> true,
				    	                      'email_type' =>'html',
				    	                      :merge_vars => {
                                                'GROUPINGS' => {0 => {'id' => '9545', 'groups' => params[:dev_name]}}},
				    	                      'replace_interests' => false
		    	                            )
		     # puts merge_vars
		     # puts email_struct
		     # @mailchimp.lists.update_member('6ae858fa9a', email_struct,{'merge_vars' => merge_vars},'email_type' =>'html','replace_interests' => true)
		    
		    flash[:success] = "#{email} subscribed successfully"
		    puts "#{email} subscribed successfully"
		    rescue Mailchimp::ListAlreadySubscribedError
		      flash[:error] = "#{email} is already subscribed to the list"
		      puts "#{email} is already subscribed to the list"
		    rescue Mailchimp::ListDoesNotExistError
		      flash[:error] = "The list could not be found"
		      puts "The list could not be found"
		end
		render :text => "thx"
    end
end
