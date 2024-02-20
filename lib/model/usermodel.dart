class UserModel
{
   final String uId;
   final String username;
   final String email;
   final String phone;
   final String userImg;

  UserModel({required this.uId, required this.username, required this.email, required this.phone, required this.userImg});

Map<String,dynamic> toMap(){
   return {
      'uId':uId,
      'username':username.toString(),
      'email':email.toString(),
      'phone':phone.toString(),
      'userImg':userImg.toString()
   };
}



}