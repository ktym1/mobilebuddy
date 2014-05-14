require 'mechanize'
require 'open-uri'
require 'watir-webdriver'
require 'logger'
require File.expand_path('../../../config/environment',  __FILE__)


class Scraper
	

	def get_agent
		agent_aliases = Mechanize::AGENT_ALIASES.to_a
		# agent_aliases[Random.rand(Mechanize::AGENT_ALIASES.length)][0]
		#setting a random user agent 		
		agent = Mechanize.new{ |agent| agent.user_agent_alias = 'Mac Safari' }
		agent.follow_meta_refresh_self
	    agent.redirect_ok
	    agent
	end

end
