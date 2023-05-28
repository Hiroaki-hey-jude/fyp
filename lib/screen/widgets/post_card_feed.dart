import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fyp/model/post_model/post_model.dart';
import 'package:fyp/screen/seller_profile_screen.dart';
import 'package:fyp/screen/widgets/widget.dart';

class PostCardFeed extends StatelessWidget {
  final PostModel postModel;

  PostCardFeed({Key? key, required this.postModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 3),
            InkWell(
              onTap: () {
                if (postModel.posterId ==
                    FirebaseAuth.instance.currentUser!.uid) {
                  return;
                }
                nextScreen(
                    context,
                    SellerProfileScreen(
                      sellerUid: postModel.posterId,
                    ));
              },
              child: profilePicturesAndUserNameWidget(postModel.posterId),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(postModel.picsOfCrops[0]),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              child: Text(postModel.sentenceOfPost),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
