import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSwitch= false;
  bool isSwitchnew= false;
  double number=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           appBar: AppBar(
             title: Text('Hello,Flutter Developer '),
           ),

      body: Column(
        children: [
          Text('Slider '),
          Slider(value:number,
              max: 20,
              divisions: 4,

              label: number.round().toString(),
              onChanged: (value){
                number=value;
                if(number==0){
                  print('Minimum= 0.01');
                }else if(number==5){
                  print('Minimum= 0.02');
                } else if(number== 10){
                  print('Minimum= 0.003');
                }
                else if(number== 15){
                  print('Minimum= 0.0004');
                }else{
                  print('Minimum= 1');
                }
                setState(() {
                });
              }),
          Center(
            child: number ==5  ?Text('This is 5'):null,
          ),
          Center(
            child: number ==5  ?Text('This is 5'):number==10?Text('This is 10'):number==15?Text('This is 15'):number==20?Text('This is 20'):null,
          ),
SizedBox(
  height: 100,
),

       Row(
         children: [
           Center(
             child: isSwitch==false?Text('Tap It'):Text('Close it'),
           ),
           Switch(
               value: isSwitch,
               onChanged: (value){
                 isSwitch=value;
                 if(isSwitch==false){
                   print('Turn Off');
                   Text('Turn Off Brother');
                 }else{
                   print('Turn On');

                   Text('Turn On Brother');
                 }
                 setState(() {
                 });
               }),
           Text('Close Button'),
         ],
       ),
          Center(child: isSwitch==true ?
            Column(
            children: [
              ElevatedButton(onPressed: (){}, child: Text('Number1')),
              ElevatedButton(onPressed: (){}, child: Text('Number2')),
            ],
          ):Text('Sorry'),),



        ],
      ),
    );
  }

}

