import 'package:flutter/material.dart';
import 'package:one_gate_system/models/product.dart';
import 'package:one_gate_system/pages/product/product_card.dart';
import 'package:one_gate_system/shared/constants.dart';
import 'package:one_gate_system/shared/helper.dart';

class PageProduct extends StatelessWidget {
  const PageProduct({super.key});

  @override
  Widget build(BuildContext context) {
    // List<Product> otherProduct = [
    //   Product(id: 3, name: 'PA 3'),
    //   Product(id: 4, name: 'PA 4'),
    // ];
    // List<String> widgetList = ['A', 'B', 'C'];

    // var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    // final double itemHeight = (size.height - kToolbarHeight) / 2;
    // final double itemWidth = size.width / 2;

    ///
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 50.0, 0, 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          textHelper('Produk anda',
              size: fntSizeDefault3, weight: FontWeight.bold),
          const SizedBox(height: 10.0),
          Expanded(
            flex: 1,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: userProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return PageProductCard(data: userProducts[index]);
              },
            ),
          ),
          const SizedBox(height: 10.0),
          textHelper('Produk lainya',
              size: fntSizeDefault3, weight: FontWeight.bold),
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
