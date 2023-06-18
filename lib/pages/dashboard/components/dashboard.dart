import 'package:flutter/material.dart';
import 'package:one_gate_system/models/member.dart';
import 'package:one_gate_system/pages/product/your_product.dart';
import 'package:one_gate_system/shared/widgets/fast_track.dart';
import 'package:one_gate_system/shared/widgets/header.dart';

class PageDashboard extends StatelessWidget {
  const PageDashboard({super.key, required this.memberList});

  final List<Member> memberList;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var w = size.width / 100;

    ///
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
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
        ),
        Expanded(
          flex: 2,
          child: FastTrackWidget(memberList: memberList),
        )
      ],
    );
  }
}
