import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/place/detail/detail.dart';
import 'package:dartz/dartz.dart';

abstract class DestinationRepository {
  Future<Either<Failure, List<Destination>>> getDestinations();
}
