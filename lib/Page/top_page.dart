import 'package:flutter/material.dart';

class TopPage extends StatefulWidget {
  const TopPage({super.key});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {

    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"),value: "USA"),
      DropdownMenuItem(child: Text("Canada"),value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
      DropdownMenuItem(child: Text("England"),value: "England"),
    ];


  String ?selectedValue = null;
  final _dropdownFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child:  Form(
          key: _dropdownFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField(

                  validator: (value) => value == null ? "Select a country" : null,

                  value: selectedValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: menuItems),
              ElevatedButton(
                  onPressed: () {
                    if (_dropdownFormKey.currentState!.validate()) {
                      print(_dropdownFormKey.currentState!.validate());
                    }
                  },
                  child: Text("Submit"))
            ],
          ),
        )
      ),
    );
  }
}
