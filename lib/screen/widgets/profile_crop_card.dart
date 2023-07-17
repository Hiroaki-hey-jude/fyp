import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileCropCard extends StatelessWidget {
  const ProfileCropCard({
    super.key,
    required this.profilePic,
    required this.nameOfCrop,
    required this.price,
    required this.index,
    required this.hasUnread,
  });
  final String profilePic;
  final String nameOfCrop;
  final String price;
  final int index;
  final bool hasUnread;
  @override
  Widget build(BuildContext context) {
    print('$index これ何これ何あいあf $nameOfCrop');
    print('${FirebaseAuth.instance.currentUser!.uid} sellerId');
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('crops')
            .where('sellerId',
                isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .where('isbought', isEqualTo: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // データが存在する場合の処理
            // snapshot.data の使用
            if (index >= 0 && index < snapshot.data!.docs.length) {
              return Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  color: snapshot.data!.docs[index]['hasUnread'] == true
                      ? Colors.red
                      : Colors.white,
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
                          child: snapshot.data!.docs[index]['hasUnread']
                              ? const Text('未読コメントあり')
                              : Container(),
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
              );
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        });
  }
}
