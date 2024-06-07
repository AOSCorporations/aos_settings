import 'package:aos_settings/pages/networkPage.dart';
import 'package:aos_settings/widgets/scaffolds.dart';
import 'package:aos_settings/widgets/sidebar.dart';
import 'package:aos_settings/widgets/window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomeScaffold(),
        theme: ThemeData(brightness: Brightness.light),
        darkTheme: ThemeData(brightness: Brightness.dark));
  }
}

class HomeScaffold extends StatefulWidget {
  const HomeScaffold({super.key});

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  GlobalKey<NavigatorState> NetworkPageKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return AOSWindow(
      blurOrTransparencyEnabled: true,
      backgroundColor: Colors.transparent,
      sidebar: ISidebar(
        title: Text("Settings"),
      ),
      content: Navigator(
        onGenerateRoute: (settings) =>
            MaterialPageRoute(builder: (context) => NetworkPage()),
      ),
    );
  }
}
