import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_studio/core/colors.dart';
import 'package:job_studio/screen/seeker%20side/explore/controller/get_uploaded_provider.dart';
import 'package:job_studio/screen/seeker%20side/explore/model/get_uploaded_model.dart';
import 'package:job_studio/screen/seeker%20side/explore/service/delete_uploeded.dart';
import 'package:job_studio/screen/seeker%20side/explore/service/like_post_service.dart';
import 'package:job_studio/screen/seeker%20side/explore/view/post_screen.dart';
import 'package:job_studio/screen/seeker%20side/explore/view/widget/explore_shimmer.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:shimmer/shimmer.dart';
import 'comment_box.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<GetUploadedServiceProvider>(context, listen: false)
          .fetchUploadedData();
    });
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Explore",
              style: TextStyle(color: kBlackColor),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100]),
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PostScreen(),
                    ));
                  },
                  child: const Text("Post")),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: kWhiteColor,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Consumer<GetUploadedServiceProvider>(
            builder: (context, upload, child) => Expanded(
              child: upload.uploadedData == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : upload.isLoading
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: const Color.fromARGB(255, 190, 188, 188),
                          child: SingleChildScrollView(
                            child: Column(
                              children: const [
                                SizedBox(height: 10,),
                                ExploreShimmer(),
                                ExploreShimmer(),
                                ExploreShimmer(),
                                ExploreShimmer(),
                              ],
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            final GetUploadedModel data =
                                upload.uploadedData![index];
                            log(data.toString());
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Column(
                                  children: [
                                    ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              data.user.profile.profileImage),
                                        ),
                                        title: Text(data.user.username),
                                        subtitle: Text(
                                            DateFormat("MMMM d, y h:mm a")
                                                .format(data.createdAt)),
                                        trailing: data.user.username !=
                                                data.user.username
                                            ? const SizedBox()
                                            : PopupMenuButton(
                                                itemBuilder: (context) {
                                                  return [
                                                    const PopupMenuItem(
                                                      value: "Delete",
                                                      child: Text("Delete"),
                                                    ),
                                                  ];
                                                },
                                                onSelected: (value) {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                      title:
                                                          const Text("Alert"),
                                                      content: const Text(
                                                          "Are you want to delete this post ?"),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: const Text(
                                                                "No")),
                                                        TextButton(
                                                            onPressed:
                                                                () async {
                                                              await DeleteUploadedService()
                                                                  .deleteUploaded(
                                                                      data.id);
                                                              if (context
                                                                  .mounted) {
                                                                Navigator.pop(
                                                                    context);
                                                              }
                                                              upload
                                                                  .fetchUploadedData();
                                                            },
                                                            child: const Text(
                                                                "Yes"))
                                                      ],
                                                    ),
                                                  );
                                                },
                                              )),
                                    Image.network(data.image),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: Row(
                                        children: [
                                          LikeButton(
                                            isLiked: upload.isLiked,
                                            likeCount: data.likes.length,
                                            likeBuilder: (isLiked) => Icon(
                                              Icons.thumb_up_alt_outlined,
                                              color:
                                                  isLiked ? themeColor : null,
                                            ),
                                            onTap: (isLiked) async {
                                              upload.isLiked = !isLiked;
                                              upload.likedCount +=
                                                  upload.isLiked ? 1 : -1;

                                              upload.isLiked
                                                  ? await LikePostService()
                                                      .postLikeService(data.id)
                                                  : await LikePostService()
                                                      .dislikePostService(
                                                          data.id);
                                              return !isLiked;
                                            },
                                            size: 26,
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .push(MaterialPageRoute(
                                                  builder: (context) =>
                                                      CommentBox(
                                                          indexes: index),
                                                ));
                                              },
                                              icon: const Icon(
                                                Icons.comment,
                                                color: kGreyColor,
                                              )),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ReadMoreText(
                                        data.description,
                                        trimLines: 2,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: "...read more",
                                        colorClickableText:
                                            const Color.fromARGB(
                                                255, 10, 107, 187),
                                        trimExpandedText: ' show less',
                                        textAlign: TextAlign.justify,
                                        moreStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: themeColor),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: upload.uploadedData!.length,
                        ),
            ),
          )
        ],
      )),
    );
  }
}
