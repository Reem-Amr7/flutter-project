class ServiceModel {
  String? id;
  String? name;
  String? description;
  String? color;

  ServiceModel.fromJson(Map map) {
    id = map['id'].toString();
    name = map['name'];
    description = map['description'];
    color = map['color'];

  }
}