import 'package:chat/src/helpers/mostrar_alerta.dart';
import 'package:chat/src/services/auth_service.dart';
import 'package:chat/src/services/socket_service.dart';
import 'package:chat/src/widgets/custom_boton_azul.dart';
import 'package:chat/src/widgets/custom_input.dart';
import 'package:chat/src/widgets/custom_header_logo.dart';
import 'package:chat/src/widgets/custom_leabels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeaderLogo(
                  titulo: "Registro",
                ),
                _Form(),
                Labels(
                  ruta: "login",
                  registro: true,
                ),
                Text(
                  "Términos y condiciones de uso",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  _Form({Key key}) : super(key: key);

  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.perm_identity,
            placeHolder: 'Nombre',
            textController: nameController,
            keyBoardType: TextInputType.text,
          ),
          CustomInput(
            icon: Icons.mail_outline,
            placeHolder: 'Correo',
            textController: emailController,
            keyBoardType: TextInputType.emailAddress,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeHolder: 'Contraseña',
            textController: passwordController,
            isPassword: true,
          ),
          BotonAzul(
            texto: "Crear cuenta",
            onPressed: authService.autenticando
                ? null
                : () async {
                    FocusScope.of(context).unfocus();

                    final registroOk = await authService.register(
                        nameController.text.trim(),
                        emailController.text.trim(),
                        passwordController.text.trim());

                    if (registroOk == true) {
                      //navegar
                      socketService.connect();
                      Navigator.pushReplacementNamed(context, "usuarios");
                    } else {
                      //alerta
                      mostrarAlerta(context, "Registro incorrecto", registroOk);
                    }
                  },
          )
        ],
      ),
    );
  }
}
