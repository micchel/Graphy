class CreatePhotographerPrefectures < ActiveRecord::Migration[5.2]
  def change
    create_table :photographer_prefectures do |t|
      t.references   :photographer,  null:false, foreign_key: true
      t.references   :prefecture,    null:false, foreign_key: true
      t.timestamps
    end
  end
end
