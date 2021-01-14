import 'package:flutter/material.dart';

class HeaderLogo extends StatelessWidget {
  final String titulo;

  const HeaderLogo({@required this.titulo});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        width: 130,
        child: Column(
          children: [
            Image(
              image: AssetImage("assets/logo.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.titulo,
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
