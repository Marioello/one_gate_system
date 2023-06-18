import 'package:flutter/material.dart';
import 'package:one_gate_system/models/product.dart';
import 'package:one_gate_system/shared/helper.dart';

class PageProductCardDefault extends StatelessWidget {
  const PageProductCardDefault({super.key, required this.data});

  final Product data;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        // color: Colors.amber,
        height: 200.0,
        width: 250.0,
        child: Card(
          elevation: 10.0,
          child: Column(
            children: [
              ListTile(
                title: textHelper(data.name),
                subtitle: textHelper(
                  'Secondary TextX',
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              // Image.asset(
              //   'assets/images/tiers/tier-one.png',
              //   width: 100,
              //   height: 100,
              // ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: textHelper(
                  'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    // textColor: const Color(0xFF6200EE),
                    onPressed: () {
                      // Perform some action
                    },
                    child: textHelper('ACTION 1', color: Colors.blue),
                  ),
                  OutlinedButton(
                    // textColor: const Color(0xFF6200EE),
                    onPressed: () {
                      // Perform some action
                    },
                    child: textHelper('ACTION 2', color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
