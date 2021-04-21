import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Provider/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  expanded = !expanded;
                });
              },
            ),
          ),
          if (expanded)
            Container(
              padding: EdgeInsets.only(left: 5, right: 5),
              height: min(widget.order.products.length * 20.0 + 10, 180),
              child: ListView(
                children: widget.order.products
                    .map((prod) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                prod.title,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              "${prod.quantity}x  \$${prod.price}",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
