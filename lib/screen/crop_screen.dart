import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/firebase/auth.dart';
import 'package:fyp/screen/login_screen.dart';
import 'package:fyp/screen/widgets/categories.dart';
import 'package:fyp/screen/widgets/crop_cart.dart';

import '../model/category_model/category_model.dart';
import '../state/crop_state.dart';

class CropScreen extends ConsumerWidget {
  const CropScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchEditingController =
        TextEditingController();
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          print('kkkk');
          primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        color: Colors.grey.shade200),
                    child: Consumer(builder: (context, ref, child) {
                      // final notifier = ref.watch(searchStateProvider.notifier);
                      return TextField(
                        onSubmitted: (value) {
                          // 検索
                          // notifier.getSearchUser(searchEditingController.text);
                        },
                        controller: searchEditingController,
                        decoration: const InputDecoration(
                          hintText: '検索',
                          hintStyle: TextStyle(color: Colors.grey, height: 1.7),
                          border: InputBorder.none,
                          isDense: true,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              // const Categories(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    category_list.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 3),
                      child: CategoryCard(
                        icon: category_list[index].icon,
                        title: category_list[index].title,
                        press: () async {
                          print('hihi');
                        },
                        categoryNumber: category_list[index].categoryNumber,
                      ),
                    ),
                  ),
                ),
              ),
              CropCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends ConsumerWidget {
  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.press,
    required this.categoryNumber,
  });

  final String icon, title, categoryNumber;
  final VoidCallback press;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cropStateProvider);
    final notifier = ref.watch(cropStateProvider.notifier);
    return Container(
      width: 115,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor:
              state.selectedIndexForOutlineButton == int.parse(categoryNumber)
                  ? const Color.fromARGB(255, 179, 176, 176)
                  : Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        onPressed: () async {
          print('hhihi');
          notifier.onCategoryButtonTap(title);
          await Auth().signOut();
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Column(
            children: [
              Image.asset(
                icon,
                width: 40,
                height: 30,
              ),
              const SizedBox(height: 3),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
