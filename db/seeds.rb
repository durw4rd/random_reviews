products = [
  ["Handcleaner", "http://ecx.images-amazon.com/images/I/51P0uZa2-5L._SL1024_.jpg"],
  ["Candwich", "https://uploads.disquscdn.com/images/ba8083e2f2de84750f85f9c5a27ea041aeaf2cf7d901d618f02e381a68636fcc.jpg"],
  ["Crazy Cat Lady", "http://mcphee.com/shop/media/catalog/product/cache/1/image/600x600/9df78eab33525d08d6e5fb8d27136e95/c/r/crazy_cat_lady_action_figure_1.jpg"],
  ["Handicorn", "http://mcphee.com/shop/media/catalog/product/cache/1/image/600x600/9df78eab33525d08d6e5fb8d27136e95/h/a/handicorn_1.jpg"]
]

productss.each do | name, image |
   Product.create!( name: name, image: image)
end

reviews = {}

reviews["Handcleaner"] = [
  title: "Amazing cleaning tool",
  description: "Used this cleaner tool for a long time and I really like it. Highly recommend for people who need to clean something",
  rating: 4,
  helpfull: true
]

reviews["Candwich"] = [
  title: "Handy can, but not special",
   description: "Really like the design of the Candwich but it can get hot in the sun so be carefull.",
   rating: 3,
   helpfull: false
]

reviews["Crazy Cat Lady"] = [
    title: "Don't like this lady",
    description: "Gave the Crazy Cat Lady Action Figure to my grandmother last christmas and I really
    don't recommend buying this product. It starts to smell really weird after playing with it a lot and is also looking very strange.",
    rating: 1,
    helpfull: false
]

reviews["Handicorn"] = [
  title: "Love this product!",
  description: "The Handicorn is amazing for kids, but also for older
  people like me. Much fun to play with when your bored. You should buy this!",
  rating: 5,
  helpfull: true
]

reviews.each do | product, review|
  review = Review.create!( product_id: product.id, title: title, description: description, rating: rating, helpfull: helpfull )
end
