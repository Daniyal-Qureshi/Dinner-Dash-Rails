# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = ['Main Dishes', 'Pastry', 'Salads', 'Fruit Drinks', 'Hot Drinks']

items = [

  {
    title: 'Qourma',
    price: 350,
    description: 'Qourma',
    photo: 'https://i.ndtvimg.com/i/2016-10/chicken-korma_650x400_51475662188.jpg'

  },
  {
    title: 'Pancakes',
    price: 300,
    description: 'Pancakes with butter and syrup',

    photo: 'https://www.eatthis.com/wp-content/uploads/sites/4/2019/11/whole-grain-pancake-stack.jpg'

  },

  {
    title: 'green salads',
    price: 100,
    description: 'Green Salads',

    photo: 'https://www.thespruceeats.com/thmb/r83ZPDHz-iy2VjRJMAf6ya3S-7A=/2500x1406/smart/filters:no_upscale()/perfectgreensalad2500-5993ab28c412440011db26df.jpg'

  },

  {
    title: 'Watermelon Lychee',
    price: 200,
    description: 'Watermelon Lychee',
    photo: 'https://cdn.kuali.com/wp-content/uploads/2021/07/09110923/840x560-Watermelon-Lychee-Fizz.jpg'

  },
  {
    title: 'Tea',
    price: 100,
    description: 'Tea',
    photo: 'https://www.verywellhealth.com/thmb/ZGs7ufUg-ohsUzQrZZ_Lfbfavns=/1989x1492/smart/filters:no_upscale()/GettyImages-693893647-588d21e413dd411cb1f2b0a0ea3e02da.jpg'

  }

]

categories.zip(items).each do |category, item|
  puts item
  cat = Category.create(name: category)
  cat.items.create(item)
end

# users
User.create(email: 'daniyal@gmail.com', password: '123456', role: 'user', full_name: 'Daniyal Qureshi')
User.create(email: 'admin@gmail.com', password: '123456', role: 'admin', full_name: 'Admin')
