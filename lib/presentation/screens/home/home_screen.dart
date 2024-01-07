import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/config/menu/app_menu_bottom.dart';
import 'package:rick_and_morty/presentation/providers/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appMenu = AppMenuBottom();
    final provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: appMenu.getWidgetBodyIndex(provider.currentIndex),
      bottomNavigationBar: appMenu.getNavigationBar(
          currentIndex: provider.currentIndex,
          onTap: (index) => provider.currentIndex = index),
    );
  }
}
