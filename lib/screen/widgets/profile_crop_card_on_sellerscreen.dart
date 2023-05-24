import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProfileCropCardOnSellerScreen extends StatelessWidget {
  const ProfileCropCardOnSellerScreen({
    super.key,
    required this.profilePic,
    required this.nameOfCrop,
    required this.price,
  });
  final String profilePic;
  final String nameOfCrop;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Container(
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
              ),
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
              child: Text(
                '￥$price',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
