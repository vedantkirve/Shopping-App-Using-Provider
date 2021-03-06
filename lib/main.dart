import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/Provider/cart.dart';
import 'package:shop_app_provider/Provider/products.dart';
import 'package:shop_app_provider/screens/cart_screen.dart';
import 'package:shop_app_provider/screens/edit_product_screen.dart';
import 'package:shop_app_provider/screens/orders_screen.dart';

import 'package:shop_app_provider/screens/product_detail_screen.dart';
import 'package:shop_app_provider/screens/products_overview_screen.dart';
import 'package:shop_app_provider/screens/user_products_screen.dart';
import './screens/orders_screen.dart';
import './Provider/orders.dart';

void main() {
  runApp(MyApp());
}
//module 9 done

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
          UserProductScreen.routeaName: (context) => UserProductScreen(),
          EditProductScreen.routeName: (context) => EditProductScreen()
        },
      ),
    );
  }
}
