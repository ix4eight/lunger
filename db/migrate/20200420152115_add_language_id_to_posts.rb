class AddLanguageIdToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :language_id, :integer
  end
end
