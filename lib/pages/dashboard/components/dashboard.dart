import 'package:flutter/material.dart';

import '../../../models/member.dart';
import '../../components/header.dart';
import '../../market_plan/fast_track.dart';
import '../../product/your_product.dart';

class PageDashboard extends StatelessWidget {
  const PageDashboard({super.key, required this.memberList});

  final List<Member> memberList;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var w = size.width / 100;

    ///
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
      child: Row(
        children: [
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Header(
                  title: 'Beranda',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer orci velit, varius quis urna eu, lobortis finibus quam.',
                ),
                WidgetYourProduct(w: w),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            // child: FastTrackWidget(memberList: memberList),
            child: PageFasttrack(memberList: memberList, isSideItem: true),
          )
        ],
      ),
    );
  }
}
