import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Neivor test',
      theme: ThemeData(primaryColor: Colors.white),
      home: const MyHomePage(title: 'Registrar visita'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentStep = 0;
  bool _value = true;
  String? selectedOption = "Option 1";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  if (_currentStep > 0) {
                    setState(() {
                      _currentStep--;
                    });
                  }
                },
                color: Colors.white,
              ),
              title: Text(widget.title, style: TextStyle(color: Colors.white)),
              backgroundColor: Color.fromARGB(255, 255, 113, 113)),
          body: Column(
            children: <Widget>[
              LinearProgressIndicator(
                value: _currentStep / 4,
                color: Color.fromARGB(255, 255, 89, 89),
                backgroundColor: Colors.white,
                minHeight: 20, // Divide by the total number of steps
              ),
              Expanded(
                child: Stepper(
                  type: StepperType.horizontal,
                  controlsBuilder: (context, details) {
                    return Container();
                  },
                  currentStep: _currentStep,
                  steps: [
                    Step(
                        title: Text("Step 1"),
                        content: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              children: [
                                Text("Datos de la visita",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w500)),
                                Form(
                                    key: formKey,
                                    child: Column(children: [
                                      TextFormField(
                                        decoration: InputDecoration(
                                            labelText: "Nombre y apellido"),
                                        onSaved: (value) {
                                          // Save the name
                                        },
                                      ),
                                      TextFormField(
                                        decoration:
                                            InputDecoration(labelText: "DNI"),
                                        onSaved: (value) {
                                          // Save the name
                                        },
                                      ),
                                    ])),
                              ],
                            ))),
                    Step(
                        title: Text("Step 2"),
                        content: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              children: [
                                Text("Algunos datos más",
                                    style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.w500)),
                                Form(
                                    child: Column(children: [
                                  Row(
                                    children: [
                                      Text("Visita de varios días",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400)),
                                      Expanded(
                                          child: Transform.scale(
                                              scale: 1.5,
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 80.0),
                                                child: Switch(
                                                    value: _value,
                                                    activeTrackColor:
                                                        Color.fromARGB(
                                                            255, 59, 191, 173),
                                                    inactiveTrackColor:
                                                        Colors.grey,
                                                    activeColor: Colors.white,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        _value = value;
                                                      });
                                                    }),
                                              )))
                                    ],
                                  ),
                                  Row(
                                    children: [],
                                  ),
                                  Container(
                                    width: 325,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    child: DropdownButton<String>(
                                      value: selectedOption,
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedOption = newValue;
                                        });
                                      },
                                      items: options.map((String option) {
                                        return DropdownMenuItem<String>(
                                          value: option,
                                          child: Text(option),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text("¿Vienes en coche?",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400)),
                                      Expanded(
                                          child: Transform.scale(
                                              scale: 1.5,
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(left: 80.0),
                                                child: Switch(
                                                    value: _value,
                                                    activeTrackColor:
                                                        Color.fromARGB(
                                                            255, 59, 191, 173),
                                                    inactiveTrackColor:
                                                        Colors.grey,
                                                    activeColor: Colors.white,
                                                    onChanged: (bool value) {
                                                      setState(() {
                                                        _value = value;
                                                      });
                                                    }),
                                              )))
                                    ],
                                  ),
                                ])),
                              ],
                            ))),
                    Step(
                      title: Text("Step 3"),
                      content: Text("This is step 3"),
                    ),
                    Step(
                      title: Text("Step 4"),
                      content: Text("This is step 4"),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: Container(
            width: 325,
            height: 45,
            child: FloatingActionButton(
              backgroundColor: Color.fromARGB(255, 255, 89, 89),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
              child: Text("Siguiente"),
              onPressed: () {
                if (_currentStep < 3) {
                  setState(() {
                    _currentStep++;
                  });
                }
              },
            ),
          )),
    );
  }
}
