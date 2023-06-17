import 'package:flutter/material.dart';
import 'package:one_gate_system/models/product.dart';
import 'package:one_gate_system/pages/product/product_card.dart';
import 'package:one_gate_system/pages/product/product_card_default.dart';
import 'package:one_gate_system/shared/constants.dart';
import 'package:one_gate_system/shared/helper.dart';

class PageProduct extends StatelessWidget {
  const PageProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var w = size.width / 100;

    ///
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textHelper('Produk', size: 30.0, weight: FontWeight.bold),
          const SizedBox(height: 50.0),
          textHelper(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer orci velit, varius quis urna eu, lobortis finibus quam.',
              size: fntSizeDefault),
          const SizedBox(height: 50.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              textHelper('Produk anda',
                  size: fntSizeDefault3, weight: FontWeight.bold),
            ],
          ),
          const SizedBox(height: 10.0),
          Container(
            color: Colors.transparent,
            height: 150,
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: userProducts.length,
              itemBuilder: (BuildContext context, int index) =>
                  ProductCardWidget(data: userProducts[index], width: w),
            ),
          ),
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
    );
  }
}
