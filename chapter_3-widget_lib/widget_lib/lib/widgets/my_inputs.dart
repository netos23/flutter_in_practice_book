import 'package:flutter/material.dart';

class MyInputs extends StatefulWidget {
  const MyInputs({Key? key}) : super(key: key);

  @override
  _MyInputsState createState() => _MyInputsState();
}

class _MyInputsState extends State<MyInputs> {
  SettingsData _settingsData = SettingsData();
  GlobalKey<FormState> _formKey = GlobalKey();

  final Map<String, int> _difficultyOptions = const {
    'Easy': 0,
    'Normal': 1,
    'Hard': 2,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: _buildBody(),
    );
  }

  Center _buildBody() {
    return Center(
      child: Card(
        elevation: 15,
        margin: const EdgeInsets.all(30),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Form _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTextOption(
            option: 'Permit notifications?',
            child: Checkbox(
              tristate: false,
              value: _settingsData.permitNotifications,
              onChanged: _setNotifications,
            ),
          ),
          Divider(),
          _buildTextOption(
              option: 'Send usage statistic',
              child: Switch(
                value: _settingsData.sendStatistic,
                onChanged: _setStatistic,
              )),
          Divider(),
          _buildTextOption(
              option: 'Volume',
              child: Slider(
                min: 0,
                max: 100,
                value: _settingsData.volume,
                onChanged: _setVolume,
              )),
          Divider(),
          _buildSettingsFooter()
        ],
      ),
    );
  }

  Padding _buildSettingsFooter() {
    return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Text('Difficulty'),
              _buildDifficulty(options: _difficultyOptions),
            ],
          ),
        );
  }

  Widget _buildDifficulty({required Map<String, int> options}) {
    return Column(
      children: options.entries.map(_mapToOption).toList(),
    );
  }

  Widget _mapToOption(MapEntry<String, int> e) {
    return _buildTextOption(
      option: e.key,
      child: Radio(
        value: e.value,
        groupValue: _settingsData.difficulty,
        onChanged: _setDifficulty,
      ),
    );
  }

  Widget _buildTextOption({required String option, required Widget child}) {
    return Row(
      children: [
        Expanded(child: Text(option)),
        child,
      ],
    );
  }

  void _setNotifications(bool? value) {
    setState(() => _settingsData.permitNotifications =
        value != null ? value : _settingsData.permitNotifications);
  }

  void _setStatistic(bool value) {
    setState(() => _settingsData.sendStatistic = value);
  }

  void _setVolume(double value) {
    setState(() => _settingsData.volume = value);
  }

  void _setDifficulty(int? value) {
    setState(() => _settingsData.difficulty =
    value != null ? value : _settingsData.difficulty);
  }
}

class SettingsData {
  bool sendStatistic;
  bool permitNotifications;
  double volume;
  int difficulty;

  SettingsData({
    this.sendStatistic = false,
    this.permitNotifications = false,
    this.volume = 0,
    this.difficulty = 0,
  });
}
