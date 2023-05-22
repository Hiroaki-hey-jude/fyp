import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/screen/comment_screen.dart';
import 'package:fyp/screen/purchase_procedure_screen.dart';
import 'package:fyp/screen/seller_profile_screen.dart';
import 'package:fyp/screen/widgets/custome_button.dart';
import 'package:fyp/screen/widgets/widget.dart';
import 'package:fyp/state/buy_state.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class BuyScreen extends ConsumerWidget {
  const BuyScreen({
    super.key,
    required this.cropId,
  });
  final String cropId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    final blockSizeVertical = screenHeight / 100;
    final state = ref.watch(buyStateProvider(cropId));
    final notifier = ref.watch(buyStateProvider(cropId).notifier);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.amber,
          ),
        ),
        body: GestureDetector(
          onTap: () {
            primaryFocus?.unfocus();
          },
          child: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(state.bigPicture),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          smallPictures(
                            state: state,
                            number: 0,
                            onPressed: () {
                              notifier.changeBigPicture(0);
                            },
                          ),
                          const SizedBox(width: 10),
                          state.isPictureTwoVisible == true
                              ? smallPictures(
                                  state: state,
                                  number: 1,
                                  onPressed: () {
                                    notifier.changeBigPicture(1);
                                  },
                                )
                              : Container(),
                          const SizedBox(width: 10),
                          state.isPictureThreeVisible == true
                              ? smallPictures(
                                  state: state,
                                  number: 2,
                                  onPressed: () {
                                    notifier.changeBigPicture(2);
                                  },
                                )
                              : Container(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Text(
                          state.cropModel!.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Text(
                          '¥${state.cropModel!.price}',
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 15),
                        child: OutlinedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return SizedBox(
                                  // 90%の高さで表示させる
                                  height: blockSizeVertical * 95,
                                  child: CommentScreen(
                                    cropId: state.cropModel!.cropId,
                                    sellerName: state.cropModel!.sellerId,
                                  ),
                                );
                              },
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 205, 201, 201),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.middle,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 5),
                                    child: Icon(
                                      Icons.comment,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: 'コメント',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromARGB(255, 216, 214, 214),
                        width: double.infinity,
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 13),
                              child: Text(
                                '商品の説明',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: Text(state.cropModel!.description),
                      ),
                      Container(
                        color: const Color.fromARGB(255, 216, 214, 214),
                        width: double.infinity,
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 13),
                              child: Text(
                                '商品の情報',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 5, right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'カテゴリー',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(state.cropModel!.category),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 5, right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '発送元の地域',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(state.cropModel!.address),
                          ],
                        ),
                      ),
                      Container(
                        color: const Color.fromARGB(255, 216, 214, 214),
                        width: double.infinity,
                        height: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 13,
                              ),
                              child: Text(
                                '出品者',
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 5, right: 50),
                        child: InkWell(
                          onTap: () {
                            nextScreen(context, SellerProfileScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              profilePicturesWidget(state.userModel?.uid ?? ''),
                              Text(
                                state.userModel!.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        color: const Color.fromARGB(255, 216, 214, 214),
                      ),
                      // Text(state.userModel!.name),
                    ],
                  ),
                ),
        ),
        bottomNavigationBar: state.visitorUid != (state.userModel?.uid ?? '')
            ? CustomButton(
                onPressed: () async {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return SizedBox(
                          // 90%の高さで表示させる
                          height: blockSizeVertical * 95,
                          child: PurchaseProcedureScreen(cropId: cropId));
                    },
                  );
                },
                label: 'Buy Now')
            : CustomButton(onPressed: () {}, label: "Good luck"));
  }
}

// ignore: camel_case_types
class smallPictures extends StatelessWidget {
  const smallPictures({
    super.key,
    required this.state,
    required this.number,
    required this.onPressed,
  });

  final BuyState state;
  final int number;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(state.cropModel!.picsOfCrops![number]),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
