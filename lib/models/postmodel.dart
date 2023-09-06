class PostModel{
  String? name;
  String? UId;
  String? image;
  String? dateTime;
  String? text;
  String? postImage;




  PostModel({
    this.name, this.dateTime, this.text, this.UId, this.postImage,this.image
  });
  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dateTime = json['dateTime'];
text = json['text'];
    UId = json['UId'];
postImage = json['postImage'];

    image = json['image'];


  }
  Map<String, dynamic>  toMap(){
    return{
      'name':name,
      'dateTime':dateTime,
      'text':text,
      'UId':UId,
      'postImage':postImage,

      'image':image,



    };
  }
}