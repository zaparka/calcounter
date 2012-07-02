food_items = [
  {category: "milk & dairy", name: "Cheese average", calories: 110, portion_size: 25, unit: "g"},
  {category: "milk & dairy", name: "Cottage cheese", calories: 49, portion_size: 49, unit: "g"},
  {category: "milk & dairy", name: "Cream cheese", calories: 200, portion_size: 47, unit: "g"},
  {category: "milk & dairy", name: "Egg", calories: 90, portion_size: 60, unit: "g"},
  {category: "milk & dairy", name: "Ice cream", calories: 200, portion_size: 111, unit: "g"},
  {category: "milk & dairy", name: "Milk whole", calories: 175, portion_size: 250, unit: "ml"},
  {category: "milk & dairy", name: "Milk semi-skimmed", calories: 125, portion_size: 250, unit: "ml"},
  {category: "milk & dairy", name: "Milk skimmed", calories: 95, portion_size: 250, unit: "ml"},
  {category: "milk & dairy", name: "Trifle with cream", calories: 290, portion_size: 1, unit: "trifle"},
  {category: "milk & dairy", name: "Yogurt natural", calories: 90, portion_size: 1, unit: "small pot"},
  {category: "milk & dairy", name: "Yogurt reduced fat", calories: 75, portion_size: 1, unit: "small pot"},
  #breads & cereals
  {category: "breads & cereals", name: "Bagel", calories: 140, portion_size: 45, unit: "g"},
  {category: "breads & cereals", name: "Bread white (thick slice)", calories: 96, portion_size: 1, unit: "slice"},
  {category: "breads & cereals", name: "Bread wholemeal (thick slice)", calories: 88, portion_size: 1, unit: "slice"},
  {category: "breads & cereals", name: "Noodles (boiled)", calories: 175, portion_size: 250, unit: "g"},
  {category: "breads & cereals", name: "Pasta (normal boiled)", calories: 330, portion_size: 300, unit: "g"},
  {category: "breads & cereals", name: "Porridge oats (with water)", calories: 193, portion_size: 350, unit: "g"},
  {category: "breads & cereals", name: "Potatoes (boiled)", calories: 210, portion_size: 300, unit: "g"},
  {category: "breads & cereals", name: "Rice (white boiled)", calories: 420, portion_size: 300, unit: "g"},
  #MEATS & FISH
  {category: "meat & fish", name: "Bacon average fried", calories: 250, portion_size: 2, unit: "rashers"},
  {category: "meat & fish", name: "Beef (roast)", calories: 300, portion_size: 107, unit: "g"},
  {category: "meat & fish", name: "Chicken", calories: 220, portion_size: 110, unit: "g"},
  {category: "meat & fish", name: "Ham", calories: 6, portion_size: 2.5, unit: "g"},
  {category: "meat & fish", name: "Lamb (roast)", calories: 300, portion_size: 100, unit: "g"},
  {category: "meat & fish", name: "Lunch meat", calories: 300, portion_size: 75, unit: "g"},
  {category: "meat & fish", name: "Prawns", calories: 180, portion_size: 180, unit: "g"},
  {category: "meat & fish", name: "Pork", calories: 320, portion_size: 110, unit: "g"},
  {category: "meat & fish", name: "Salmon fresh", calories: 220, portion_size: 122, unit: "g"},
  {category: "meat & fish", name: "Sausage pork fried", calories: 250, portion_size: 78, unit: "g"},
  {category: "meat & fish", name: "Trout fresh", calories: 200, portion_size: 167, unit: "g"},
  {category: "meat & fish", name: "Turkey", calories: 200, portion_size: 125, unit: "g"},
  #FRUITS & VEGETABLES
  {category: "fruits & vegetable", name: "Apple", calories: 44, portion_size: 100, unit: "g"},
  {category: "fruits & vegetable", name: "Banana", calories: 107, portion_size: 165, unit: "g"},
  {category: "fruits & vegetable", name: "Broccoli", calories: 27, portion_size: 84, unit: "g"},
  {category: "fruits & vegetable", name: "Cucumber", calories: 3, portion_size: 30, unit: "g"},
  {category: "fruits & vegetable", name: "Grapes", calories: 55, portion_size: 89, unit: "g"},
  {category: "fruits & vegetable", name: "Lettuce", calories: 4, portion_size: 27, unit: "g"},
  {category: "fruits & vegetable", name: "Peas", calories: 210, portion_size: 142, unit: "g"},
  {category: "fruits & vegetable", name: "Spinach", calories: 8, portion_size: 100, unit: "g"},
  {category: "fruits & vegetable", name: "Strawberries", calories: 10, portion_size: 33, unit: "g"}
]

food_items.each do |food|
  category = Category.create(:name => food[:category]) || Category.find(food[:category])
  food.delete(:category)
  food.merge!(:category_id => category.id)
  Food.create(food)
end