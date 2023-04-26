import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ExploreShimmer extends StatelessWidget {
  const ExploreShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: SizedBox(
              width: 80.0,
              child: Shimmer.fromColors(
                baseColor: const Color.fromARGB(31, 231, 231, 231),
                highlightColor: Colors.grey,
                child: const SizedBox(
                  height: 80,
                  width: 39,
                ),
              ),
            ),
          ),
          title: Card(
            child: Shimmer.fromColors(
              baseColor: const Color.fromARGB(31, 255, 253, 253),
              highlightColor: Colors.grey,
              child: const SizedBox(
                width: 200,
                height: 17.0,
              ),
            ),
          ),
          subtitle: Card(
            child: Shimmer.fromColors(
              baseColor: const Color.fromARGB(31, 255, 253, 253),
              highlightColor: Colors.grey,
              child: const SizedBox(
                width: 200,
                height: 17.0,
              ),
            ),
          ),
        ),
        Card(
          child: Shimmer.fromColors(
            baseColor: const Color.fromARGB(31, 255, 253, 253),
            highlightColor: Colors.grey,
            child: const SizedBox(
              width: 320,
              height: 150,
            ),
          ),
        ),
        Card(
          child: Shimmer.fromColors(
            baseColor: const Color.fromARGB(31, 255, 253, 253),
            highlightColor: Colors.grey,
            child: const SizedBox(
              width: 320,
              height: 17.0,
            ),
          ),
        ),
      ],
    );
  }
}
