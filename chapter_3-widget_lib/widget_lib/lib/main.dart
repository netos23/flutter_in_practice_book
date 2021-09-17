import 'package:flutter/material.dart';
import 'package:widget_lib/widgets/my_bottom_nav_bar.dart';
import 'package:widget_lib/widgets/my_dialogs.dart';
import 'package:widget_lib/widgets/my_form.dart';
import 'package:widget_lib/widgets/my_inputs.dart';
import 'package:widget_lib/widgets/my_scaffold.dart';
import 'package:widget_lib/widgets/my_stepper.dart';
import 'package:widget_lib/widgets/my_tab_bar.dart';
import 'package:widget_lib/widgets/my_time_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Casa de papel',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: WidgetLib(title: 'Casa de papel'),
    );
  }
}

class WidgetLib extends StatefulWidget {
  WidgetLib({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _WidgetLibState createState() => _WidgetLibState();
}

class _WidgetLibState extends State<WidgetLib> {
  List<NamedWidget> widgets = [
    NamedWidget(
      name: "Songs (Scaffold)",
      widget: MyScaffold(),
    ),
    NamedWidget(
      name: "Characters (BottomNavigationBar)",
      widget: MyBottomNavigationBar(),
    ),
    NamedWidget(
      name: "Seasons (TabBar)",
      widget: MyTabBar(),
    ),
    NamedWidget(
      name: "Watch list (Stepper)",
      widget: MyStepper(),
    ),
    NamedWidget(
      name: "Submit feedback (Form)",
      widget: MyForm(),
    ),
    NamedWidget(
      name: "Settings (Input)",
      widget: MyInputs(),
    ),
    NamedWidget(
      name: "Schedule (Date picker)",
      widget: MyDatePicker(),
    ),
    NamedWidget(
      name: "Quiz (Dialogs)",
      widget: MyDialogs(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: widgets.length * 2,
        itemBuilder: (context, item) {
          var index = item ~/ 2;
          return item.isEven
              ? ListTile(
                  title: Text(widgets[index].name),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => widgets[index].widget),
                  ),
                )
              : Divider();
        },
      ),
    );
  }
}

class NamedWidget {
  String name;
  Widget widget;

  NamedWidget({required this.name, required this.widget});
}
