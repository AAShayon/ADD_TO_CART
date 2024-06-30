import 'dart:convert';

AllMenuItemResponseBodyModel allMenuItemResponseBodyModelFromJson(String str) => AllMenuItemResponseBodyModel.fromJson(json.decode(str));
String allMenuItemResponseBodyModelToJson(AllMenuItemResponseBodyModel data) => json.encode(data.toJson());
class AllMenuItemResponseBodyModel {
  AllMenuItemResponseBodyModel({
      List<Menu>? menu, 
      dynamic vat, 
      dynamic note,}){
    _menu = menu;
    _vat = vat;
    _note = note;
}

  AllMenuItemResponseBodyModel.fromJson(dynamic json) {
    if (json['menu'] != null) {
      _menu = [];
      json['menu'].forEach((v) {
        _menu?.add(Menu.fromJson(v));
      });
    }
    _vat = json['vat'];
    _note = json['note'];
  }
  List<Menu>? _menu;
  dynamic _vat;
  dynamic _note;
AllMenuItemResponseBodyModel copyWith({  List<Menu>? menu,
  dynamic vat,
  dynamic note,
}) => AllMenuItemResponseBodyModel(  menu: menu ?? _menu,
  vat: vat ?? _vat,
  note: note ?? _note,
);
  List<Menu>? get menu => _menu;
  dynamic get vat => _vat;
  dynamic get note => _note;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_menu != null) {
      map['menu'] = _menu?.map((v) => v.toJson()).toList();
    }
    map['vat'] = _vat;
    map['note'] = _note;
    return map;
  }

}


Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));
String menuToJson(Menu data) => json.encode(data.toJson());
class Menu {
  Menu({
      dynamic id, 
      dynamic name, 
      dynamic slug, 
      dynamic image, 
      dynamic description, 
      dynamic price, 
      dynamic discountPrice,}){
    _id = id;
    _name = name;
    _slug = slug;
    _image = image;
    _description = description;
    _price = price;
    _discountPrice = discountPrice;
}

  Menu.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _slug = json['slug'];
    _image = json['image'];
    _description = json['description'];
    _price = json['price'];
    _discountPrice = json['discount_price'];
  }
  dynamic _id;
  dynamic _name;
  dynamic _slug;
  dynamic _image;
  dynamic _description;
  dynamic _price;
  dynamic _discountPrice;
Menu copyWith({  dynamic id,
  dynamic name,
  dynamic slug,
  dynamic image,
  dynamic description,
  dynamic price,
  dynamic discountPrice,
}) => Menu(  id: id ?? _id,
  name: name ?? _name,
  slug: slug ?? _slug,
  image: image ?? _image,
  description: description ?? _description,
  price: price ?? _price,
  discountPrice: discountPrice ?? _discountPrice,
);
  dynamic get id => _id;
  dynamic get name => _name;
  dynamic get slug => _slug;
  dynamic get image => _image;
  dynamic get description => _description;
  dynamic get price => _price;
  dynamic get discountPrice => _discountPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['slug'] = _slug;
    map['image'] = _image;
    map['description'] = _description;
    map['price'] = _price;
    map['discount_price'] = _discountPrice;
    return map;
  }

}