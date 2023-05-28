import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fyp/model/pass_model/pass_model.dart';
import 'package:fyp/screen/widgets/widget.dart';

import '../buy_screen.dart';

class CropCard extends StatelessWidget {
  const CropCard({
    super.key,
    required this.profilePic,
    required this.nameOfCrop,
    required this.price,
    required this.passes,
    required this.farmerUid,
    required this.cropId,
  });
  final String profilePic;
  final String nameOfCrop;
  final String price;
  final List<PassModel> passes;
  final String farmerUid;
  final String cropId;
  @override
  Widget build(BuildContext context) {
    bool isDiscounted = false;
    double discountedPrice = 0;
    DateTime currentDate = DateTime.now();
    for (int i = 0; i < passes.length; i++) {
      if (farmerUid == passes[i].farmerUid) {
        print('いい感じ！');
        if (currentDate.isBefore(passes[i].expirationDate!)) {
          isDiscounted = true;
          discountedPrice = int.parse(price) * 0.85;
        }
      } else {
        print('だめです');
      }
    }
    return InkWell(
      onTap: () {
        nextScreen(
          context,
          BuyScreen(
            cropId: cropId,
            isDiscounted: isDiscounted,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: isDiscounted == true
                        ? const Text(
                            '-15%',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Container()),
              ],
            ),
            Container(
              // color: Colors.amber,
              height: 80,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(profilePic),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.only(bottom: 5, top: 5),
                alignment: Alignment.centerLeft,
                child: Text(
                  nameOfCrop,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                alignment: Alignment.centerLeft,
                child: isDiscounted
                    ? Text(
                        '${discountedPrice.toInt()} Coins',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        '$price Coins',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
