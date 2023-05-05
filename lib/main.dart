import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seenit/features/account/screens/login_screen.dart';
import 'package:seenit/provider/comments_provider.dart';
import 'package:seenit/provider/posts_provider.dart';
import 'package:seenit/routes.dart';
import 'package:seenit/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostsProvider>(
            create: (context) => PostsProvider()),
        ChangeNotifierProvider<CommnetsProvider>(
            create: (context) => CommnetsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Seenit',
        theme: Pallete.darkModeAppTheme,
        home: const LoginScreen(),
        onGenerateRoute: (settings) => generateRoute(settings),
      ),
    );
  }
}
