import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/firebase_options.dart';
import 'package:weather_app/routes/app_router.dart';

class Location {
  double latitude;
  double longitude;

  Location({required this.latitude, required this.longitude});
}

final locationProvider = StateProvider<Location>(
    (ref) => Location(latitude: 27.1833, longitude: 78.0167));
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // Initialize Firebase using provided options
  );
  await dotenv.load(fileName: ".env");
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  MainApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final initialize = ref.watch(firebaseinitializerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
