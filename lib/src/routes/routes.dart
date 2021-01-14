import 'package:chat/src/pages/chat_page.dart';
import 'package:chat/src/pages/loading_page.dart';
import 'package:chat/src/pages/login_page.dart';
import 'package:chat/src/pages/register_page.dart';
import 'package:chat/src/pages/usuarios_page.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  "usuarios": (_) => UsuariosPage(),
  "registro": (_) => RegisterPage(),
  "login": (_) => LoginPage(),
  "loading": (_) => LoadingPage(),
  "chat": (_) => ChatPage(),
};
