import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/screen/buy_screen.dart';
import 'package:fyp/screen/edit_crop_screen.dart';
import 'package:fyp/screen/setting_screen.dart';
import 'package:fyp/screen/widgets/crop_cart.dart';
import 'package:fyp/screen/widgets/profile_crop_card.dart';
import 'package:fyp/screen/widgets/widget.dart';

import '../shared/constant.dart';
import '../state/profile_state.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(profileStateProvider.notifier);
    final state = ref.watch(profileStateProvider);
    return state.isLoading
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
                                backgroundImage: state.imageFile == null
                                    ? NetworkImage(state.originalImgURL)
                                        as ImageProvider
                                    : FileImage(state.imageFile!),
                              ),
                            ),
                            Positioned(
                              bottom: -5.0,
                              right: -5.0,
                              child: RawMaterialButton(
                                fillColor: Colors.green,
                                onPressed: () async {
                                  // await notifier.openImagePicker();
                                  nextScreen(context, const SettingScreen());
                                },
                                shape: const CircleBorder(),
                                child: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            )
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
                DropdownButton(
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
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: state.sellingCrops.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //ボックスを横に並べる数
                    childAspectRatio: 0.80,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        nextScreen(
                          context,
                          EditCropScreen(cropId: state.sellingCrops[index].cropId),
                        );
                        print(state.sellingCrops[index].cropId);
                      },
                      child: ProfileCropCard(
                        profilePic: state.sellingCrops[index].picsOfCrops![0],
                        nameOfCrop: state.sellingCrops[index].name,
                        price: state.sellingCrops[index].price,
                      ),
                    );
                  },
                )
                // Text(state.sellingCrops)
              ],
            ),
          );
  }
}
