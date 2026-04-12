class Bike {
  final String id;
  final bool isAvailable;

  const Bike({
    required this.id,
    required this.isAvailable,
  });
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Bike && other.id == id);

  @override
  int get hashCode => id.hashCode;

  Bike copyWith({required bool isAvailable}) {
    return Bike(
      id: id,
      isAvailable: isAvailable,
    );
  }
}
