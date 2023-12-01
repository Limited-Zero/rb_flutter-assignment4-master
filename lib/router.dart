// Import required files
import 'package:go_router/go_router.dart';
import 'main.dart';
import 'weather.dart';
import 'calculator.dart';

// Define the router object with the defined routes
final GoRouter router = GoRouter(
  routes: <GoRoute>[
    // Define the route for the home page
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: <GoRoute>[
        // Define the route for the weather page
        GoRoute(
          path: 'weather',
          builder: (context, state) => const Weather(),
        ),
        // Define the route for the calculator page
        GoRoute(
          path: 'calculator',
          builder: (context, state) => const Calculator(),
        ),
      ],
    ),
  ],
);
