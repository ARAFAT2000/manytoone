import 'package:flutter/material.dart';

import '../Model/store.dart';

class OnePageHandle extends StatefulWidget {
  const OnePageHandle({super.key});

  @override
  State<OnePageHandle> createState() => _OnePageHandleState();
}

class _OnePageHandleState extends State<OnePageHandle> {
  List<Handler>handle=[];
  List<Separate>separate=[];
  TextEditingController firstname= TextEditingController();
  TextEditingController secondtname= TextEditingController();

  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("USA"),value: "USA"),
    DropdownMenuItem(child: Text("Canada"),value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
    DropdownMenuItem(child: Text("England"),value: "England"),
  ];
  String ?selectedValue = null;
  bool isSwitch= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Need Help'),
      ),
      body: Column(
        children: [

          Switch(value: isSwitch,
              onChanged: (value){
             setState(() {
               isSwitch=value;
             });
              }),
          Center(
            child: isSwitch==false? Text('No Data'):


          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              child: Column(
                children: [
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: firstname,
                          decoration: InputDecoration(
                              hintText: 'First Name',
                              border: OutlineInputBorder(
                              )
                          ),
                        )),
                    Expanded(
                    flex: 2,
                        child: DropdownButtonFormField(
                            onSaved: (handle)=>selectedValue,
                            validator: (value) => value == null ? "Select a country" : null,
                            value: selectedValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                            items: menuItems),
                    )
                  ],
                ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: secondtname,
                    decoration: InputDecoration(
                        hintText: 'Second Name',
                        border: OutlineInputBorder(
                        )
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
     Row(
       children: [
         ElevatedButton(
             onPressed: (){
               String first= firstname.text.trim();
               String second= secondtname.text.trim();
               String selec=selectedValue!;

               if(first.isNotEmpty && second.isNotEmpty && selec.isNotEmpty){
                 setState(() {

                 });

                 handle.add(Handler(
                     firstname: first,
                     lastname: second,
                     selectedValue: selec));


               }
             },
             child: Text('Submit')),
         InkWell(
            onTap: ItemTap,
             child: Text('USA'))
       ],
     )




                ],
              ),
            ),
          ),),
          Expanded(
            child: ListView.builder(
                itemCount: handle.length,
                itemBuilder: (context,index){

                    return Card(
                      child: ListTile(
                        title: Text( handle[index].firstname),
                        subtitle:  Text(handle[index].lastname),
                         leading: Text(handle[index].selectedValue),
                      ),
                    );


                }),
          )
        ],
      ),
    );
  }
 void  ItemTap(){
    if(selectedValue=='USA' ){
      String section=selectedValue!;

     setState(() {
       separate.add(Separate(selectedValue: section));
     });
    }

 }
}
