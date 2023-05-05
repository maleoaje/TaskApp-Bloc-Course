import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/recycle_bin.dart';
import 'package:flutter_tasks_app/screens/tab_screen.dart';
import 'package:flutter_tasks_app/screens/pending_tasks_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return MaterialPageRoute(
          builder: (_) => const RecycleBin(),
        );
      case pendingTasksScreen.id:
        return MaterialPageRoute(
          builder: (_) => const pendingTasksScreen(),
        );
      case TabsScreen.id:
        return MaterialPageRoute(
          builder: (_) => const TabsScreen(),
        );
      default:
        return null;
    }
  }
}
