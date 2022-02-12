class AddCategoryIdToFilms < ActiveRecord::Migration[6.1]
  def change
    add_column :films, :category_id, :integer
  end
end
