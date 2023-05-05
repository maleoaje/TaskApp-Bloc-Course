import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/blocs/bloc_exports.dart';
import 'package:flutter_tasks_app/blocs/my_bloc_observer.dart';
import 'package:flutter_tasks_app/services/app_router.dart';
import 'package:flutter_tasks_app/services/app_theme.dart';
import 'package:path_provider/path_provider.dart';

import 'screens/tasks_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TasksBloc()),
        BlocProvider(create: (context) => SwitchBloc())
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Tasks App',
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            home: const TasksScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
