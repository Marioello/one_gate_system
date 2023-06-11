class UserAuth {
  final String uid;

  UserAuth(this.uid);

  factory UserAuth.fromJson(Map<String, dynamic> json) => UserAuth(
        json['uid'],
      );

  Map<String, dynamic> toJson() => {
        'uid': uid,
      };
}
