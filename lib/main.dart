import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_counter_app_bloc/screens/home_screen.dart';

import 'bloc/bloc_imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //using HydratedStorage
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(const MyApp());

///////// Or yo may need to use this code/////////////

  //  Future<void> main() async {
  //  WidgetsFlutterBinding.ensureInitialized();
  //  final storage = await HydratedStorage.build(
  //  storageDirectory:  await getApplicationDocumentsDirectory());
  //  HydratedBlocOverrides.runZoned(
  //    () => runApp(const MyApp()),
  //     storage: storage,
  //  );
  //  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //The BlocProvider widget acts as a container for a specific BLoC instance and 
    //makes it available to all the descendant widgets that need access to it.
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
