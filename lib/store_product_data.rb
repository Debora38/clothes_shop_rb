shop = Shop.new

# WOMEN'S FOOTWEAR
shop.create_category('womensfootwear')
womensfootwear = shop.categories[0]

womensfootwear.create_item('Almond Toe Court Shoes, Patent Black', 99, 5)
almondtoecourtshoes = womensfootwear.items[0]

womensfootwear.create_item('Suede Shoes, Blue', 42, 4)
suedeshoesblue = womensfootwear.items[1]


# MEN'S FOOTWEAR
shop.create_category('mensfootwear')
mensfootwear = shop.categories[1]

mensfootwear.create_item('Leather Driver Saddle Loafers, Tan', 34, 12)
leatherloafers = mensfootwear.items[0]

mensfootwear.create_item('Flip Flops, Red', 19, 6)
redflipflop = mensfootwear.items[1]

mensfootwear.create_item('Flip Flops, Blue', 19, 0)
blueflipflop = mensfootwear.items[2]


# WOMEN'S CASUAL WEAR
shop.create_category('womenscasualwear')
womenscasualwear = shop.categories[2]

womenscasualwear.create_item('Gold Button Cardigan, Black', 167, 6)
blackcardigan = womenscasualwear.items[0]

womenscasualwear.create_item('Cotton Shorts, Medium Red', 30, 5)
cottonshorts = womenscasualwear.items[1]


# MEN'S CASUAL WEAR
shop.create_category('menscasualwear')
menscasualwear = shop.categories[3]

menscasualwear.create_item('Fine Stripe Short Sleeve Shirt, Grey', 49.99, 9)
greyshortsleeveshirt = menscasualwear.items[0]

menscasualwear.create_item('Fine Stripe Short Sleeve Shirt, Green', 39.99, 3)
greenshortsleeveshirt = menscasualwear.items[1]

# WOMEN'S FORMAL WEAR
shop.create_category('womensformalwear')
womensformalwear = shop.categories[4]

womensformalwear.create_item('Bird Print Dress, Black', 270, 10)
birdprintdress = womenscasualwear.items[0]

womensformalwear.create_item('Mid Twist Cut­Out Dress, Pink', 540, 5)
pinkdress = womenscasualwear.items[1]

# MEN'S FORMAL WEAR
shop.create_category('mensformalwear')
mensformalwear = shop.categories[5]

mensformalwear.create_item('Sharkskin Waistcoat, Charcoal', 75, 2)
sharkskinwaistcoat = menscasualwear.items[0]

mensformalwear.create_item('Lightweight Patch Pocket Blazer, Deer', 175.50, 1)
blazer = menscasualwear.items[1]

# VOUCHERS
shop.create_voucher(5, 'voucher5')
voucher_five = shop.shopping_cart.available_vouchers[0]

shop.create_voucher(10, 'voucher10')
voucher_ten = shop.shopping_cart.available_vouchers[1]

shop.create_voucher(15, 'voucher15')
voucher_fifteen = shop.shopping_cart.available_vouchers[2]
