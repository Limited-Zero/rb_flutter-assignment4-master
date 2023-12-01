// Import required files
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'router.dart';

// Top Level app execute.
void main() {
  runApp(const App());
}

// App with Stateless widget.
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  // Variables - App.XXX
  static const String title = 'Welcome! My Flutter App';
  static const String txtBack = 'Back to Home Page';
  static const String title2 = 'Weather';
  static const String title3 = 'Calculator';
  static const String title4 = 'tool';

  @override
  Widget build(BuildContext context) =>
      MaterialApp.router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      );
}

//Home Page Widget.
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  // Page Builder.
  @override
  Widget build(BuildContext context) => Scaffold(
    // Top Title.
    appBar: AppBar(title: const Text(App.title)),
    body: Stack(
      children: [
        Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Welcome Text.
                  const Text(
                    'Welcome to My Page!',
                    style: TextStyle(fontSize: 32),
                  ),
                  const SizedBox(height: 50),
                  Image.asset(
                    'assets/images/iotower.jpg',
                    width: 350,
                  ),
                ],
              ),
            ),
        Positioned(
              // Buttons to Tools Setup.
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      // Route To page
                      onPressed: () => context.go('/weather'),
                      child: const Text(App.title2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      // Route To page
                      onPressed: () => context.go('/calculator'),
                      child: const Text(App.title3),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      // Route To page
                      onPressed: () => context.go('/'),
                      child: const Text(App.title4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
}
