import 'package:flutter/material.dart';

import '../../models/member.dart';
import '../../models/product.dart';
import '../../shared/constants.dart';
import '../../shared/helper.dart';
import '../components/header.dart';
import 'components/product_card.dart';
import 'your_product.dart';

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
                        size: fntSizeDef20, weight: FontWeight.bold),
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
      ],
    );
  }
}
