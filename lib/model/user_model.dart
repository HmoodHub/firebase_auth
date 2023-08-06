class UserModel{
  String? name, email, phone;
  bool? isVerified;
  UserModel();


  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['isVerified'] = isVerified;
    return map;
  }

  UserModel.fromJson(Map<String, dynamic> map){
    name = map['name'];
    email = map['email'];
    phone = map['phone'];
    isVerified = map ['isVerified'];
  }
}