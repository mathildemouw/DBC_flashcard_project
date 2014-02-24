class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.belongs_to :users
      t.belongs_to :decks
      t.integer :correct_answers, default: 0

      t.timestamps
    end
  end
end
