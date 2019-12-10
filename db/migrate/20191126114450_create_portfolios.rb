class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.references   :photographer,  null:false, foreign_key: true
      t.integer      :category_id
      t.string       :image
      t.timestamps
    end
  end
end
