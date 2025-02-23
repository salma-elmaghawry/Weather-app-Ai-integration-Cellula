import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/data/weather_model.dart';
import 'package:weather_app/features/home/data/weather_repo.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherCubit(this.weatherRepository) : super(WeatherInitial());

 Future<void> getWeather(String cityName) async {
    try {
      emit(WeatherLoading());
      final weather = await weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } catch (e) {
       print('Cubit Error: $e');
      emit(WeatherError(e.toString()));
    }
  }


}
