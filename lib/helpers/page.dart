import 'package:flutter/material.dart';
import 'package:one_gate_system/models/member.dart';
import 'package:one_gate_system/pages/dashboard/layout.dart';

class PageHelper extends StatelessWidget {
  const PageHelper(
      {super.key, this.selectedPage = 0, required this.memberList});

  final int selectedPage;
  final List<Member> memberList;

  @override
  Widget build(BuildContext context) {
    return pages(selectedPage, memberList);
  }
}
