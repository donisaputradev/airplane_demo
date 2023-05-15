// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DestinationModel _$DestinationModelFromJson(Map<String, dynamic> json) =>
    DestinationModel(
      id: json['id'] as String,
      name: json['name'] as String,
      city: json['city'] as String,
      about: json['about'] as String,
      image: json['image'] as String,
      rating: (json['rating'] as num).toDouble(),
      price: json['price'] as int,
      interests:
          (json['interests'] as List<dynamic>).map((e) => e as String).toList(),
      photos:
          (json['photos'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DestinationModelToJson(DestinationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'about': instance.about,
      'image': instance.image,
      'rating': instance.rating,
      'price': instance.price,
      'interests': instance.interests,
      'photos': instance.photos,
    };
