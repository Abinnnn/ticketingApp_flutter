import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';

import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class AppColumnLayout extends StatelessWidget {
  final String firstText;
  final String secondText;
  const AppColumnLayout(
      {Key? key, required this.firstText, required this.secondText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Flutter 08",
          style: Styles.headLineStyle3,
        ),
        Gap(AppLayout.getHeight(5)),
        Text(
          "Passangers",
          style: Styles.headLineStyle3,
        ),
      ],
    );
  }
}
