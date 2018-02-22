class AddFavoriteToRelationships < ActiveRecord::Migration[5.0]
  def change
    add_reference :relationships, :favorite, foreign_key: { to_table: :microposts }
    
    t.index [:favorite_id], unique: true
  end
end
