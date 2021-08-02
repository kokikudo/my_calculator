import 'package:flutter/material.dart';
import 'package:my_calculator/constaints.dart';
import 'package:my_calculator/screen/result.dart';
import 'package:provider/provider.dart';
import 'package:my_calculator/calculator_brain.dart';
import 'package:my_calculator/model/food.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorBrain>(builder: (_, brain, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            '旬の食材を探す',
            style: TextStyle(color: Colors.black, fontSize: 24.0),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${brain.choiceSeason}',
                        style: kSeasonNumberTextStyle,
                      ),
                      const Text(
                        '月',
                        style: kSeasonBodyTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: kPrimaryColor,
                          inactiveTrackColor: Colors.grey.shade100,
                          trackHeight: 10.0,
                          thumbColor: kOnPrimaryColor,
                          overlayColor: const Color.fromARGB(50, 23, 42, 232),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30.0)),
                      child: Slider(
                        value: brain.choiceSeason.toDouble(),
                        min: 1,
                        max: 12,
                        onChanged: (value) {
                          brain.updateSeason(value.toInt());
                        },
                      )),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  children: [
                    GridTile(
                      color: brain.selectedCategory == Category.all
                          ? kAllColor
                          : kAllColorSelect,
                      imagePath: 'image/all.png',
                      text: 'すべて',
                      onTap: brain.updateCategory,
                      select: Category.all,
                    ),
                    GridTile(
                      color: brain.selectedCategory == Category.vegetable
                          ? kVegetableColor
                          : kVegetableColorSelect,
                      imagePath: 'image/vegetable.png',
                      text: 'やさい',
                      onTap: brain.updateCategory,
                      select: Category.vegetable,
                    ),
                    GridTile(
                      color: brain.selectedCategory == Category.mushroom
                          ? kMushroomColor
                          : kMushroomColorSelect,
                      imagePath: 'image/mushroom.png',
                      text: 'きのこ',
                      onTap: brain.updateCategory,
                      select: Category.mushroom,
                    ),
                    GridTile(
                      color: brain.selectedCategory == Category.fish
                          ? kFishColor
                          : kFishColorSelect,
                      imagePath: 'image/fish.png',
                      text: 'サカナ',
                      onTap: brain.updateCategory,
                      select: Category.fish,
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                child: const Text('検索'),
                onPressed: () {
                  brain.setResultTitle();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResultScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  textStyle: kSearchButtonTextStyle,
                  primary: kPrimaryColor,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  minimumSize: const Size(100, 100),
                )),
          ],
        ),
      );
    });
  }
}

class GridTile extends StatelessWidget {
  const GridTile({
    Key? key,
    required this.color,
    required this.imagePath,
    required this.text,
    required this.onTap,
    required this.select,
  }) : super(key: key);

  final Color color;
  final String imagePath;
  final String text;
  final Function onTap;
  final Category select;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(select),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              text,
              style: kGridTileTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class GridTile2 extends StatelessWidget {
  const GridTile2({
    Key? key,
    required this.color,
    required this.imagePath,
    required this.text,
    required this.onTap,
    required this.select,
  }) : super(key: key);

  final Color color;
  final String imagePath;
  final String text;
  final Function onTap;
  final Category select;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(select),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              text,
              style: kGridTileTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
