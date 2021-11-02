class Authen {
  final String? company;
  final String? username;
  final String? fName;
  final String? password;
  final String? lName;
  final String? email;
  final String? position;
  final String? department;
  final String? mobile;
  final String? token;

  Authen(
      {required this.company,
      required this.username,
      required this.fName,
      required this.password,
      required this.lName,
      required this.email,
      required this.position,
      required this.department,
      required this.mobile,
      required this.token});

  factory Authen.fromJson(Map<String, dynamic> json) {
    return Authen(
        company : json['company'],
        username  : json['username'],
        fName  : json['fName'],
        password  : json['password'],
        lName  : json['lName'],
        email  : json['email'],
        position  : json['position'],
        department  : json['department'],
        mobile  : json['mobile'],
        token  : json['token'],);
  }

  // Map toJson() {
  //   return {
  //     'company': company,
  //     'username': username,
  //     'fname': fname,
  //     'password': password,
  //     'lname': lname,
  //     'email': email,
  //     'position': position,
  //     'department': department,
  //     'mobile': mobile,
  //     'token': token
  //   };
  // }
}
