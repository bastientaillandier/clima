import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = '4c8d17bdba370c895b6cdda606fbdef2';
const String openWeatherMapURL =
    'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentPosition();
    NetworkHelper network = NetworkHelper(
        url:
            '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData = await network.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'π©';
    } else if (condition < 400) {
      return 'π§';
    } else if (condition < 600) {
      return 'βοΈ';
    } else if (condition < 700) {
      return 'βοΈ';
    } else if (condition < 800) {
      return 'π«';
    } else if (condition == 800) {
      return 'βοΈ';
    } else if (condition <= 804) {
      return 'βοΈ';
    } else {
      return 'π€·β';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'C\'est un temps Γ  manger une π¦';
    } else if (temp > 20) {
      return 'Il est l\'heure d\'enfiler votre meilleur short et π';
    } else if (temp < 3) {
      return 'Tu auras besoins d\'une π§£ et de π§€';
    } else {
      return 'Prend un π§₯ au cas oΓΉ';
    }
  }
}
