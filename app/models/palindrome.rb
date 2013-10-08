class ValidPalindrome < ActiveModel::Validator
	def validate(record)
		test_string = record.text
		unless test_string == test_string.reverse
			record.errors[:text] << 'Must be a palindrome!'
		end
	end
end


class Palindrome < ActiveRecord::Base

	before_validation :format_text
	before_save :count_letters

	include ActiveModel::Validations
	validates_with ValidPalindrome
	validates_uniqueness_of :text
	validates :text, length: { minimum: 2}

	  attr_accessible :letters, :text, :sites
	  has_and_belongs_to_many :sites

	  private 

	  def count_letters
	 	 self.letters = self.text.length
	  end

	  def format_text
	  	self.text = self.text.downcase.gsub(/[^a-z]/, '')
	  end

end
