class CreateFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :films do |t|
      t.string :title
      t.text :description
      t.string :director

      t.timestamps
    end
  end
end
