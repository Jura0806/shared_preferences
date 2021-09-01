

class Account{

  String fullName;
  String email;
  String phone;
  String password;
  String confirmPass;

  Account({this.fullName,this.email, this.phone, this.password, this.confirmPass});

  Account.fromJson(Map<String, dynamic> json)
      :fullName = json["fullName"],
       email = json["email"],
       phone = json["phone"],
       password = json["password"],
      confirmPass = json["confirmPass"];

  Map<String, dynamic> toJson() =>{
    "fullName" : fullName,
    "email" : email,
    "phone" : phone,
    "password" : password,
    "confirmPass" : confirmPass,
  };
}