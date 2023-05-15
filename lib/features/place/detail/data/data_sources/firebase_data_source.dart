import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/place/detail/detail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DestinationFirebaseDataSource {
  Future<List<DestinationModel>> getDestinations();
}

class DestinationFirebaseDataSourceImpl
    implements DestinationFirebaseDataSource {
  final destinationReference =
      FirebaseFirestore.instance.collection('destinations');

  @override
  Future<List<DestinationModel>> getDestinations() async {
    try {
      final response = await destinationReference.get();
      final destinations = response.docs
          .map((e) => DestinationModel.fromJsonWithId(e.id, e.data()))
          .toList();
      return destinations;
    } catch (e) {
      throw GeneralServerException(message: e.toString());
    }
  }
}
