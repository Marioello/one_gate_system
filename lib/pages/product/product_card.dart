import 'package:flutter/material.dart';
import 'package:one_gate_system/models/product.dart';
import 'package:one_gate_system/shared/helper.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key, required this.data});

  final Product data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.transparent,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      // color: Colors.transparent,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/product/sinarmas/asuransi-sinarmas.png',
                        ),
                        opacity: 0.7,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.transparent,
              height: 100,
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textHelper(data.name, size: 17.0, weight: FontWeight.bold),
                  const SizedBox(height: 10.0),
                  textHelper(data.description, color: Colors.grey),
                ],
              ),
            ),
            Container(
              height: 100,
              width: 200,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textHelper(data.premi),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(),
                          onPressed: () {},
                          child: textHelper('Detail', color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10.0),
                      textHelper('tambahkan ke favorit'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
