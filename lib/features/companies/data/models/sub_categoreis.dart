class SubCategoreisModel {

int ? id;
String ? name;
String ? image;

SubCategoreisModel({this.id, this.name, this.image});


SubCategoreisModel.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  name = json['name'];
  image = json['image'];
}



}
