import 'package:flutter/material.dart';

import '../Models/food_item.dart';

class FoodItems with ChangeNotifier {
  List<FoodItem> _items = [
    FoodItem(
      id: 'p1',
      title: 'Chole Bature',
      description:
          'It is a combination of chana masala and bhatura/Puri, a fried bread made from maida.',
      price: 50,
      imageUrl:
          'https://s9c2c8i7.rocketcdn.me/wp-content/uploads/2016/04/channa-bhatura-360x480.jpg',
    ),
    FoodItem(
      id: 'p2',
      title: 'Honey Chilli Potato',
      description:
          'Crispy chilli potato are a super addictive Chinese starter or snack with potatoes. Most popular Chinese snack or starter.',
      price: 59.99,
      imageUrl:
          'https://135700-392364-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2016/04/chilli-potato-recipe-1.jpg',
    ),
    FoodItem(
      id: 'p3',
      title: 'Oreo Shake',
      description:
          'With a bit of cookie crunch, rich chocolate sauce, and creamy texture, it\'s no wonder that people are so fond of this flavorful Oreo milkshake',
      price: 19.99,
      imageUrl:
          'https://1.bp.blogspot.com/-o9uIQEYo55I/VQphcYHKZ3I/AAAAAAAARbw/UX0wmqCuryo/s1600/oreo%2Bmilkshake.JPG',
    ),
  ];

  List<FoodItem> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<FoodItem> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  FoodItem findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(FoodItem product) {
    final newProduct = FoodItem(
      title: product.title,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      id: DateTime.now().toString(),
    );
    _items.add(newProduct);
    notifyListeners();
  }

  void updateProduct(String id, FoodItem newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
