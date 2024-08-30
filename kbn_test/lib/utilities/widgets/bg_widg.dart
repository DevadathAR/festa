import 'package:flutter/material.dart';

Widget BgWIdget() {
  return Container(
    color: const Color.fromRGBO(217, 217, 217, 1),
    child: Align(alignment: Alignment.centerRight, child: Padding(
      padding: const EdgeInsets.only(top: 30.0,right: 30),
      child: const Image(image:  AssetImage("assets/bg.png")),
    )),
  );
}
