import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/utils/app_layout.dart';
import 'package:ticketing_app/widgets/column_layout.dart';
import 'package:ticketing_app/widgets/thick_container.dart';

import '../utils/app_styles.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  const TicketView({Key? key, required this.ticket, this.isColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(GetPlatform.isAndroid == true ? 167 : 163),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(children: [
          //Showing the blue part
          Container(
            decoration: BoxDecoration(
              color: isColor == null ? Color(0xff526799) : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppLayout.getHeight(21)),
                topRight: Radius.circular(AppLayout.getHeight(21)),
              ),
            ),
            padding: EdgeInsets.all(AppLayout.getHeight(16)),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(ticket['from']['code'],
                        style: isColor == null
                            ? Styles.headLineStyle3.copyWith(
                                color: Colors.white,
                              )
                            : Styles.headLineStyle3),
                    Expanded(child: Container()),
                    ThickContainer(isColor: true),
                    Expanded(
                        child: Stack(children: [
                      Center(
                        child: Transform.rotate(
                          angle: 1.5,
                          child: Icon(Icons.local_airport,
                              color: isColor == null
                                  ? Colors.white
                                  : Color(0xFF8ACCF7)),
                        ),
                      ),
                      SizedBox(
                        height: AppLayout.getHeight(24),
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            print(
                                "The Width is ${constraints.constrainWidth()}");
                            return Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    (constraints.constrainWidth() / 6).floor(),
                                    (index) => SizedBox(
                                          width: 3,
                                          height: 1,
                                          child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                  color: isColor == null
                                                      ? Colors.white
                                                      : Colors.grey.shade300)),
                                        )));
                          },
                        ),
                      ),
                    ])),
                    ThickContainer(isColor: true),
                    const Spacer(),
                    Text(
                      ticket['to']['code'],
                      style: isColor == null
                          ? Styles.headLineStyle3.copyWith(
                              color: Colors.white,
                            )
                          : Styles.headLineStyle3,
                    ),
                  ],
                ),
                const Gap(2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(ticket['from']['name'],
                            style: isColor == null
                                ? Styles.headLineStyle4
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle4)),
                    Text(ticket['flying_time'],
                        style: isColor == null
                            ? Styles.headLineStyle4
                                .copyWith(color: Colors.white)
                            : Styles.headLineStyle4),
                    SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(ticket['to']['name'],
                            textAlign: TextAlign.end,
                            style: isColor == null
                                ? Styles.headLineStyle4
                                    .copyWith(color: Colors.white)
                                : Styles.headLineStyle4)),
                  ],
                )
              ],
            ),
          ),
          //showing the orange part
          Container(
            color: isColor == null ? Styles.orangeColor : Colors.white,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                  height: 20,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: isColor == null
                            ? Colors.grey.shade200
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Flex(
                        direction: Axis.horizontal,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(
                            (constraints.constrainWidth() / 15).floor(),
                            (index) => SizedBox(
                                  width: 5,
                                  height: 1,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: isColor == null
                                          ? Colors.white
                                          : Colors.grey.shade300,
                                    ),
                                  ),
                                )),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  width: AppLayout.getWidth(10),
                  height: AppLayout.getHeight(20),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: isColor == null
                            ? Colors.grey.shade200
                            : Colors.white,
                        borderRadius: BorderRadius.only(
                          //border radius for the orange part at right small circle
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        )),
                  ),
                ),
              ],
            ),
          ),

          // Container for bottom part of orange part
          Container(
            decoration: BoxDecoration(
              color: isColor == null ? Styles.orangeColor : Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(isColor == null ? 21 : 0),
                bottomRight: Radius.circular(isColor == null ? 21 : 0),
              ),
            ),
            padding:
                const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, //its make this two column in some spacebetween
                  children: [
                    AppColumnLayout(
                        firstText: ticket['date'],
                        secondText: "Date",
                        alignment: CrossAxisAlignment.start,
                        isColor: false),
                    AppColumnLayout(
                        firstText: ticket['departure_time'],
                        secondText: "Departure time",
                        alignment: CrossAxisAlignment.center,
                        isColor: false),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          ticket['number'].toString(),
                          style: isColor == null
                              ? Styles.headLineStyle3
                                  .copyWith(color: Colors.white)
                              : Styles.headLineStyle3,
                        ),
                        const Gap(5),
                        Text(
                          "Number",
                          style: isColor == null
                              ? Styles.headLineStyle4
                                  .copyWith(color: Colors.white)
                              : Styles.headLineStyle4,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
