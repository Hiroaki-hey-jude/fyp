import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class PostCard extends StatelessWidget {
  PostCard({
    super.key,
    required this.profilePic,
  });
  final String profilePic;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(profilePic),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
