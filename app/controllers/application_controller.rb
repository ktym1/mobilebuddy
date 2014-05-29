require 'mailchimp'

class ApplicationController < ActionController::Base
	 before_action :setup_mcapi
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception



  def setup_mcapi
  	begin
      @mailchimp = Mailchimp::API.new('f77765433fbdd33e01783cfde4e367b8-us8')
    rescue => e
      flash.now[:alert] = 'There was a problem connecting to MailChimp'
    end
    @mailchimp
  end

  def gb
    begin
     gb ||= Gibbon::API.new('f77765433fbdd33e01783cfde4e367b8-us8')
   rescue => e
     puts = 'There was a problem connecting to MailChimp'
   end
   gb
  end 

end
