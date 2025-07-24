import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:task_app/core/constants.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key, required this.body});
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(20, -1.2),
              child: Container(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kTertiaryColor,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-2.7, -1.2),
              child: Container(
                height: MediaQuery.of(context).size.width / 1.3,
                width: MediaQuery.of(context).size.width / 1.3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kSecondryColor,
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(2.7, -1.2),
              child: Container(
                height: MediaQuery.of(context).size.width / 1.3,
                width: MediaQuery.of(context).size.width / 1.3,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor,
                ),
              ),
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 180),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.8,
                  child: body,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
