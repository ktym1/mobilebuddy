class NewsletterController < ApplicationController
	def new
	end

	def create
		begin
			email = params['email']
			unless params[:dev_name]
				gb.lists.subscribe({:id => '6ae858fa9a', :email => {:email => email}, 
					                :merge_vars => {'GROUPINGS' => {0 => {'id' => '9545', 'groups' => params[:dev_name]}}}, 
					                :double_optin => false,:update_existing => true})
			else
				gb.lists.subscribe({:id => '6ae858fa9a', :email => {:email => email}, 
					                :double_optin => false,:update_existing => true})
			end

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
