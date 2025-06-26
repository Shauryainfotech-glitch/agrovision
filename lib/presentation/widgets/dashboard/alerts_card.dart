import 'package:flutter/material.dart';
import 'package:agrovision_mobile/core/theme/app_theme.dart';

class AlertsCard extends StatelessWidget {
  const AlertsCard({super.key});

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
                const Icon(Icons.warning_amber, color: AppTheme.warningColor),
                const SizedBox(width: 8),
                const Text(
                  'Active Alerts',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.warningColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    '3 Active',
                    style: TextStyle(
                      color: AppTheme.warningColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildAlertItem(
              icon: Icons.water_drop,
              title: 'Low Soil Moisture',
              description: 'Field A requires immediate irrigation',
              severity: AlertSeverity.high,
              time: '2 min ago',
            ),
            const SizedBox(height: 12),
            _buildAlertItem(
              icon: Icons.thermostat,
              title: 'High Temperature',
              description: 'Temperature exceeds optimal range',
              severity: AlertSeverity.medium,
              time: '15 min ago',
            ),
            const SizedBox(height: 12),
            _buildAlertItem(
              icon: Icons.bug_report,
              title: 'Pest Detection',
              description: 'Unusual activity detected in Field B',
              severity: AlertSeverity.low,
              time: '1 hour ago',
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  // TODO: Navigate to all alerts
                },
                child: const Text('View All Alerts'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlertItem({
    required IconData icon,
    required String title,
    required String description,
    required AlertSeverity severity,
    required String time,
  }) {
    Color severityColor;
    Color backgroundColor;

    switch (severity) {
      case AlertSeverity.high:
        severityColor = AppTheme.errorColor;
        backgroundColor = AppTheme.errorColor.withOpacity(0.1);
        break;
      case AlertSeverity.medium:
        severityColor = AppTheme.warningColor;
        backgroundColor = AppTheme.warningColor.withOpacity(0.1);
        break;
      case AlertSeverity.low:
        severityColor = AppTheme.infoColor;
        backgroundColor = AppTheme.infoColor.withOpacity(0.1);
        break;
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: severityColor.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: severityColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: severityColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: severityColor,
                        ),
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              // TODO: Handle alert action
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

enum AlertSeverity { high, medium, low }
