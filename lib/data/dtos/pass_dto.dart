import '../../domain/model/pass/pass.dart';

class PassDto {
  static const String idKey = 'id';
  static const String passtypeKey = 'pass_type';
  static const String priceKey = 'price';
  static const String descriptionKey = 'description';

  static Pass fromJson(String id, Map<String, dynamic> json) {
    assert(json[passtypeKey] is String);
    assert(json[priceKey] is num);
    assert(json[descriptionKey] is String);

    return Pass(
      id: id,
      passtype: json[passtypeKey],
      price: (json[priceKey] as num).toDouble(),
      description: json[descriptionKey],
    );
  }
  static Map<String, dynamic> toJson(Pass pass) {
    return {
      idKey: pass.id,
      passtypeKey: pass.passtype,
      priceKey: pass.price,
      descriptionKey: pass.description,
    };
  }
}