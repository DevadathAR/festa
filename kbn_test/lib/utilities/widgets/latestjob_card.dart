import 'package:flutter/material.dart';
import 'package:kbn_test/utilities/colors.dart';

Widget LatestJobCard() {
  return Padding(
    padding: const EdgeInsets.only(right: 10,bottom: 20),
    child: Container(
      decoration: const BoxDecoration(boxShadow: [BoxShadow(color: black,)],
        borderRadius: BorderRadius.all(
           Radius.circular(8),
        ),
        color: white,
      ),
    ),
  );
}
