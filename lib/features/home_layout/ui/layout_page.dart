import 'package:currency_app/features/home_layout/ui/navigation_tabs/exchange.dart';
import 'package:currency_app/features/home_layout/ui/navigation_tabs/home.dart';
import 'package:currency_app/features/home_layout/ui/navigation_tabs/more.dart';
import 'package:currency_app/features/home_layout/ui/navigation_tabs/transaction.dart';
import 'package:currency_app/theme/styles/colors.dart';
import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  List<Widget> navigationTabs = [
    HomePage(),
    ExchangePage(),
    TransactionPage(),
    MorePage()
  ];

  List<Map> navigationTools = [
    {"title":"Home", "Icon": Icon(Icons.add_home)},
    {"title":"Exchange", "Icon": Icon(Icons.add_home)},
    {"title":"Transaction", "Icon": Icon(Icons.add_home)},
    {"title":"More", "Icon": Icon(Icons.add_home)},
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: navigationTabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorManger.primary,
          currentIndex: currentIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,


          onTap: (value){
            setState(() {
              currentIndex = value;
            });
          },
          items: navigationTools.map((e) => BottomNavigationBarItem(
            icon: e["Icon"],
            label: e["title"],
            backgroundColor: ColorManger.blackColor2,
          )).toList(),
        ),
      ),
    );
  }
}
