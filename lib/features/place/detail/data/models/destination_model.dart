import 'package:airplane_demo/features/place/detail/detail.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'destination_model.g.dart';

@JsonSerializable()
class DestinationModel extends Equatable {
  final String id;
  final String name;
  final String city;
  final String about;
  final String image;
  final double rating;
  final int price;
  final List<String> interests;
  final List<String> photos;

  const DestinationModel({
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

  Destination toEntity() {
    return Destination(
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

  factory DestinationModel.fromJsonWithId(
          String id, Map<String, dynamic> json) =>
      DestinationModel(
        id: id,
        name: json['name'],
        city: json['city'],
        about: json['about'],
        image: json['image'],
        rating: json['rating']?.toDouble(),
        price: json['price'],
        interests: List<String>.from(json['interests'].map((x) => x)),
        photos: List<String>.from(json['photos'].map((x) => x)),
      );

  factory DestinationModel.fromJson(Map<String, dynamic> json) =>
      _$DestinationModelFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationModelToJson(this);

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
