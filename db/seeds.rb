# Seed Categories
Category.create(name: 'Groceries', icon: '🛒')
Category.create(name: 'Utilities', icon: '💡')
Category.create(name: 'Transportation', icon: '🚗')
Category.create(name: 'Entertainment', icon: '🎥')
Category.create(name: 'Dining', icon: '🍽')

# Seed Users
User.create(name: 'John Doe')
User.create(name: 'Jane Smith')
User.create(name: 'Alice Johnson')

# Seed Purchases
Purchase.create(name: 'Grocery Shopping', amount: 50.75)
Purchase.create(name: 'Electricity Bill', amount: 120.00)
Purchase.create(name: 'Gasoline', amount: 40.50)
Purchase.create(name: 'Movie Night', amount: 25.00)
Purchase.create(name: 'Dinner at Restaurant', amount: 75.25)

# Seed Purchase Categories
PurchaseCategory.create(purchase_id: 1, category_id: 1)
PurchaseCategory.create(purchase_id: 2, category_id: 2)
PurchaseCategory.create(purchase_id: 3, category_id: 3)
PurchaseCategory.create(purchase_id: 4, category_id: 4)
PurchaseCategory.create(purchase_id: 5, category_id: 5)
PurchaseCategory.create(purchase_id: 1, category_id: 5)
PurchaseCategory.create(purchase_id: 3, category_id: 1)
PurchaseCategory.create(purchase_id: 5, category_id: 3)
PurchaseCategory.create(purchase_id: 2, category_id: 4)
PurchaseCategory.create(purchase_id: 4, category_id: 2)
