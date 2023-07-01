import 'package:flutter/material.dart';

import '../../models/basic_tile.dart';
import '../../models/member.dart';
import '../../shared/constants.dart';
import '../../shared/helper.dart';
import '../dashboard/components/dashboard.dart';
import '../market_plan/fast_track.dart';
import '../market_plan/mission.dart';
import '../product/product.dart';

class WidgetMenu extends StatelessWidget {
  const WidgetMenu({super.key, required this.funct});

  final void Function(int) funct;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.amber[100],
            child: ListView(
              children: [
                ListTile(
                  onTap: () => funct(0),
                  title: textHelper('Beranda', size: fntSizeDef16),
                ),
                const Divider(),
                ListTile(
                  onTap: () => funct(1),
                  title: textHelper('Produk', size: fntSizeDef16),
                ),
                const Divider(),
                Theme(
                  data: ThemeData().copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: textHelper('Marketing Plan', size: fntSizeDef16),
                    children: [
                      ListTile(
                        onTap: () => funct(2),
                        title: textHelper('   Fast Track', size: fntSizeDef16),
                      ),
                      ListTile(
                        onTap: () {},
                        title: textHelper('   Matrix', size: fntSizeDef16),
                      ),
                      ListTile(
                        onTap: () => funct(3),
                        title: textHelper('   Missions', size: fntSizeDef16),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                ListTile(
                  onTap: () => auth.signOut(),
                  title: textHelper('Logout', size: fntSizeDef16),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Page list
Widget pages(int selectedPage, List<Member> memberList) {
  final pages = [
    PageDashboard(memberList: memberList),
    PageProduct(memberList: memberList),
    PageFasttrack(memberList: memberList),
    const PageMission(),
  ];
  return pages[selectedPage];
}
