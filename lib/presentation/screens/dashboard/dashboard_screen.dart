import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:agrovision_mobile/core/theme/app_theme.dart';
import 'package:agrovision_mobile/presentation/routes/app_router.dart';
import 'package:agrovision_mobile/domain/blocs/dashboard/dashboard_bloc.dart';
import 'package:agrovision_mobile/presentation/widgets/dashboard/environmental_metrics_card.dart';
import 'package:agrovision_mobile/presentation/widgets/dashboard/weather_card.dart';
import 'package:agrovision_mobile/presentation/widgets/dashboard/quick_actions_card.dart';
import 'package:agrovision_mobile/presentation/widgets/dashboard/alerts_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.dashboard),
      label: 'Dashboard',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.agriculture),
      label: 'Fields',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.psychology),
      label: 'AI Insights',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sensors),
      label: 'Sensors',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  @override
  void initState() {
    super.initState();
    context.read<DashboardBloc>().add(DashboardLoadRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is DashboardError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('AgroVision Dashboard'),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  AppRouter.navigateTo(context, AppRoutes.notifications);
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  AppRouter.navigateTo(context, AppRoutes.settings);
                },
              ),
            ],
          ),
          body: _buildBody(state),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: _bottomNavItems,
          ),
        );
      },
    );
  }

  Widget _buildBody(DashboardState state) {
    switch (_selectedIndex) {
      case 0:
        return _buildDashboardContent(state);
      case 1:
        return _buildFieldsContent();
      case 2:
        return _buildAIInsightsContent();
      case 3:
        return _buildSensorsContent();
      case 4:
        return _buildProfileContent();
      default:
        return _buildDashboardContent(state);
    }
  }

  Widget _buildDashboardContent(DashboardState state) {
    if (state is DashboardLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (state is DashboardLoaded) {
      return RefreshIndicator(
        onRefresh: () async {
          context.read<DashboardBloc>().add(DashboardRefreshRequested());
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Good Morning, Farmer!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Last updated: ${state.lastUpdated.toString()}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Environmental Metrics
              const EnvironmentalMetricsCard(),

              const SizedBox(height: 16),

              // Weather Information
              const WeatherCard(),

              const SizedBox(height: 16),

              // Quick Actions
              const QuickActionsCard(),

              const SizedBox(height: 16),

              // Active Alerts
              const AlertsCard(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      );
    }

    return const Center(
      child: Text('Something went wrong'),
    );
  }

  Widget _buildFieldsContent() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.agriculture, size: 64, color: AppTheme.primaryColor),
          SizedBox(height: 16),
          Text(
            'Field Monitoring',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Coming Soon',
            style: TextStyle(fontSize: 16, color: AppTheme.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildAIInsightsContent() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.psychology, size: 64, color: AppTheme.primaryColor),
          SizedBox(height: 16),
          Text(
            'AI Insights',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Coming Soon',
            style: TextStyle(fontSize: 16, color: AppTheme.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildSensorsContent() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.sensors, size: 64, color: AppTheme.primaryColor),
          SizedBox(height: 16),
          Text(
            'Sensor Management',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Coming Soon',
            style: TextStyle(fontSize: 16, color: AppTheme.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileContent() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 64, color: AppTheme.primaryColor),
          SizedBox(height: 16),
          Text(
            'Profile',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Coming Soon',
            style: TextStyle(fontSize: 16, color: AppTheme.textSecondary),
          ),
        ],
      ),
    );
  }
}
