class CreatePalindromes < ActiveRecord::Migration
  def change
    create_table :palindromes do |t|
      t.text :text
      t.integer :letters

      t.timestamps
    end
  end
end
