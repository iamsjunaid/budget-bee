class CreatePurchaseCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_categories do |t|
      t.references :purchase, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
