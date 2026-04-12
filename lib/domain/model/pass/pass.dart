class Pass {
  final String id;
  final String passtype;
  final double price;
  final String description;

  const Pass({
    required this.id,
    required this.passtype,
    required this.price,
    required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Pass && other.id == id);

  @override
  int get hashCode => id.hashCode;

  Pass copyWith({String? id, String? passtype, double? price, String? description}) {
    return Pass(
      id: id ?? this.id,
      passtype: passtype ?? this.passtype,
      price: price ?? this.price,
      description: description ?? this.description,
    );
  }
}