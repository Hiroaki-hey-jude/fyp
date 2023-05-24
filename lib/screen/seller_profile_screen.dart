import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fyp/model/category_model/category_model.dart';
import 'package:fyp/screen/buy_screen.dart';
import 'package:fyp/screen/crop_screen.dart';
import 'package:fyp/screen/feed_screen.dart';
import 'package:fyp/screen/profile_screen.dart';
import 'package:fyp/screen/sell_screen.dart';
import 'package:fyp/screen/widgets/categories.dart';
import 'package:fyp/screen/widgets/profile_crop_card.dart';
import 'package:fyp/screen/widgets/profile_crop_card_on_sellerscreen.dart';
import 'package:fyp/screen/widgets/widget.dart';
import 'package:fyp/state/home_state.dart';
import 'package:fyp/state/sellerprofile_state.dart';

class SellerProfileScreen extends ConsumerWidget {
  SellerProfileScreen({super.key});

  final TextEditingController searchEditingController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sellerprofileStateProvider);
    final notifier = ref.watch(sellerprofileStateProvider.notifier);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Direct',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(0, 0, 0, 1),
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.amber,
          ),
        ),
        body: state.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 150,
                                  child: CircleAvatar(
                                    radius: 120,
                                    backgroundImage:
                                        NetworkImage(state.originalImgURL)
                                            as ImageProvider,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        state.userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            'Subscribe',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          onPressed: () {},
                          child: Text(
                            'Favourite',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      width: double.infinity,
                      color: const Color.fromARGB(255, 216, 214, 214),
                      child: DropdownButton(
                        value: '販売',
                        items: const [
                          DropdownMenuItem(
                            value: '販売',
                            child: Text('販売'),
                          ),
                          DropdownMenuItem(
                            value: '投稿',
                            child: Text('投稿'),
                          ),
                        ],
                        onChanged: (String? value) {},
                      ),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.sellingCrops.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, //ボックスを横に並べる数
                        childAspectRatio: 0.80,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            nextScreen(
                              context,
                              BuyScreen(
                                  cropId: state.sellingCrops[index].cropId),
                            );
                            print(state.sellingCrops[index].cropId);
                          },
                          child: ProfileCropCardOnSellerScreen(
                            profilePic:
                                state.sellingCrops[index].picsOfCrops![0],
                            nameOfCrop: state.sellingCrops[index].name,
                            price: state.sellingCrops[index].price,
                          ),
                        );
                      },
                    )
                    // Text(state.sellingCrops)
                  ],
                ),
              ));
  }
}
