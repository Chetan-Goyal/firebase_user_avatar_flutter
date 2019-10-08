import 'package:firebase_user_avatar_flutter/auth_widget.dart';
import 'package:firebase_user_avatar_flutter/auth_widget_builder.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_auth_service.dart';
import 'package:firebase_user_avatar_flutter/services/image_picker_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MultiProvider for top-level services that can be created right away
    return MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(
          builder: (_) => FirebaseAuthService(),
        ),
        Provider<ImagePickerService>(
          builder: (_) => ImagePickerService(),
        ),
      ],
      // child: MaterialApp(
      //   theme: ThemeData(primarySwatch: Colors.indigo),
      //   home: AuthWidgetBuilder(
      //       builder: (BuildContext context, AsyncSnapshot<User> userSnapshot) {
      //     return AuthWidget(userSnapshot: userSnapshot);
      //   }),
      // ),
      child: AuthWidgetBuilder(
          builder: (BuildContext context, AsyncSnapshot<User> userSnapshot) {
        return MaterialApp(
          theme: ThemeData(primarySwatch: Colors.indigo),
          home: AuthWidget(userSnapshot: userSnapshot),
        );
      }),
    );
  }
}
