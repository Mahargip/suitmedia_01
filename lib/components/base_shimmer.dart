
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserShimmerItem extends StatelessWidget {
  const UserShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
        ),
        title: Container(
          height: 12,
          width: double.infinity,
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 6),
        ),
        subtitle: Container(
          height: 10,
          width: 150,
          color: Colors.white,
        ),
      ),
    );
  }
}
