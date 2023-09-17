import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _tempreturecontroller = TextEditingController();
  final list = ["Celsius", "Kelvin", "Fahrenheit"];
  String _selected = "Celsius";
  double cel = 0;
  double far = 0;
  double kel = 0;
  void calculate(String val) {
    // (0°C × 9/5) + 32 = 32°F
    if (val.isEmpty) {
      cel = 0;
      far = 0;
      kel = 0;
    }
    if (_selected == "Celsius") {
      cel = double.parse(val);
      far = cel * 1.8 + 32;
      kel = cel + 273.15;
      far.toStringAsFixed(2);
      kel.toStringAsFixed(2);
      cel.toStringAsFixed(2);
    } else if (_selected == "Kelvin") {
      kel = double.parse(val);
      cel = kel - 273.15;
      far = cel * 1.8 + 32;
      cel.toStringAsFixed(2);
      far.toStringAsFixed(2);
      kel.toStringAsFixed(2);
    } else if (_selected == "Fahrenheit") {
      print(_selected);
      far = double.parse(val);
      cel = (32 * far - 32) * 1.8;
      kel = cel + 273.15;
      cel.toStringAsFixed(2);
      kel.toStringAsFixed(2);
      far.toStringAsFixed(2);
    }
  }

  List<DropdownMenuItem<String>> _createList() {
    return list
        .map<DropdownMenuItem<String>>(
          (e) => DropdownMenuItem(
            value: e,
            child: Text(e),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 20, 69, 109),
          title: const Text(
            "Temperature Converter",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        body: Container(
          color: Color.fromARGB(255, 20, 69, 109),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        controller: _tempreturecontroller,
                        // initialValue: '32',
                        decoration: InputDecoration(
                          labelText: 'Enter the value',
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(
                            Icons.error,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(width: (MediaQuery.of(context).size.height / 3)),
                  DropdownButton(
                    items: _createList(),
                    // onTap: () {
                    //   print(_selected);
                    // },
                    onChanged: (value) {
                      setState(() {
                        _selected = value.toString();
                        calculate(
                            _tempreturecontroller.text.replaceAll(" ", ""));
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "$_selected",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width / 4),
                height: size.height / 16,
                width: size.width,
                child: ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      calculate(_tempreturecontroller.text.replaceAll(" ", ""));
                    }),
                    print(_tempreturecontroller.text),
                  },
                  child: Text(
                    "Convert",
                    style: TextStyle(
                        fontSize: size.width / 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Expanded(
                  child: Container(
                color: Color.fromARGB(255, 20, 69, 109),
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Text(
                              "${cel}° ",
                              softWrap: true,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 235, 119, 84),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Celcious",
                              style: TextStyle(
                                  color: Colors.amber[400],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Text(
                              "${kel}°  ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 235, 119, 84),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Kelvin",
                              style: TextStyle(
                                  color: Colors.amber[400],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Text(
                              "${far}0° ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 235, 119, 84),
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Fahrenheit",
                              style: TextStyle(
                                  color: Colors.amber[400],
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ))
            ],
          ),
        ));
  }
}
