import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:one_gate_system/shared/constants.dart';
import 'package:one_gate_system/models/api_response.dart';

class Member {
  final int id;
  final String uid;
  final DateTime joinDate;
  final DateTime? registerDate;
  final int tier;

  Member({
    required this.id,
    required this.uid,
    required this.joinDate,
    required this.registerDate,
    required this.tier,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: int.parse(json['id']),
      uid: json['uid'],
      joinDate: DateTime.parse(json['joindate']),
      registerDate: DateTime.parse(json['registerdate']),
      tier: int.parse(json['tier']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'joindate': joinDate.toString(),
      'registerdate': registerDate.toString(),
      'tier': tier,
    };
  }

  static Future<APIResponse<bool>> postMember(Member member) {
    var url = Uri.http(baseAPIUrl, baseAPIPath, {'action': 'postMember'});

    return http
        .post(url, headers: headers, body: json.encode(member.toJson()))
        .then(
      (data) {
        if (data.statusCode == 200) {
          return APIResponse<bool>(data: true, error: false, errorMessage: '');
        } else {
          return APIResponse<bool>(error: true, errorMessage: 'Error');
        }
      },
    ).catchError(
      (err) {
        if (kDebugMode) {
          print(err.toString());
        }
        return APIResponse<bool>(error: true, errorMessage: err.toString());
      },
    );
  }

  static Future<APIResponse<List<Member>>> getMember() {
    var url = Uri.https(baseAPIUrl, baseAPIPath, {'action': 'getMember'});

    return http.get(url).then(
      (data) {
        if (data.statusCode == 200) {
          final jsonData = json.decode(data.body)['data'];

          if (jsonData == null) {
            return APIResponse<List<Member>>(
                error: true, errorMessage: 'Error');
          }

          final transactions = <Member>[];
          for (var item in jsonData) {
            transactions.add(Member.fromJson(item));
          }

          return APIResponse<List<Member>>(
            data: transactions,
            error: false,
            errorMessage: '',
          );
        }
        return APIResponse<List<Member>>(error: true, errorMessage: 'Error');
      },
    ).catchError(
      (err) {
        return APIResponse<List<Member>>(
            error: true, errorMessage: err.toString());
      },
    );
  }
}
