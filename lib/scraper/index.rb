#scraper/index.rb Main file
require 'mechanize'
require 'open-uri'

module Scrape
	def configure_agent(agent_gem)
		if agent_gem == Mechanize
			agent = agent_gem.new
		elsif agent_gem == Nokogiri
			agent = agent_gem
		else
			puts "No agent please, insert one agent"
		end
		return agent
	end
	
	

	def connect_website(url, agent_type)
		if agent_type == Mechanize
			my_agent = configure_agent(agent_type)
			page     = my_agent.get(url)				
		elsif agent_type == Nokogiri
			page = agent_type::HTML(URI.open(url))
		end
		return page
	end

	def fetch_data_with(agent)		
			arr 		       = Array.new
			images       	   = Array.new
			names 			   = Array.new
		if agent == "Mechanize"
			result		   = connect_website("http://localhost:3000", Mechanize)			
			result.css(".row .right").each do |ll|
				arr << ll.text.chomp(' ')
			end
			
			result.css(".row .left").each do |columns|
				names << columns.text.chomp(':')
			end
			
			result.css(".photo img").each do |img|
				images << img['src']			
			end

		elsif agent == "Nokogiri"
			result = connect_website("http://localhost:3000", Nokogiri)
			

			result.css('.row .right').each do  |ll|
				arr << ll.text.chomp(' ')
			end

			result.css(".row .left").each do |columns|
				names << columns.text.chomp(':')
			end

			result.css('.photo img').each do |img|
				images << img['src']
			end		
		else
			puts "Error: No agent selected"
		end				
		return arr, names
	end
end

