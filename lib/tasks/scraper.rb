require 'mechanize'
require 'open-uri'
require 'logger'
require File.expand_path('../../../config/environment',  __FILE__)


class Scraper
	attr_accessor :agent

	def get_agent
		@agent = Mechanize.new{ |agent| agent.user_agent_alias = 'Mac Safari'}
		@agent.follow_meta_refresh_self
	    @agent.redirect_ok
	    @agent
	end

end
