import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final bool registro;

  const Labels({@required this.ruta, this.registro = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          (!this.registro)
              ? Text(
                  "¿No tienes cuenta?",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                )
              : SizedBox(
                  height: 15,
                ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, this.ruta);
            },
            child: Text(
              (!this.registro) ? "Crea una ahora!" : "Usa tu cuenta!",
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
