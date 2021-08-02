import 'package:flutter/material.dart';
import 'model/food_repo.dart';
import 'model/food.dart';

class CalculatorBrain extends ChangeNotifier {
  int _season = 1;
  Category _selectCategory = Category.all;
  String _resultTitleFoodText = '';

  int get choiceSeason => _season;

  void updateSeason(int value) {
    _season = value;
    notifyListeners();
  }

  Category get selectedCategory => _selectCategory;

  void updateCategory(Category select) {
    _selectCategory = select;
    notifyListeners();
  }

  List<Food> getFoods() {
    return FoodRepository.loadFoods(_selectCategory, _season);
  }

  void setResultTitle() {
    switch (_selectCategory) {
      case Category.all:
        _resultTitleFoodText = '食材';
        break;
      case Category.vegetable:
        _resultTitleFoodText = '野菜';
        break;
      case Category.mushroom:
        _resultTitleFoodText = 'きのこ';
        break;
      case Category.fish:
        _resultTitleFoodText = 'サカナ';
        break;
    }
  }

  String get getResultTitle => _resultTitleFoodText;
}
