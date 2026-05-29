import 'package:floor/floor.dart';

@entity
class Party {
  @primaryKey
  final String id;
  final String title;
  final String description;
  final int dateTime;
  final double latitude;
  final double longitude;
  final String address;
  final int capacity;
  final bool isPaid;
  final double price;
  final String category;
  final String creatorName;
  final String? imagePath;

  Party({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.capacity,
    required this.isPaid,
    required this.price,
    required this.category,
    required this.creatorName,
    this.imagePath,
  });
}
