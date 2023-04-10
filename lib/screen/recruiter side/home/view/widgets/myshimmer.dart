import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmer extends StatelessWidget {
  const MyShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromARGB(255, 161, 160, 160),
      highlightColor: const Color.fromARGB(255, 125, 125, 125),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
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
                  Column(
                    children: [
                      Card(
                        child: Shimmer.fromColors(
                          baseColor: const Color.fromARGB(31, 255, 253, 253),
                          highlightColor: Colors.grey,
                          child: const SizedBox(
                            width: 200,
                            height: 20.0,
                          ),
                        ),
                      ),
                      Card(
                        child: Shimmer.fromColors(
                          baseColor: const Color.fromARGB(31, 224, 224, 224),
                          highlightColor: Colors.grey,
                          child: const SizedBox(
                            width: 200.0,
                            height: 17.0,
                          ),
                        ),
                      ),
                      Card(
                        child: Shimmer.fromColors(
                          baseColor: const Color.fromARGB(31, 209, 209, 209),
                          highlightColor: Colors.grey,
                          child: const SizedBox(
                            width: 200.0,
                            height: 15.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    child: Shimmer.fromColors(
                      baseColor: const Color.fromARGB(31, 207, 207, 207),
                      highlightColor: Colors.grey,
                      child: const SizedBox(
                        width: 100.0,
                        height: 25.0,
                      ),
                    ),
                  ),
                  Card(
                    child: Shimmer.fromColors(
                      baseColor: const Color.fromARGB(31, 180, 180, 180),
                      highlightColor: Colors.grey,
                      child: const SizedBox(
                        width: 100.0,
                        height: 25.0,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
