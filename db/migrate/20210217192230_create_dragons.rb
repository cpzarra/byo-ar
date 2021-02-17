class CreateDragons < ActiveRecord::Migration[5.2]
  def change
    create_table :dragons do |t|
      t.string :name, null: false
      t.string :color

      t.timestamps
    end
  end
end
