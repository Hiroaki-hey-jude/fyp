import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fyp/screen/buy_screen.dart';
import 'package:fyp/screen/widgets/post_card_feed.dart';
import 'package:fyp/screen/widgets/profile_crop_card_on_sellerscreen.dart';
import 'package:fyp/screen/widgets/widget.dart';
import 'package:fyp/state/sellerprofile_state.dart';

class SellerProfileScreen extends ConsumerWidget {
  SellerProfileScreen({super.key, required this.sellerUid});
  final String sellerUid;

  final TextEditingController searchEditingController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sellerprofileStateProvider(sellerUid));
    final notifier = ref.watch(sellerprofileStateProvider(sellerUid).notifier);
    return Scaffold(
        backgroundColor: Colors.grey[300],
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
                  color: Colors.black,
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
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return StatefulBuilder(
                                    builder: (context, setState) {
                                      return AlertDialog(
                                        shape: const RoundedRectangleBorder(
                                          side: BorderSide(
                                            color: Colors.amber,
                                            width: 3,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        backgroundColor:
                                            Colors.black.withOpacity(0.5),
                                        title: const Text(
                                          'この農家のPASSを購入したら１ヶ月この農家の農作物を３０%オフで購入できます。\n1500Coins消費します',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                              notifier.buyPass(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .primaryColor),
                                            child: const Text('1500'),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                print('hihi');
                                                Navigator.of(context).pop();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .primaryColor),
                                              child: const Text('戻る'),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                });
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          child: const Text(
                            '農家PASS',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      height: 50,
                      width: MediaQuery.of(context).size.width / 4,
                      color: Color.fromARGB(255, 181, 179, 179),
                      child: DropdownButton(
                        value: state.selectedValue,
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
                        onChanged: (String? value) {
                          notifier.changeValue(value!);
                        },
                      ),
                    ),
                    const SizedBox(height: 5),
                    state.selectedValue == '販売'
                        ? GridView.builder(
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
                                    // nextScreen(
                                    //   context,
                                    //   BuyScreen(
                                    //       cropId:
                                    //           state.sellingCrops[index].cropId),
                                    // );
                                  },
                                  child: ProfileCropCardOnSellerScreen(
                                    profilePic: state
                                        .sellingCrops[index].picsOfCrops![0],
                                    nameOfCrop: state.sellingCrops[index].name,
                                    price: state.sellingCrops[index].price,
                                  ));
                            },
                          )
                        : MasonryGridView.count(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: state.postingList.length,
                            crossAxisCount: 1,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  // if (state.sellingCrops[index].hasUnread == true) {
                                  //   nextScreen(
                                  //       context,
                                  //       BuyScreen(
                                  //           cropId:
                                  //               state.sellingCrops[index].cropId));
                                  // } else {
                                  //   nextScreen(
                                  //     context,
                                  //     EditCropScreen(
                                  //         cropId: state.sellingCrops[index].cropId),
                                  //   );
                                  // }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: PostCardFeed(
                                    postModel: state.postingList[index],
                                  ),
                                ),
                              );
                            },
                          ),
                    // Text(state.sellingCrops)
                  ],
                ),
              ));
  }
}
