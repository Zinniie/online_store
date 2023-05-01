import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:online_shop/controllers/mainscreen_provider.dart';
import 'package:online_shop/views/shared/appstyle.dart';
import 'package:online_shop/views/ui/cartpage.dart';
import 'package:online_shop/views/ui/homepage.dart';
import 'package:online_shop/views/ui/product_by_cat.dart';
import 'package:online_shop/views/ui/profile.dart';
import 'package:online_shop/views/ui/searchpage.dart';
import 'package:provider/provider.dart';

import '../shared/bottom_nav.dart';
import '../shared/bottom_nav_widget.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    HomePage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    // int pageIndex = 0;
    return Consumer<MainScreenNotifier>(
        builder: (context, mainScreenNotifier, child) {
      return Scaffold(
        backgroundColor: const Color(0XFFE2E2E2),
        body: pageList[mainScreenNotifier.pageIndex],
        bottomNavigationBar: BottomNav(),
      );
    });
  }
}
