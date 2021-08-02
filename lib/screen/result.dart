import 'package:flutter/material.dart';
import 'package:my_calculator/calculator_brain.dart';
import 'package:my_calculator/model/food.dart';
import 'package:provider/provider.dart';
import 'package:my_calculator/constaints.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorBrain>(builder: (_, brain, child) {
      List<Food> _foods = brain.getFoods();

      return Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            '${brain.choiceSeason}月が旬の${brain.getResultTitle}',
            style: const TextStyle(color: Colors.black, fontSize: 24.0),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: kPrimaryColor),
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 10.0,
            children: _foods.map((food) {
              return GridTile(
                assetPath: food.assetPath,
                text: food.name,
              );
            }).toList(),
          ),
        ),
      );
    });
  }
}

class GridTile extends StatelessWidget {
  const GridTile({Key? key, required this.assetPath, required this.text})
      : super(key: key);

  final String assetPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              assetPath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            text,
            style: kGridTileTextStyle,
          ),
        ],
      ),
    );
  }
}
