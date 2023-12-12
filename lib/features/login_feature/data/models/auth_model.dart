class AuthModel{
  late String token;
  late String type;

  AuthModel.fromJson(Map<String , dynamic> json){
    token = json['access_token'];
    type = json['token_type'];
  }
}