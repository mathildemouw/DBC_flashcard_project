class CreateCards < ActiveRecord::Migration
  def up
    create_table :cards do |t|
      t.string :question, :answer
      t.belongs_to :deck
      t.timestamps
    end
  end

  def down
    drop_table :cards
  end
end
