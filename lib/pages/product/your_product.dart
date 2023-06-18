import 'package:flutter/material.dart';
import 'package:one_gate_system/models/product.dart';
import 'package:one_gate_system/pages/product/components/product_card.dart';
import 'package:one_gate_system/shared/constants.dart';
import 'package:one_gate_system/shared/helper.dart';

class WidgetYourProduct extends StatelessWidget {
  const WidgetYourProduct({super.key, required this.w});

  final double w;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
