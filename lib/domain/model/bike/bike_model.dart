class Bike {
  final String id;
  final String number;
  final int slot;
  final bool isAvailable;

  const Bike({
    required this.id,
    required this.number,
    required this.slot,
    required this.isAvailable,
  });
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Bike && other.id == id);
 
  @override
  int get hashCode => id.hashCode;

}
