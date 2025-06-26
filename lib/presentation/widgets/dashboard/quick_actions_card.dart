import 'package:flutter/material.dart';
import 'package:agrovision_mobile/core/theme/app_theme.dart';

class QuickActionsCard extends StatelessWidget {
  const QuickActionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.flash_on, color: AppTheme.primaryColor),
                SizedBox(width: 8),
                Text(
                  'Quick Actions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.0,
              children: [
                _buildActionItem(
                  icon: Icons.water_drop,
                  label: 'Irrigation',
                  color: AppTheme.infoColor,
                  onTap: () {
                    // TODO: Navigate to irrigation control
                  },
                ),
                _buildActionItem(
                  icon: Icons.camera_alt,
                  label: 'Crop Scan',
                  color: AppTheme.successColor,
                  onTap: () {
                    // TODO: Open camera for crop scanning
                  },
                ),
                _buildActionItem(
                  icon: Icons.sensors,
                  label: 'Sensors',
                  color: AppTheme.warningColor,
                  onTap: () {
                    // TODO: Navigate to sensor management
                  },
                ),
                _buildActionItem(
                  icon: Icons.task_alt,
                  label: 'Tasks',
                  color: AppTheme.primaryColor,
                  onTap: () {
                    // TODO: Navigate to task management
                  },
                ),
                _buildActionItem(
                  icon: Icons.analytics,
                  label: 'Analytics',
                  color: AppTheme.infoColor,
                  onTap: () {
                    // TODO: Navigate to analytics
                  },
                ),
                _buildActionItem(
                  icon: Icons.support_agent,
                  label: 'Expert Help',
                  color: AppTheme.successColor,
                  onTap: () {
                    // TODO: Navigate to expert consultation
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
