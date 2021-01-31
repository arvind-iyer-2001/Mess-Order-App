import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart' as fonts;

import './UI/screens/cart_screen.dart';
import './UI/screens/products_overview_screen.dart';
import './UI/screens/product_detail_screen.dart';
import 'providers/food_items.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './UI/screens/orders_screen.dart';
import './UI/screens/user_products_screen.dart';
import './UI/screens/edit_product_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: FoodItems(),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProvider.value(
          value: Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.purple[100],
          textTheme: fonts.GoogleFonts.blackAndWhitePictureTextTheme(),
          accentTextTheme: fonts.GoogleFonts.cookieTextTheme(),
        ),
        home: ProductsOverviewScreen(),
        debugShowCheckedModeBanner: false,
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
          EditProductScreen.routeName: (ctx) => EditProductScreen(),
        },
      ),
    );
  }
}
