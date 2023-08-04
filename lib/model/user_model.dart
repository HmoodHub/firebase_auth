class User{
  String? name, email, phone;
  User();


  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }

  User.fromJson(Map<String, dynamic> map){
    name = map['name'];
    email = map[email];
    phone = map[phone];
  }
}