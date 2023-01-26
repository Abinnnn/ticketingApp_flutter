import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:ticketing_app/screens/ticket_view.dart';
import 'package:ticketing_app/widgets/column_layout.dart';
import 'package:ticketing_app/widgets/ticket_tabs.dart';

import '../utils/app_info_list.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';
import '../widgets/layout_builder_widget.dart';
import 'package:barcode_widget/barcode_widget.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(
                horizontal: AppLayout.getHeight(20),
                vertical: AppLayout.getHeight(20)),
            children: [
              Gap(AppLayout.getHeight(40)),
              Text(
                "Ticket",
                style: Styles.headLineStyle1,
              ),
              Gap(AppLayout.getHeight(20)),
              AppTicketTabs(firstTab: "Upcoming", secondTab: "Previous"),
              Gap(AppLayout.getHeight(20)),
              Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TicketView(
                  ticket: ticketList[0],
                  isColor: true,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                margin:
                    EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnLayout(
                            firstText: "Flutter DB",
                            secondText: "Passangers",
                            alignment: CrossAxisAlignment.start,
                            isColor: false),

                        AppColumnLayout(
                          firstText: "5211 737371",
                          secondText: "Passport",
                          alignment: CrossAxisAlignment.end,
                          isColor: false,
                        )
                        // AppColumnLayout right section
                      ],
                    ),
                    Gap(AppLayout.getHeight(20)),
                    AppLayoutBuilderWidget(
                        sections: 15, isColor: false, width: 5),

                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnLayout(
                            firstText: "3578 232",
                            secondText: "Number of E-Ticket",
                            alignment: CrossAxisAlignment.start,
                            isColor: false),

                        AppColumnLayout(
                          firstText: "b2SG28",
                          secondText: "Booking Code",
                          alignment: CrossAxisAlignment.end,
                          isColor: false,
                        )
                        // AppColumnLayout right section
                      ],
                    ),

                    //
                    Gap(AppLayout.getHeight(20)),
                    AppLayoutBuilderWidget(
                        sections: 15, isColor: false, width: 5),
                    Gap(AppLayout.getHeight(20)),
                    //
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/visa.png",
                                  scale: 10,
                                ),
                                Text(
                                  " *** 2462",
                                  style: Styles.headLineStyle3,
                                )
                              ],
                            ),
                            Gap(5),
                            Text("Payment method",
                                style: Styles.headLineStyle4),
                          ],
                        ),
                        AppColumnLayout(
                            firstText: "\$249,99",
                            secondText: "Price",
                            alignment: CrossAxisAlignment.end,
                            isColor: false),
                      ],
                    ),

                    //
                    SizedBox(
                      height: 1,
                    ),
                  ],
                ),
              ),

              //bar code
              SizedBox(
                height: 1,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(AppLayout.getHeight(10)),
                        bottomRight: Radius.circular(AppLayout.getHeight(10)))),
                margin: EdgeInsets.only(
                  left: AppLayout.getHeight(15),
                  right: AppLayout.getHeight(15),
                ),
                padding: EdgeInsets.only(
                    top: AppLayout.getHeight(15),
                    bottom: AppLayout.getHeight(15)),
                child: Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15)),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppLayout.getHeight(15)),
                    child: BarcodeWidget(
                      barcode: Barcode.code128(),
                      data: 'https://github.com//Abinnnn',
                      drawText: false,
                      color: Styles.textColor,
                      width: double.infinity,
                      height: 70,
                    ),
                  ),
                ),
              ),
              Gap(AppLayout.getHeight(20)),
              TicketView(
                ticket: ticketList[0],
              ),
            ],
          ),
          Positioned(
            left: AppLayout.getHeight(18),
            top: AppLayout.getHeight(295),
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor, width: 2),
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Styles.textColor,
              ),
            ),
          ),
          Positioned(
            right: AppLayout.getHeight(18),
            top: AppLayout.getHeight(295),
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Styles.textColor, width: 2),
              ),
              child: CircleAvatar(
                maxRadius: 4,
                backgroundColor: Styles.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
