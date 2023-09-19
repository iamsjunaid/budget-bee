class CreatePurchaseCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :purchase_categories do |t|

      t.timestamps
    end
  end
end
