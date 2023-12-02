import 'product.dart';

class ProductModel {
  ProductModel({
    List<Product>? products,
    num? total,
    num? skip,
    num? limit,
  }) {
    _products = products;
    _total = total;
    _skip = skip;
    _limit = limit;
  }

  ProductModel.fromJson(dynamic json) {
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Product.fromJson(v));
      });
    }
    _total = json['total'];
    _skip = json['skip'];
    _limit = json['limit'];
  }

  List<Product>? _products;
  num? _total;
  num? _skip;
  num? _limit;

  List<Product>? get products => _products;

  num? get total => _total;

  num? get skip => _skip;

  num? get limit => _limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    map['skip'] = _skip;
    map['limit'] = _limit;
    return map;
  }
}
