class PalindromesController < ApplicationController

	def index
		@palindromes = Palindrome.order('letters DESC')
	end

	def scrape
		url = params[:url]
		max_length = 100

		response = HTTParty.get(url)

		text = response.body.downcase.split(' ')

		site = Site.find_by_url(url) || Site.create(url: url)

		1.upto(text.length - max_length) do |index_a|
			(index_a+1).upto(index_a + max_length) do |index_b|
				test_phrase = text[index_a..index_b].join()

				new_pal = Palindrome.new(text: test_phrase)
				if new_pal.save
					new_pal.sites << site
				end
			end
		end
	end

end