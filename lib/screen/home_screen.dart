import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/model/category_model/category_model.dart';
import 'package:fyp/screen/crop_screen.dart';
import 'package:fyp/screen/feed_screen.dart';
import 'package:fyp/screen/profile_screen.dart';
import 'package:fyp/screen/sell_screen.dart';
import 'package:fyp/screen/widgets/categories.dart';
import 'package:fyp/state/home_state.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final TextEditingController searchEditingController = TextEditingController();
  static final List<Widget> _widgetOptions = <Widget>[
    const CropScreen(),
    const SellScreen(),
    const FeedScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeStateProvider);
    final notifier = ref.watch(homeStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.abc),
        title: const Text(
          'Direct',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: _widgetOptions[state.selectedIndex],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.pink,
          currentIndex: state.selectedIndex,
          onTap: notifier.onItemTapped,
          selectedItemColor: Color.fromARGB(255, 16, 155, 21),
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Crop',
              backgroundColor: Colors.amber,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_sharp),
              label: 'Sell',
              backgroundColor: Colors.amber,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.feed),
              label: 'Feed',
              backgroundColor: Colors.amber,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: '設定',
              backgroundColor: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
