import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/Provider/products.dart';
import 'package:shop_app_provider/screens/edit_product_screen.dart';
import 'package:shop_app_provider/widgets/app_drawer.dart';
import 'package:shop_app_provider/widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const routeaName = "/user-product";
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Product"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              }),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (context, int i) {
              return UserProductItem(
                title: productsData.items[i].title,
                imageUrl: productsData.items[i].imageUrl,
              );
            }),
      ),
    );
  }
}
