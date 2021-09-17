import 'package:flutter/material.dart';

class MyDialogs extends StatefulWidget {
  const MyDialogs({Key? key}) : super(key: key);

  @override
  _MyDialogsState createState() => _MyDialogsState();
}

class _MyDialogsState extends State<MyDialogs> {
  int _currentStep = 0;

  late List<QuestionData> _steps = [
    QuestionData(
      title: 'Character',
      question: 'Which character died first?',
      answers: [
        'Oslo',
        'Berlin',
        'Nairobi',
      ],
      rightAnswerIndex: 0,
      showAnswers: _showSimpleDialog,
    ),
    QuestionData(
      title: 'Place',
      question: 'Which bank is robbed first?',
      answers: [
        'The First World Bank',
        'Mint',
      ],
      rightAnswerIndex: 1,
      showAnswers: _showSimpleDialog,
    ),
    QuestionData(
      title: 'Time',
      question: 'What time do the events of the series take place?',
      answers: [
        'Past',
        'Future',
        'Nowadays',
      ],
      rightAnswerIndex: 1,
      showAnswers: _showSimpleDialog,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Watch list')),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _currentStep,
        onStepContinue:
            _currentStep < _steps.length ? _incrementStep(context) : null,
        onStepCancel: _currentStep > 0 ? _decrementStep(context) : null,
        steps: _buildSteps(_steps),
      ),
    );
  }

  _incrementStep(BuildContext context) {
    return () {
      _steps[_currentStep].showAnswers(context).then((value) {
        if (value != null && value) {
          setState(() {
            _steps[_currentStep].isCompleted = true;
            if (_currentStep < _steps.length - 1) {
              _currentStep++;
            }
          });
        }
      });
    };
  }

  _decrementStep(BuildContext context) {
    return () {
      setState(() {
        _currentStep--;
      });
    };
  }

  Future<bool?> _showSimpleDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => SimpleDialog(
        children: [Question(data: _steps[_currentStep])],
      ),
    );
  }

  List<Step> _buildSteps(List<QuestionData> steps) {
    int index = 0;
    return steps
        .map((st) => Step(
              title: Text(st.title),
              content: Text(st.question),
              state: index >= _currentStep
                  ? StepState.indexed
                  : StepState.complete,
              isActive: index++ >= _currentStep,
            ))
        .toList();
  }
}

class QuestionData {
  final String title;
  final String question;
  final List<String> answers;
  final int rightAnswerIndex;
  final Future<bool?> Function(BuildContext context) showAnswers;
  bool isCompleted;

  QuestionData({
    required this.title,
    required this.question,
    required this.answers,
    required this.rightAnswerIndex,
    required this.showAnswers,
    this.isCompleted = false,
  });
}

class Question extends StatefulWidget {
  final QuestionData data;

  const Question({Key? key, required this.data}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int _answer = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.data.question,
              style: Theme.of(context).textTheme.headline5,
            ),
            Column(
              children: _buildAnswers(),
            ),
            OutlinedButton(
              onPressed: () => Navigator.pop(
                  context, _answer == widget.data.rightAnswerIndex),
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAnswers() {
    int index = 0;
    return widget.data.answers
        .map((e) => MapEntry(e, index++))
        .map((e) => _mapToAnswer(e))
        .toList();
  }

  Widget _mapToAnswer(MapEntry<String, int> e) {
    return _buildAnswer(
      option: e.key,
      child: Radio(
        value: e.value,
        groupValue: _answer,
        onChanged: _setAnswer,
      ),
    );
  }

  Widget _buildAnswer({required String option, required Widget child}) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(child: Text(option)),
            child,
          ],
        ),
      ),
    );
  }

  void _setAnswer(int? value) {
    if (value != null)
      setState(() {
        _answer = value;
      });
  }
}
