import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_gate_system/models/member.dart';
import 'package:one_gate_system/shared/constants.dart';
import 'package:one_gate_system/shared/helper.dart';

class FastTrackWidget extends StatelessWidget {
  const FastTrackWidget({super.key, required this.memberList});

  final List<Member> memberList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
            child: Column(
              children: [
                Column(
                  children: [
                    textHelper('Tier - Fast Track', weight: FontWeight.bold),
                    const SizedBox(height: 20.0),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/tiers/tier-one.png',
                          ),
                          opacity: 0.7,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // if (widget.showHeader)
                      textHelper('Fast Track', weight: FontWeight.bold),
                      // if (widget.showHeader)
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        // child: textHelper('Last updated:\n${DateTime.now()}',
                        //     size: fntSizeDefault0, style: FontStyle.italic),
                        child: textHelper(
                            'List ini di-update berkala tiap 5 menit.',
                            size: fntSizeDefault0,
                            style: FontStyle.italic),
                      ),
                      Expanded(
                        child: memberList.isNotEmpty
                            ? ListView.builder(
                                itemBuilder: (context, index) {
                                  Member m = memberList[index];
                                  return Card(
                                    elevation: 10.0,
                                    child: ListTile(
                                      title: textHelper(m.uid),
                                      subtitle: textHelper(
                                          DateFormat('dd-MMM-yyyy hh:mm:ss.sss')
                                              .format(m.joinDate),
                                          color: Colors.grey,
                                          style: FontStyle.italic),
                                    ),
                                  );
                                },
                                itemCount: memberList.length,
                              )
                            : const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(),
                                ],
                              ),
                      ),
                    ],
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
