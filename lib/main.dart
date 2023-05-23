import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_app/Theme/hive_theme_helper.dart';
import 'package:my_app/app_routes.dart';
import 'package:my_app/notesModel/noteModel.dart';

void main(List<String> args) async {
  // to ensure everything is done before runApp method is excuted
  WidgetsFlutterBinding.ensureInitialized();
  // to init hive database
  await Hive.initFlutter();
  // open box called theme ......box is similar to table in sql .. this box manges theme 
  await Hive.openBox('theme');
  // to open bos stores notes model and named by notes 
  Hive.registerAdapter<NoteModel>(NoteModelAdapter());
  await Hive.openBox('notes');
  // method responsible of running all application
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // responsible for listening to the value of  theme box and rebuild widget
    return ValueListenableBuilder(
      valueListenable: HiveThemeController.box.listenable(),
      builder: (context, box, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          // manages all app routing
          routes: router,

          initialRoute: 'welcomeScreen',
          // toggle theme depending on value stored in box
          theme: HiveThemeController.box.get('mode')
              ? ThemeData.dark()
              : ThemeData.light(),
        );
      },
    );
  }
}
