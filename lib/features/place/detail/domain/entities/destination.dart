import 'package:airplane_demo/features/place/detail/detail.dart';
import 'package:equatable/equatable.dart';

class Destination extends Equatable {
  final String id;
  final String name;
  final String city;
  final String about;
  final String image;
  final double rating;
  final int price;
  final List<String> interests;
  final List<String> photos;

  const Destination({
    required this.id,
    required this.name,
    required this.city,
    required this.about,
    required this.image,
    required this.rating,
    required this.price,
    required this.interests,
    required this.photos,
  });

  DestinationModel toData() {
    return DestinationModel(
      about: about,
      city: city,
      id: id,
      image: image,
      interests: interests,
      name: name,
      photos: photos,
      price: price,
      rating: rating,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        city,
        about,
        image,
        rating,
        price,
        interests,
        photos,
      ];
}
