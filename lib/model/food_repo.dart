import 'food.dart';

class FoodRepository {
  static List<Food> loadFoods(Category category, int season) {
    final allFoods = <Food>[
      Food(Category.vegetable, 0, '枝豆', [7, 8]),
      Food(Category.vegetable, 1, 'かぶ', [11, 12, 1, 2, 3]),
      Food(Category.vegetable, 2, 'かぼちゃ', [5, 6, 7, 8, 9]),
      Food(Category.vegetable, 3, '春菊', [11, 12, 1, 2, 3]),
      Food(Category.vegetable, 4, 'にら', [3, 4, 5, 6, 7, 8, 9]),
      Food(Category.mushroom, 5, '椎茸', [3, 4, 5, 9, 10, 11]),
      Food(Category.mushroom, 6, 'しめじ', [9, 10, 11]),
      Food(Category.mushroom, 7, 'まいたけ', [9, 10, 11]),
      Food(Category.mushroom, 8, 'マッシュルーム', [3, 4, 5, 6, 11, 12]),
      Food(Category.mushroom, 9, '松茸', [9, 10, 11]),
      Food(Category.fish, 10, 'あじ', [6, 7, 8]),
      Food(Category.fish, 11, 'うなぎ', [7, 8, 9]),
      Food(Category.fish, 12, 'カジキ', [6, 7, 8]),
      Food(Category.fish, 13, 'カツオ', [5, 6, 9, 10]),
      Food(Category.fish, 14, 'かれい', [4, 5, 6]),
    ];

    if (category == Category.all) {
      return searchSeason(allFoods, season);
    } else {
      var categoriseFoods =
          allFoods.where((Food f) => f.category == category).toList();
      return searchSeason(categoriseFoods, season);
    }
  }
}

List<Food> searchSeason(List<Food> foods, int season) {
  List<Food> searchedFoods = [];

  for (var food in foods) {
    var seasonList = food.season;
    if (seasonList.any((int s) => s == season)) {
      searchedFoods.add(food);
    }
  }

  return searchedFoods;
}

// import 'product.dart';
//
// class ProductsRepository {
//   static List<Product> loadProducts(Category category) {
//     const allProducts = <Product> [
//       Product(
//         category: Category.accessories,
//         id: 0,
//         isFeatured: true,
//         name: 'Vagabond sack',
//         price: 120,
//     ];
//     if (category == Category.all) {
//       return allProducts;
//     } else {
//       return allProducts.where((Product p) {
//         return p.category == category;
//       }).toList();
//     }
//   }
// }
