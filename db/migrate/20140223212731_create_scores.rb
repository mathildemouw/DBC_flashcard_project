class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.belongs_to :user
      t.belongs_to :deck
      t.integer :correct_answers, default: 0

      t.timestamps
    end
  end
end
