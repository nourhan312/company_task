class CompaniesModel {

int ? id;
String ? name;
String ? image;
String ? type;
String ? description;
bool ? isFavourite;
double ? rating;
String ? location;



CompaniesModel({this.id, this.name, this.image, this.type, this.description, this.isFavourite, this.rating, this.location});

CompaniesModel.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  name = json['name'];
  image = json['image'];
  type = json['type'];
  description = json['desc'];
  isFavourite = json['fav'];
  rating = json['avg_rates'];
  location = json['location'];
}



}