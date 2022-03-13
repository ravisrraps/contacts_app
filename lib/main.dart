import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoho/login.dart';
import 'package:zoho/services/authentication_service.dart';
import 'package:zoho/services/download_service.dart';
import 'package:zoho/services/upload_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: ((context) => AuthenticationService(FirebaseAuth.instance)),
        ),
        Provider(create: (context) => UploadService(FirebaseAuth.instance)),
        Provider(create: (context) => DownloadService()),
        StreamProvider<User?>(
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges,
            initialData: null),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyLogin(),
      ),
    );
  }
}
