
import 'package:weather_app/features/home/data/datasources/prediction_remote_data_source.dart';
import 'package:weather_app/features/home/domain/repositories/prediction_repo.dart';

class PredictionRepositoryImpl implements PredictionRepository {
  final PredictionRemoteDataSource remoteDataSource;

  PredictionRepositoryImpl(this.remoteDataSource);

  @override
  Future<int> getPrediction(List<int> features) async {
    return await remoteDataSource.getPrediction(features);
  }
}