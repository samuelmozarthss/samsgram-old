import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key? key, this.title = 'Samsgram'}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}
class RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: PageView(

        ),
      ),
    );
  }
}