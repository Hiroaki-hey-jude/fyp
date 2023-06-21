import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fyp/screen/create_post.dart';
import 'package:fyp/screen/widgets/post_card_feed.dart';
import 'package:fyp/state/feed_state.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    final blockSizeVertical = screenHeight / 100;
    final notifier = ref.watch(feedStateProvider.notifier);
    final state = ref.watch(feedStateProvider);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: const Icon(
          Icons.add,
        ),
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
                child: const CreatePostScreen(),
              );
            },
          );
        },
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          notifier.getAgriculturalPostList();
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              MasonryGridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 1,
                itemCount: state.listOfPost.length,
                itemBuilder: (context, index) {
                  final postModel = state.listOfPost[index];
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: PostCardFeed(
                        postModel: postModel,
                        isDiscounted: false,
                      ),
                    ),
                  );
                },
              ),
              // GridView.builder(
              //   physics: const NeverScrollableScrollPhysics(),
              //   scrollDirection: Axis.vertical,
              //   shrinkWrap: true,
              //   itemCount: state.listOfPost.length,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 1, //ボックスを横に並べる数
              //     // childAspectRatio: 0.8,
              //   ),
              //   itemBuilder: (context, index) {
              //     final postModel = state.listOfPost[index];
              //     return InkWell(
              //       onTap: () {},
              //       child: LayoutBuilder(builder:
              //           (BuildContext context, BoxConstraints constraints) {
              //         return Container(
              //           height: 220,
              //           child: Padding(
              //             padding: const EdgeInsets.all(3.0),
              //             child: PostCardFeed(
              //               postModel: postModel,
              //             ),
              //           ),
              //         );
              //       }),
              //     );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
