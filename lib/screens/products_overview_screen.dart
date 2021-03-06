import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/Provider/cart.dart';
import 'package:shop_app_provider/Provider/products.dart';
import 'package:shop_app_provider/widgets/app_drawer.dart';
import 'package:shop_app_provider/widgets/badge.dart';
import 'package:shop_app_provider/widgets/products_grid.dart';
import '../screens/cart_screen.dart';

import 'cart_screen.dart';

// import 'package:shop_app_provider/widgets/product_items.dart';
enum FilterOptions { Favorites, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavoritesOnly = false;
  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    print(selectedValue);
                    _showFavoritesOnly = true;
                    // productContainer.showFavoritesOnly();
                  } else {
                    _showFavoritesOnly = false;
                    // productContainer.showAll();
                  }
                });
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text("Only Favorites"),
                      value: FilterOptions.Favorites,
                    ),
                    PopupMenuItem(
                      child: Text("Show All"),
                      value: FilterOptions.All,
                    ),
                  ]),
          Consumer<Cart>(
            builder: (context, cart, ch) =>
                Badge(child: ch, value: cart.itemCount.toString()),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showFavoritesOnly),
    );
  }
}
