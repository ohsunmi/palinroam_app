class Site < ActiveRecord::Base
  attr_accessible :url, :palindromes

  has_and_belongs_to_many :palindromes
end
