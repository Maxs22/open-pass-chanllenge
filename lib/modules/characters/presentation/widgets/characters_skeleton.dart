import 'package:flutter/material.dart';
import 'package:open_pass_challenge/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

Widget buildSkeletonLoader() {
  return ListView.builder(
    itemCount: 12,
    itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Expanded(
              child: Shimmer.fromColors(
                baseColor:AppColors.gradenteOscuro,
                highlightColor:AppColors.gradienteClaro,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
