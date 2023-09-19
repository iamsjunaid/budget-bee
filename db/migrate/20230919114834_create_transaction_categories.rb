class CreateTransactionCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_categories do |t|
      belongs_to :transaction
      belongs_to :category
      
      t.timestamps
    end
  end
end
