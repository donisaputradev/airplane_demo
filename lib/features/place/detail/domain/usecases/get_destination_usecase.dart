import 'package:airplane_demo/core/core.dart';
import 'package:airplane_demo/features/place/detail/detail.dart';
import 'package:dartz/dartz.dart';

class GetDestinationUseCase
    implements UseCaseFuture<Failure, List<Destination>, NoParams> {
  GetDestinationUseCase(this.destinationRepository);

  final DestinationRepository destinationRepository;

  @override
  Future<Either<Failure, List<Destination>>> call(NoParams params) {
    return destinationRepository.getDestinations();
  }
}
