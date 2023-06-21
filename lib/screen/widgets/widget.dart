import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp/screen/login_screen.dart';

import '../../firebase/auth.dart';
import '../../shared/constant.dart';

const sellTextInputDecoration = InputDecoration(
  // cursorColor: Colors.black,
  labelStyle:
      TextStyle(color: Constant.blackColor, fontWeight: FontWeight.w300),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: Constant.blackColor, width: 1),
  ),
  // enabledBorder: OutlineInputBorder(
  //   borderSide: BorderSide(color: Constant.blackColor, width: 1),
  // ),
);

void nextScreen(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextScreenReplacement(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

class GreyDescription extends StatelessWidget {
  const GreyDescription({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 0),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: Color.fromARGB(255, 79, 77, 77),
        ),
      ),
    );
  }
}

Widget textUserName(String uid) {
  return Container(
    child: StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('users').doc(uid).snapshots(),
      builder: (context, snapshot) {
        return Text(
          snapshot.data!.get('name'),
        );
      },
    ),
  );
}

Widget profilePicturesWidget(String id) {
  return SizedBox(
    height: 50,
    width: 50,
    child: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('users').doc(id).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          String originalImgURL =
              snapshot.data!.get('profilePic') as String != ''
                  ? snapshot.data!.get('profilePic') as String
                  : Constant.anonymousProfilePic;
          return CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(originalImgURL),
          );
        }),
  );
}

Widget cropPicturesWidget(String id) {
  return SizedBox(
    height: 50,
    width: 50,
    child: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('crops').doc(id).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          String originalImgURL =
              snapshot.data!.get('picsOfCrops')[0] as String != ''
                  ? snapshot.data!.get('picsOfCrops')[0] as String
                  : Constant.anonymousProfilePic;
          return CircleAvatar(
            radius: 5,
            backgroundImage: NetworkImage(originalImgURL),
          );
        }),
  );
}

Widget cropPTitleWidget(String id) {
  return StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection('crops').doc(id).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        String name = snapshot.data!.get('name');
        return Text(name);
      });
}

Widget profilePicturesAndUserNameWidget(String id) {
  return Container(
    color: Colors.white,
    height: 50,
    width: double.infinity,
    child: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('users').doc(id).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          String originalImgURL =
              snapshot.data!.get('profilePic') as String != ''
                  ? snapshot.data!.get('profilePic') as String
                  : Constant.anonymousProfilePic;
          return Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(originalImgURL),
              ),
              const SizedBox(width: 3),
              Text(snapshot.data!.get('name'))
            ],
          );
        }),
  );
}

popupForLogout(context) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return StatefulBuilder(builder: (context, setState) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          backgroundColor: Colors.amber.withOpacity(0.5),
          title: const Text(
            'ログアウトする',
            textAlign: TextAlign.left,
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                await Auth().signOut();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 79, 121, 193),
              ),
              child: const Text('ログアウト'),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 79, 121, 193),
                ),
                child: const Text('キャンセル'),
              ),
            ),
          ],
        );
      });
    },
  );
}
