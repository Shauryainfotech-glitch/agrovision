import 'package:flutter/material.dart';
import 'package:agrovision_mobile/core/theme/app_theme.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.wb_sunny, color: AppTheme.primaryColor),
                const SizedBox(width: 8),
                const Text(
                  'Weather Forecast',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to detailed weather forecast
                  },
                  child: const Text('View Details'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildWeatherItem(
                    time: 'Now',
                    icon: Icons.wb_sunny,
                    temperature: '24°C',
                    description: 'Sunny',
                    isNow: true,
                  ),
                  _buildWeatherItem(
                    time: '12 PM',
                    icon: Icons.wb_cloudy,
                    temperature: '26°C',
                    description: 'Cloudy',
                  ),
                  _buildWeatherItem(
                    time: '3 PM',
                    icon: Icons.water_drop,
                    temperature: '23°C',
                    description: 'Rain',
                  ),
                  _buildWeatherItem(
                    time: '6 PM',
                    icon: Icons.cloud,
                    temperature: '22°C',
                    description: 'Cloudy',
                  ),
                  _buildWeatherItem(
                    time: '9 PM',
                    icon: Icons.nights_stay,
                    temperature: '20°C',
                    description: 'Clear',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.infoColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: AppTheme.infoColor,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                        ),
                        children: [
                          TextSpan(
                            text: 'Weather Alert: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.infoColor,
                            ),
                          ),
                          TextSpan(
                            text:
                                'Light rain expected in the evening. '
                                'Consider adjusting irrigation schedules.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeatherItem({
    required String time,
    required IconData icon,
    required String temperature,
    required String description,
    bool isNow = false,
  }) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: isNow ? AppTheme.primaryColor : Colors.transparent,
        border: Border.all(
          color: isNow ? AppTheme.primaryColor : AppTheme.dividerColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            time,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isNow ? Colors.white : AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
          Icon(
            icon,
            color: isNow ? Colors.white : AppTheme.primaryColor,
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            temperature,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isNow ? Colors.white : AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 10,
              color: isNow ? Colors.white70 : AppTheme.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
