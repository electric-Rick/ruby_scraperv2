# Author: Erick Augusto
# Description:  This scraper was created to demonstrate some skills with those frameworks: Mechanize and Nokogiri
# Ways to run it: ruby index.rb "Mechanize" or ruby index "Nokogiri"
Dir["./lib/*.rb"].each { |file|
	require_relative file
}

start_scrap = Scraper.new
hash_values = Hash_gen.new

ARGV.each do |a|
	@final_cut = hash_values.generate_hash(start_scrap.fetch_data_with("#{a}")[0], start_scrap.fetch_data_with("#{a}")[1])
end

puts @final_cut