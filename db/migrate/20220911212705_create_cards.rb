class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :position
      t.references :column, null: false, foreign_key: true

      t.timestamps
    end
  end
end
