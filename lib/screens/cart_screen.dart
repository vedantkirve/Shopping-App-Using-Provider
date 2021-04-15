import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/Provider/cart.dart' show Cart;
import '../widgets/cart_item.dart' as CI;

class CartScreeen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Chip(
                    label: Text(
                      "${cart.totalAmout}",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                      onPressed: () {},
                      child: Text(
                        "ORDER NOW",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ))
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: cart.itemCount,
                  itemBuilder: (context, index) {
                    return CI.CartItem(
                        id: cart.items.values.toList()[index].id,
                        title: cart.items.values.toList()[index].title,
                        price: cart.items.values.toList()[index].price,
                        quantity: cart.items.values.toList()[index].quantity);
                  }))
        ],
      ),
    );
  }
}
