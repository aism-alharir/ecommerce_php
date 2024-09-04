//Qoiary1 view
CREATE Or REPLACE VIEW itemsview as 
SELECT items.* , categories.* FROM items 
INNER JOIN categories ON categories.categories_id = items.items_cat

//Qoiary2_Use_In__item.php
SELECT itemsview.* , 1 as favorite FROM itemsview
INNER JOIN favorite ON favorite.favorite_itemsid = itemsview.items_id AND favorite.favorite_usersid = 20
UNION ALL
SELECT itemsview.* , 0 as favorite FROM itemsview
WHERE itemsview.items_id NOT IN (SELECT itemsview.items_id FROM itemsview
INNER JOIN favorite ON favorite.favorite_itemsid = itemsview.items_id AND favorite.favorite_usersid = 20)

//Qoiary3 view 
CREATE or REPLACE VIEW myFavorite as
SELECT favorite.*,items.*,users.users_id FROM favorite 
INNER JOIN items ON favorite.favorite_itemsid = items.items_id
INNER JOIN users ON favorite.favorite_usersid = users.users_id

// view cartview
CREATE OR REPLACE VIEW cartview AS
SELECT SUM(items.items_price - items.items_price * items.items_discount / 100) as itemsprice, COUNT(cart.cart_itemsid) as countitems , items.* , cart.* FROM cart 
INNER JOIN items ON cart.cart_itemsid = items.items_id 
WHERE cart_orders = 0
GROUP BY cart.cart_usersid , cart.cart_itemsid ,cart.cart_orders

//Qoiary5
SELECT SUM(cartview.itemsprice) as totalprice, SUM(cartview.countitems) as totalcount FROM `cartview`
WHERE cartview.cart_usersid = 20
GROUP BY cartview.cart_usersid

//View orderView
CREATE Or REPLACE VIEW ordersview AS
SELECT orders.* , address.* FROM orders 
LEFT JOIN address ON orders.orders_address = address.address_id

//View ordersdetailsview
CREATE OR REPLACE VIEW ordersdetailsview AS
SELECT SUM(items.items_price - items.items_price * items.items_discount / 100) as itemsprice, COUNT(cart.cart_itemsid) as countitems , items.* , cart.* FROM cart 
INNER JOIN items ON cart.cart_itemsid = items.items_id 
WHERE cart_orders != 0
GROUP BY cart.cart_usersid , cart.cart_itemsid ,cart.cart_orders

//select    Top Selling items more sell المنتجات الاكثر مبيعيا
SELECT COUNT(cart_id) as countitems , cart.*  FROM  cart
WHERE cart_orders != 0 
GROUP BY cart_itemsid

//view    To0 Selling items more sell المنتجات الاكثر مبيعيا
CREATE or REPLACE VIEW itemstopselling AS
SELECT COUNT(cart_id) as countitems , cart.* , items.* ,(items_price - (items_price * items_discount / 100))  as itemspriceediscount   FROM  cart
INNER JOIN items ON  cart.cart_itemsid = items.items_id
WHERE cart_orders != 0 
GROUP BY cart_itemsid