import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody.WeatherInfoBody(
      {super.key, required this.weatherModel});
  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue[50]!,
            Colors.blue[100]!,
            Colors.blue[300]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // City and Country
            Column(
              children: [
                Text(
                  weatherModel.cityName,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  weatherModel.country,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Local Time
            Text(
              '${weatherModel.localTime.hour.toString().padLeft(2, '0')}:${weatherModel.localTime.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 32),

            // Weather Icon and Condition
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "https:${weatherModel.weatherConditionIcon}",
                  width: 80,
                  height: 80,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error, size: 80, color: Colors.grey),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${weatherModel.currentTemp.round()}°',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      weatherModel.weatherCondition,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),

            // High and Low Temperatures
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _temperatureDetail(
                  icon: Icons.arrow_upward,
                  label: 'High',
                  value: '${weatherModel.maxTemp.round()}°',
                ),
                _temperatureDetail(
                  icon: Icons.arrow_downward,
                  label: 'Low',
                  value: '${weatherModel.minTemp.round()}°',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget for Temperature Details
  Widget _temperatureDetail({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Icon(icon, size: 32, color: Colors.blue),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
