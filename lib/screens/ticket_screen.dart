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
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                padding: EdgeInsets.symmetric(horizontal: 15),
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
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
