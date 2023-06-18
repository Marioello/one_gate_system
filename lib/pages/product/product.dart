import 'package:flutter/material.dart';
import 'package:one_gate_system/models/member.dart';
import 'package:one_gate_system/models/product.dart';
import 'package:one_gate_system/pages/product/components/product_card.dart';
import 'package:one_gate_system/pages/product/your_product.dart';
import 'package:one_gate_system/shared/constants.dart';
import 'package:one_gate_system/shared/widgets/fast_track.dart';
import 'package:one_gate_system/shared/widgets/header.dart';
import 'package:one_gate_system/shared/helper.dart';

class PageProduct extends StatelessWidget {
  const PageProduct({super.key, required this.memberList});

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
                  title: 'Produk',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer orci velit, varius quis urna eu, lobortis finibus quam.',
                ),
                WidgetYourProduct(w: w),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    textHelper('Produk lainnya',
                        size: fntSizeDefault3, weight: FontWeight.bold),
                  ],
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 4 / 1,
                    children: userProducts.map((e) {
                      return ProductCardWidget(data: e, width: w);
                    }).toList(),
                  ),
                ),
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
