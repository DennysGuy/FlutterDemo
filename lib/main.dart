import 'package:flutter/material.dart'; //brings in all necessary packages

void main() {
  runApp(const MyApp()); //runs app
}

class MyApp extends StatelessWidget { //not changing based on the interaction of the program
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matts Application',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

    @override 
    Widget build(BuildContext context) {
        return Scaffold(appBar: AppBar(
          title: const Text('Bunkys Application')), 
          body: TextInputWidget()
          ); //sets up basic structure of a page
    }
}

class TextInputWidget extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _TextInputWidgetState createState() => _TextInputWidgetState();
}


class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  String text = "";

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void changeText(text) {
    if (text == "Hello World!") {
      controller.clear();
      text = "";
    }
    
    setState(() {
      this.text = text;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        controller: this.controller,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.message), 
          labelText: "Type a message:"),
          onChanged: (text) => changeText(text), 
      ),
      Text(this.text)]) ;
  }
}

