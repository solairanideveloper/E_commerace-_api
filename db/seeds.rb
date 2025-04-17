# Clear old data
OrderItem.destroy_all
Order.destroy_all
Product.destroy_all
Category.destroy_all
User.destroy_all

# Create Users
user1 = User.create!(name: "solairani", email: "solairani@example.com")


# Create Categories
cat1 = Category.create!(name: "Electronics")
cat2 = Category.create!(name: "Books")

# Create Products
p1 = Product.create!(name: "Phone", price: 500, category: cat1)
p2 = Product.create!(name: "Laptop", price: 1000, category: cat1)
p3 = Product.create!(name: "Ruby Book", price: 50, category: cat2)

# Create Order for user1
order = Order.create!(user: user1)
OrderItem.create!(order: order, product: p1, quantity: 2)
OrderItem.create!(order: order, product: p3, quantity: 1)
order.update!(total_price: order.order_items.sum { |item| item.quantity * item.product.price })
