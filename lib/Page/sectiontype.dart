import 'package:flutter/material.dart';

import '../Model/store.dart';

class SectionType extends StatefulWidget {
  const SectionType({super.key});

  @override
  State<SectionType> createState() => _SectionTypeState();
}

class _SectionTypeState extends State<SectionType> {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("USA"),value: "USA"),
    DropdownMenuItem(child: Text("Canada"),value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
    DropdownMenuItem(child: Text("England"),value: "England"),
  ];
TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  String selectedValue=' ';
  List<Section>section=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Section Type'),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                 Row(
                   children: [
                     Expanded(
                         flex: 2,
                         child:TextFormField(
                           controller: nameController,
                       decoration: InputDecoration(
                         hintText: 'Name',border: OutlineInputBorder()
                       ),

                     )),
                     SizedBox(
                       width: 10,
                     ),
                     Expanded(
                         flex: 2,
                         child:TextFormField(
                           controller: emailController,
                           decoration: InputDecoration(
                               hintText: 'Email',border: OutlineInputBorder()
                           ),
                         )),
                     SizedBox(
                       width: 10,
                     ),
                  Expanded(child: DropdownButtonFormField(
                      onSaved: (section)=>selectedValue,
                      validator: (value) => value == null ? "Select a country" : null,
                      items: menuItems,
                      onChanged: (String  ?newvalue){
                        setState(() {
                          selectedValue=newvalue!;
                        });
                      }))

                   ],
                 )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(onPressed: (){
             String name=nameController.text.trim();
             String email=emailController.text.trim();
             String selec=selectedValue!;
             if(name.isNotEmpty && email.isNotEmpty && selec.isNotEmpty){
               setState(() {

               });
               section.add(Section(name: name, email: email, selectedvalue: selectedValue));
             }
          },
              child: Text('Submit')),
          SizedBox(
            height: 10,
          ),
          Expanded(child: 
          ListView.builder(
            itemCount: section.length,
              itemBuilder: (context,index){
                return Card(
                  child: ListTile(
                    title: Text(section[index].name),
                    subtitle: Text(section[index].email),
                    trailing:Text(section[index].selectedvalue.toString()) ,
                  ),
                );
              }))
        ],
      ),
    );
  }
}
