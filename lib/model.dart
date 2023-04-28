import 'dart:convert';

List<Products> productFromJson(String str) =>
    List<Products>.from(json.decode(str)['data'].map((x) => Products.fromJson(x)));

class Products {
  int? id;
  String? type;
  Attributes? attributes;

  Products({this.id, this.type, this.attributes});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? image;
  String? description;
  String? name;
  String? size;
  String? price;

  Attributes({this.image, this.description, this.name, this.size, this.price});

  Attributes.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    description = json['description'];
    name = json['name'];
    size = json['size'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['description'] = this.description;
    data['name'] = this.name;
    data['size'] = this.size;
    data['price'] = this.price;
    return data;
  }
}
