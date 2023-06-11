import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:one_gate_system/shared/constants.dart';
import 'package:one_gate_system/models/api_response.dart';

class Account {
  String uid;
  String email;
  String password;

  Account({
    required this.uid,
    required this.email,
    required this.password,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      uid: json['uid'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
    };
  }

  static Future<APIResponse<bool>> postAccount(Account account) {
    var url = Uri.http(baseAPIUrl, baseAPIPath, {'action': 'postAccount'});
    // Uri url = Uri.parse('https://$baseAPIUrl/$baseAPIPath?action=postAccount');

    return http
        .post(url, headers: headers, body: json.encode(account.toJson()))
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
        print(err.toString());
        return APIResponse<bool>(error: true, errorMessage: err.toString());
      },
    );
  }

  // static Future<APIResponse<List<Member>>> postAccount() {
  //   var url = Uri.https(baseAPIUrl, baseAPIPath, {'action': 'postAccount'});

  //   return http.post(url).then(
  //     (data) {
  //       if (data.statusCode == 200) {
  //         final jsonData = json.decode(data.body)['data'];

  //         if (jsonData == null) {
  //           return APIResponse<List<Member>>(
  //               error: true, errorMessage: 'Error');
  //         }

  //         final transactions = <Member>[];
  //         for (var item in jsonData) {
  //           transactions.add(Member.fromJson(item));
  //         }

  //         return APIResponse<List<Member>>(
  //           data: transactions,
  //           error: false,
  //           errorMessage: '',
  //         );
  //       }
  //       return APIResponse<List<Member>>(error: true, errorMessage: 'Error');
  //     },
  //   ).catchError(
  //     (err) =>
  //         APIResponse<List<Member>>(error: true, errorMessage: err.toString()),
  //   );
  // }
}
