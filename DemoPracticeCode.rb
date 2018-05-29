#*************************************************************
# First lesson of Watir automated testing tool.
#
# Summary: Basic test of Google search engine.
# Description: the next steps to be automated:
#   - going to google.com,
#   - typing ‘Watir’ into search form,
#   - click ‘Search’,
#   - verify results.
# Author: Duraivelan
#*************************************************************

# Watir IE driver
require 'watir'
# Required in ruby 1.8.7
require 'rubygems'

# text to show on console
puts "Beginning of the test for Google search engine"

puts "Step 1:  Go to the Google homepage"

#Driver should be available in the path
browser = Watir::Browser.new(:firefox) #Firefox however opens
#browser = Watir::Browser.new(:chrome)
browser.goto "http://google.com"


#set a variable
search_text = "Watir"

puts " Step 2: enter "+ search_text +" in the search text field."
browser.text_field(:name, "q").set search_text # "q" is the name of the search field

puts " Step 3: click the 'Google Search' button."
browser.button(:name, "btnK").click # "btnG" is the name of the Search button

puts " Expected Result:"
puts "  A Google page with results should be shown. 'Watir, pronounced water' should be high on the list."

puts " Actual Result:"
if browser.text.include? "Watir, pronounced water"
  puts "  Test Passed. Found the test string: 'Watir, pronounced water'. Actual Results match Expected Results."
else
  puts "  Test Failed! Could not find: 'Watir, pronounced water'."
end

puts "End of test: Google search."
browser.close