class NewsletterController < ApplicationController
	def new
	end

	def create
		begin
			email = params['email']
			gb.lists.subscribe({:id => '6ae858fa9a', :email => {:email => email}, 
				                :merge_vars => {'GROUPINGS' => {0 => {'id' => '9545', 'groups' => params[:dev_name]}}}, 
				                :double_optin => false,:update_existing => true})
			flash[:success] = "#{email} subscribed successfully"
		    puts "#{email} subscribed successfully"

		rescue Gibbon::MailChimpError => e
		  puts e.message 
		  puts e.code 

		rescue => ex
           puts e.message 
		   puts e.code
		end
		render :text => ""
	end
end
