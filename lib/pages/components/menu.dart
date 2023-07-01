import 'package:flutter/material.dart';
import 'package:one_gate_system/pages/market_plan/mission.dart';

import '../../models/basic_tile.dart';
import '../../models/member.dart';
import '../../shared/constants.dart';
import '../../shared/helper.dart';
import '../../shared/widgets/fast_track.dart';
import '../dashboard/components/dashboard2.dart';
import '../market_plan/fast_track.dart';
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
                        onTap: () => funct(3),
                        title: textHelper('   Fast Track', size: fntSizeDef16),
                      ),
                      ListTile(
                        onTap: () {},
                        title: textHelper('   Matrix', size: fntSizeDef16),
                      ),
                      ListTile(
                        onTap: () => funct(4),
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
    PageDashboard2(memberList: memberList),
    PageProduct(memberList: memberList),
    FastTrackWidget(memberList: memberList),
    FastTrackPage(memberList: memberList),
    const MissionPage(),
  ];
  return pages[selectedPage];
}
