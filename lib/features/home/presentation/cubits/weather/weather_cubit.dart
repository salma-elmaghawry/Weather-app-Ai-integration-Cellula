import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/domain/usecases/get_weather_usecase.dart';
import 'package:weather_app/features/home/domain/entities/weather.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherCubit(this.getWeatherUseCase) : super(WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(WeatherLoading());
      final weatherPrediction = await getWeatherUseCase.execute(cityName);
      emit(WeatherLoaded(weatherPrediction.weather, weatherPrediction.prediction));
    } catch (e) {
      print('Cubit Error: $e');
      emit(WeatherError(e.toString()));
    }
  }
}