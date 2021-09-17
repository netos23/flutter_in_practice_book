import 'package:flutter/material.dart';

class MyStepper extends StatefulWidget {
  const MyStepper({Key? key}) : super(key: key);

  @override
  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int _currentStep = 0;

  List<StepData> _steps = [
    StepData(
      title: 'Get Ready!',
      content: 'Watch season 1',
    ),
    StepData(
      title: 'Bella ciao!',
      content: 'Watch season 2',
    ),
    StepData(
      title: 'Don\'t be upset!',
      content: 'Watch season 3',
    ),
    StepData(
      title: 'Adapt!',
      content: 'Watch season 4',
    ),
    StepData(
      title: 'What to do?!',
      content: 'Watch season 5',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Watch list')),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepContinue: _currentStep < _steps.length - 1 ? incrementStep : null,
        onStepCancel: _currentStep > 0 ? decrementStep : null,
        steps: _buildSteps(_steps),
      ),
    );
  }

  incrementStep() => setState(() {
        _currentStep++;
      });

  decrementStep() => setState(() {
        _currentStep--;
      });

  List<Step> _buildSteps(List<StepData> steps) {
    int index = 0;
    return steps
        .map((st) => Step(
              title: Text(st.title),
              content: Text(st.content),
              state: index >= _currentStep
                  ? StepState.indexed
                  : StepState.complete,
              isActive: index++ >= _currentStep,
            ))
        .toList();
  }
}

class StepData {
  String title;
  String content;

  StepData({required this.title, required this.content});
}
