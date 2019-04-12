# Clothes Shop
[![Build Status](https://travis-ci.com/Debora38/clothes_shop_rb.svg?branch=master)](https://travis-ci.com/Debora38/clothes_shop_rb)

This Clothes Shop has six categories of clothes:
1. women’s footwear
2. men’s footwear
3. women’s casualwear
4. men’s casualwear
5. women’s formalwear
6. men’s formalwear

The products available are listed here below, along with the variable name in order to use the program on irb.

##### WOMEN'S FOOTWEAR (_womensfootwear_)
- _almondtoecourtshoes_: 'Almond Toe Court Shoes, Patent Black', £99.00
- _suedeshoesblue_: 'Suede Shoes, Blue', £42.00

#### MEN'S FOOTWEAR (_mensfootwear_)
- _leatherloafers_: 'Leather Driver Saddle Loafers, Tan', £34.00
- _redflipflop_: 'Flip Flops, Red', £19.00
- _blueflipflop_: 'Flip Flops, Blue', £19.00

#### WOMEN'S CASUAL WEAR (_womenscasualwear_)
- _blackcardigan_: 'Gold Button Cardigan, Black', £167.00
- _cottonshorts_: 'Cotton Shorts, Medium Red', £30.00

#### MEN'S CASUAL WEAR (_menscasualwear_)
- _greyshortsleeveshirt_: 'Fine Stripe Short Sleeve Shirt, Grey', £49.99
- _greenshortsleeveshirt_: 'Fine Stripe Short Sleeve Shirt, Green', £39.99

#### WOMEN'S FORMAL WEAR (_womensformalwear_)
- _birdprintdress_: 'Bird Print Dress, Black', £270.00
- _pinkdress_: 'Mid Twist Cut­Out Dress, Pink', £540.00

#### MEN'S FORMAL WEAR (_mensformalwear_)
- _sharkskinwaistcoat_: 'Sharkskin Waistcoat, Charcoal', £75.00
- _blazer_: 'Lightweight Patch Pocket Blazer, Deer', £175.50

##### VOUCHERS
There are some available vouchers as well, to be applied with a code depending on the criteria listed:

- £5.00 off your order with code 'voucher5'
- £10.00 off with code 'voucher10' when you spend over £50.00
- £15.00 off with code 'voucher15' when you have bought at least one footwear item and spent over £75.00

## My approach
This program has been implemented only back-end, in order to prioritise features and edge-cases coverage.<br>
The shop can create category of items and subsequently it can create items in them. It can also create vouchers to be applied to the shopping cart. 3 criteria of vouchers, as specified above, have been implemented.
Only one voucher per shopping cart can be added and the voucher's criteria is checked everytime that an item is removed from the shopping cart, to eventually remove the voucher as well, if it does not apply anymore. Invalid vouchers raise errors, as well as a shopping cart not meeting the criteria for it.

## Model of the program
<img src="https://github.com/Debora38/clothes_shop_rb/blob/master/docs/clothes_shop_diagram.png?raw=true">

## Instructions
These instructions assume that ruby and rspec are installed in the machine.
- clone locally
- move into the folder from the command line
- run rspec to check that all tests pass
- run `irb`
- `require './lib/shop'`
- copy and paste into irb all the content of the file 'store_product_data' to stock the store with the information listed above
- start adding to cart with `shop.shopping_cart.add_to_cart(pinkdress)` replacing _pinkdress_ to any of the variables listed here above
- try applying a voucher `shop.shopping_cart.apply_voucher('voucher5')` replacing _voucher5_ to any of the voucher codes listed here above ('voucher10', 'voucher15')
- try removing items with `shop.shopping_cart.remove_item_from_cart(pinkdress)` replacing _pinkdress_ with any variable of cloth listed here above
