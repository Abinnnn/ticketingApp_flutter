import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:ticketing_app/utils/app_layout.dart';
import 'package:ticketing_app/widgets/thick_container.dart';

import '../utils/app_styles.dart';

class TicketView extends StatelessWidget {
  const TicketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width,
      height: 200,
      child: Container(
        margin: const EdgeInsets.only(left: 16),
        child: Column(children: [
          Container(
              decoration: BoxDecoration(
                color: Color(0xff526799),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(21),
                  topRight: Radius.circular(21),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("NYC",
                          style: Styles.headLineStyle3.copyWith(
                            color: Colors.white,
                          )),
                      Expanded(child: Container()),
                      ThickContainer(),
                      Expanded(
                          child: Stack(children: [
                        Center(
                          child: Transform.rotate(
                            angle: 1.5,
                            child:
                                Icon(Icons.local_airport, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                          child: LayoutBuilder(
                            builder: (BuildContext context,
                                BoxConstraints constraints) {
                              print(
                                  "The Width is constraints.constrainWidth()");
                              return Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      (constraints.constrainWidth() / 6)
                                          .floor(),
                                      (index) => SizedBox(
                                            width: 3,
                                            height: 1,
                                            child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                    color: Colors.white)),
                                          )));
                            },
                          ),
                        ),
                      ])),
                      ThickContainer(),
                      const Spacer(),
                      Text(
                        "LDN",
                        style: Styles.headLineStyle3.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Gap(2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 100,
                          child: Text("New-York",
                              style: Styles.headLineStyle4
                                  .copyWith(color: Colors.white))),
                      Text("8H 30M",
                          style: Styles.headLineStyle4
                              .copyWith(color: Colors.white)),
                      SizedBox(
                          width: 100,
                          child: Text("London",
                              textAlign: TextAlign.end,
                              style: Styles.headLineStyle4
                                  .copyWith(color: Colors.white))),
                    ],
                  )
                ],
              )),
        ]),
      ),
    );
  }
}
