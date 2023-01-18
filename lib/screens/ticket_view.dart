import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:ticketing_app/utils/app_layout.dart';
import 'package:ticketing_app/widgets/thick_container.dart';

import '../utils/app_styles.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  const TicketView({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(200),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(children: [
          //Showing the blue part
          Container(
            decoration: BoxDecoration(
              color: Color(0xff526799),
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
                    Text(ticket['from']['name'],
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
                          child: Icon(Icons.local_airport, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: AppLayout.getHeight(24),
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            print("The Width is constraints.constrainWidth()");
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
                                                  color: Colors.white)),
                                        )));
                          },
                        ),
                      ),
                    ])),
                    ThickContainer(),
                    const Spacer(),
                    Text(
                      ticket['to']['code'],
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
                        width: AppLayout.getWidth(100),
                        child: Text(ticket['from']['name'],
                            style: Styles.headLineStyle4
                                .copyWith(color: Colors.white))),
                    Text(ticket['flying_time'],
                        style: Styles.headLineStyle4
                            .copyWith(color: Colors.white)),
                    SizedBox(
                        width: AppLayout.getWidth(100),
                        child: Text(ticket['to']['name'],
                            textAlign: TextAlign.end,
                            style: Styles.headLineStyle4
                                .copyWith(color: Colors.white))),
                  ],
                )
              ],
            ),
          ),
          //showing the orange part
          Container(
            color: Styles.orangeColor,
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                  height: 20,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
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
                                      color: Colors.white,
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
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        )),
                  ),
                ),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Styles.orangeColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(21),
                bottomRight: Radius.circular(21),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ticket['date'],
                          style: Styles.headLineStyle3
                              .copyWith(color: Colors.white),
                        ),
                        const Gap(5),
                        Text(
                          "Date",
                          style: Styles.headLineStyle4
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          ticket['departure_time'],
                          style: Styles.headLineStyle3
                              .copyWith(color: Colors.white),
                        ),
                        const Gap(5),
                        Text(
                          "Departure time",
                          style: Styles.headLineStyle4
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          ticket['number'].toString(),
                          style: Styles.headLineStyle3
                              .copyWith(color: Colors.white),
                        ),
                        const Gap(5),
                        Text(
                          "Number",
                          style: Styles.headLineStyle4
                              .copyWith(color: Colors.white),
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
