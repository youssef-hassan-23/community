import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mica_community_2/src/features/feed/data/implements/implements.dart';
import 'package:mica_community_2/src/features/feed/data/sources/sources.dart';
import 'package:mica_community_2/src/features/feed/domain/usecases/feed_usecases.dart';
import 'package:provider/provider.dart';
import 'dependency_injections.dart';
import 'firebase_options.dart';
import 'src/core/providers/user_provider.dart';
import 'src/core/theme/app_theme.dart';
import 'src/features/Home/pages/home_page.dart';
import 'src/features/add_post/presentation/add_post_bloc/add_post_bloc.dart';
import 'src/features/add_post/presentation/provider/post_image_provider.dart';
import 'src/features/authentication/presentation/pages/login_screen.dart';
import 'src/features/Home/provider/pages_provider.dart';
import 'src/features/authentication/presentation/provider/login_provider.dart';
import 'src/features/authentication/presentation/provider/sign_up_provider.dart';
import 'src/features/feed/presentation/bloc/feed_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignUpProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => getIt<LoginProvider>()),
        ChangeNotifierProvider(create: (context) => PostImageProvider()),
        ChangeNotifierProvider(create: (context) => PagesProvider()),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => AddPostBloc()),
        BlocProvider(
            create: (context) => FeedBloc(
                GetFeedUseCase(FeedRepositoryImp(FeedRemoteDataSourceImpl())))),
      ], child: const MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<UserProvider>().primaryModeTheme
          ? AppTheme.getLightTheme(context)
          : AppTheme.getDarkTheme(context),
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null
          ? const LoginScreen()
          : HomePage(),
    );
  }
}
