import 'package:flutter/material.dart';

import '../Model/store.dart';

class StepPage extends StatefulWidget {
  const StepPage({super.key});

  @override
  State<StepPage> createState() => _StepPageState();
}

class _StepPageState extends State<StepPage> {
  int currentStep=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper'),
      ),
      body: Column(
        children: [
          SizedBox(
            child: Stepper(
                steps: [
                  Step(

                      title: Text('Number 1'),
                      subtitle: Text('Course'),
                      state: StepState.indexed,
                      content: Text('Hello Mithila'),
                    isActive: currentStep==0

                  ),
                  Step(

                      title: Text('Number 1'),
                      subtitle: Text('Course'),
                      state: StepState.indexed,
                      content: Text('Hello Mithila'),
                      isActive: currentStep==1

                  ),
                  Step(

                      title: Text('Number 1'),
                      subtitle: Text('Course'),
                      state: StepState.indexed,
                      content: Text('Hello Mithila'),
                      isActive: currentStep==2

                  ),
                  Step(

                      title: Text('Number 1'),
                      subtitle: Text('Course'),
                      state: StepState.indexed,
                      content: Text('Hello Mithila'),
                      isActive: currentStep==3

                  ),



                ],

                onStepTapped: (int newIndex) {
                  setState(() {
                    currentStep = newIndex;
                  });
                },
                currentStep: currentStep,
                onStepContinue: () {
                  if (currentStep != 3) {
                    setState(() {
                      currentStep += 1;
                    });
                  }
                },

                onStepCancel: () {
                  if (currentStep != 0) {
                    setState(() {
                      currentStep -= 1;
                    });
                  }
                }


            ),
          )
        ],
      ),
    );
  }
}
