import 'package:flutter/material.dart';
import 'package:one_gate_system/models/member.dart';
import 'package:one_gate_system/pages/dashboard/components/dashboard.dart';
import 'package:one_gate_system/pages/product/product.dart';

const double fntSizeDefault0 = 12.0;
const double fntSizeDefault = 14.0;
const double fntSizeDefault1 = 16.0;
const double fntSizeDefault2 = 18.0;
const double fntSizeDefault3 = 20.0;

const String baseAPIUrl = 'jpu.my.id';
const String baseAPIPath = '/api/test_api_cat.php';

// const headers = {
//   'Access-Control-Allow-Origin': '*',
//   'content-type': 'application/json',
//   'accept': '*/*',
//   'Access-Control-Allow-Headers':
//       'Accept, Accept-Language, Content-Language, Content-Type',
// };
const headers = {
  'Access-Control-Allow-Origin': '*',
  // 'Access-Control-Allow-Credentials': 'true',
  // 'Access-Control-Allow-Methods': 'GET,HEAD,OPTIONS,POST,PUT',
  // 'Access-Control-Allow-Headers':
  //     'Access-Control-Allow-Headers, Origin, X-Requested-With, Content-Type, Accept, Authorization',
};

Widget pages(int selectedPage, List<Member> memberList) {
  final pages = [
    PageDashboard(memberList: memberList),
    PageProduct(memberList: memberList),
  ];
  return pages[selectedPage];
}
