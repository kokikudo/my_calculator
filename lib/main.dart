import 'package:flutter/material.dart';
import 'package:my_calculator/screen/home.dart';
import 'package:provider/provider.dart';
import 'calculator_brain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalculatorBrain(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: HomeScreen(),
      ),
    );
  }
}

// final ThemeData _kAppTheme = _buildAppTheme();
//
// ThemeData _buildAppTheme() {
//   final ThemeData base = ThemeData.light();
//   return base.copyWith(
//       colorScheme: base.colorScheme.copyWith(
//         primary: kPrimaryColor,
//         onPrimary: kOnPrimaryColor,
//         secondary: kOnPrimaryColor,
//       ),
//       appBarTheme: base.appBarTheme.copyWith(
//         backwardsCompatibility: false,
//       ));
// }

// class _ShrineAppState extends State<ShrineApp> {
//   Category _currentCategory = Category.all;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Shrine',
//       home: Backdrop(
//         currentCategory: _currentCategory,
//         frontLayer: HomePage(category: _currentCategory),
//         backLayer: CategoryMenuPage(
//           currentCategory: _currentCategory,
//           onCategoryTap: _onCategoryTap,
//         ),
//         frontTitle: Text('SHRINE'),
//         backTitle: Text('MENU'),
//       ),
//       initialRoute: '/login',
//       onGenerateRoute: _getRoute,
//       theme: _kShrineTheme,
//     );
//   }
//
//   /// Function to call when a [Category] is tapped.
//   void _onCategoryTap(Category category) {
//     setState(() {
//       _currentCategory = category;
//     });
//   }
// }
//
// Route<dynamic>? _getRoute(RouteSettings settings) {
//   if (settings.name != '/login') {
//     return null;
//   }
//
//   return MaterialPageRoute<void>(
//     settings: settings,
//     builder: (BuildContext context) => LoginPage(),
//     fullscreenDialog: true,
//   );
// }
//
// final ThemeData _kShrineTheme = _buildShrineTheme();
//
// IconThemeData _customIconTheme(IconThemeData original) {
//   return original.copyWith(color: kShrineBrown900);
// }
//
// // テーマをここで一気に定義
// ThemeData _buildShrineTheme() {
//   // ライトテーマをコピーし上書きしたテーマを返す
//   final ThemeData base = ThemeData.light();
//   return base.copyWith(
//     // colorScheme; マテリアルデザインの仕様に適合したカラーの集まり
//     colorScheme: base.colorScheme.copyWith(
//       primary: kShrinePink100,
//       primaryVariant: kShrineBrown900,
//       onPrimary: kShrineBrown900,
//       secondary: kShrineBrown900,
//       error: kShrineErrorRed,
//     ),
//     // AppBarの子Widgetのテーマの状態を保持しないようにする。
//     // trueにするとデフォルトのAppBarの状態になる。
//     appBarTheme: base.appBarTheme.copyWith(
//       backwardsCompatibility: false,
//     ),
//     // 関数_buildShrineTextThemeにtextThemeを渡してアプリで使うテキストを更新
//     textTheme: _buildShrineTextTheme(base.textTheme),
//     primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
//     textSelectionTheme: TextSelectionThemeData(
//       selectionColor: kShrinePink100,
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//       focusedBorder: CutCornersBorder(
//         borderSide: BorderSide(
//           width: 2.0,
//           color: kShrineBrown900,
//         ),
//       ),
//       border: CutCornersBorder(), // デフォルトで用意されてたクラス。四隅の角を直線上に切り取る
//     ),
//   );
// }
//
// //　見出しや本文などを変更
// TextTheme _buildShrineTextTheme(TextTheme base) {
//   return base
//       .copyWith(
//     headline5: base.headline5!.copyWith(
//       fontWeight: FontWeight.w500,
//     ),
//     headline6: base.headline6!.copyWith(fontSize: 18.0),
//     caption: base.caption!.copyWith(
//       fontWeight: FontWeight.w400,
//       fontSize: 14.0,
//     ),
//     bodyText1: base.bodyText1!.copyWith(
//       fontWeight: FontWeight.w500,
//       fontSize: 16.0,
//     ),
//   )
//   // 変更した箇所のみにフォントを適用する
//       .apply(
//     fontFamily: 'Rubik',
//     displayColor: kShrineBrown900, // headline1~4,captionが対象
//     bodyColor: kShrineBrown900, // それ以外のテキストが対象
//   );
// }
