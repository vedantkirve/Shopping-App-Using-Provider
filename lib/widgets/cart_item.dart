import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/Provider/cart.dart';

class CartItem extends StatelessWidget {
  String id;
  String productId;
  double price;
  int quantity;
  String title;
  CartItem({
    this.id,
    this.price,
    this.quantity,
    this.title,
    this.productId,
  });
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      confirmDismiss: (direaction) {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Are you sure"),
                  content:
                      Text("Do you want to remove the item from the cart? "),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                          // return false;
                        },
                        child: Text("No")),
                    FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          // return true;
                        },
                        child: Text("Yes"))
                  ],
                ));
      },
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeitem(productId);

        // print("pres");
      },
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(child: Text("\$ $price")),
              ),
            ),
            title: Text("$title"),
            subtitle: Text("Total \$ ${(quantity * price)}"),
            trailing: Text("$quantity *"),
          ),
        ),
      ),
    );
  }
}
