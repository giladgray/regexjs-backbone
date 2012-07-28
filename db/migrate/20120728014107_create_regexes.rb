class CreateRegexes < ActiveRecord::Migration
  def change
    create_table :regexes do |t|
      t.string :title
      t.string :pattern
      t.string :modifiers
      t.string :notes

      t.timestamps
    end
  end
end
