class Social_User_Model{
  String? name;
  String? phone;
  String? email;
  String? UId;
  String? image;
  String? bio;
  String? cover;

  bool? isEmailvarified;

  Social_User_Model({
  this.name, this.phone, this.email, this.UId, this.cover, this.bio, this.isEmailvarified, this.image
});
  Social_User_Model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    UId = json['UId'];
    cover = json['cover'];

    image = json['image'];
    bio = json['bio'];

    isEmailvarified = json['isEmailvarified'];

  }
  Map<String, dynamic>  toMap(){
    return{
      'name':name,
      'phone':phone,
      'email':email,
      'UId':UId,
      'cover':cover,

      'image':image,
      'bio':bio,
      'isEmailvarified':isEmailvarified,


    };
  }
}