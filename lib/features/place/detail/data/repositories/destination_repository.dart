import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/place/detail/detail.dart';
import 'package:dartz/dartz.dart';

class DestinationRepositoryImpl extends DestinationRepository {
  DestinationRepositoryImpl(this.destinationFirebaseDataSource);

  final DestinationFirebaseDataSource destinationFirebaseDataSource;

  @override
  Future<Either<Failure, List<Destination>>> getDestinations() async {
    try {
      final result = await destinationFirebaseDataSource.getDestinations();
      final destination = result.map((e) => e.toEntity()).toList();
      return Right(destination);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message, code: e.code));
    }
  }
}
