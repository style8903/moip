import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moip/firebase_options.dart';
import 'package:moip/router.dart';

import 'constants/color_schemes.dart';

void main() async {
  //firebase 초기화가 확정된후에 앱 실행
  WidgetsFlutterBinding.ensureInitialized();
  //firebase 초기화
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MoipApp(),
    ),
  );
}

class MoipApp extends ConsumerWidget {
  const MoipApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      title: 'Moip App',
      //향 후 글로벌 언어 지원시 intl추가
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      ),
    );
  }
}