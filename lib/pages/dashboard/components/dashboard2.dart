import 'package:flutter/material.dart';
import 'package:one_gate_system/models/product.dart';
import 'package:one_gate_system/pages/product/product_card.dart';
import 'package:one_gate_system/shared/constants.dart';
import 'package:one_gate_system/shared/helper.dart';

class PageDashboard extends StatelessWidget {
  const PageDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 50.0, 0, 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // textHelper('Hi Customer! - 2',
          //     size: fntSizeDefault3, weight: FontWeight.bold),
          // const SizedBox(height: 5.0),
          // textHelper('Last login: ${DateTime.now()}',
          //     color: Colors.grey, style: FontStyle.italic),
          // const SizedBox(height: 30.0),
          // textHelper(
          //     'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer orci velit, varius quis urna eu, lobortis finibus quam.',
          //     size: fntSizeDefault),
          // const SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              textHelper('Produk anda',
                  size: fntSizeDefault3, weight: FontWeight.bold),
            ],
          ),
          const SizedBox(height: 10.0),
          Expanded(
            flex: 1,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: userProducts.length,
              itemBuilder: (BuildContext context, int index) =>
                  PageProductCard(data: userProducts[index]),
            ),
          ),
        ],
      ),
    );
  }
}
