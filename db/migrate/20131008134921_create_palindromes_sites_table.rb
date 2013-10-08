class CreatePalindromesSitesTable < ActiveRecord::Migration
  def change
  	create_table :palindromes_sites, :id => false do |t|
  		t.integer :palindrome_id
  		t.integer :site_id
  	end
  end
end
