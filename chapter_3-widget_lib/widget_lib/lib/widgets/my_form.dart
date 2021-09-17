import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  FeedBackData _feedBackData = FeedBackData();
  GlobalKey<FormState> _formKey = GlobalKey();

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
          TextFormField(
            keyboardType: TextInputType.name,
            validator: _buildNotEmptyValidator('name'),
            onSaved: (val) => _feedBackData.name = val!.trim(),
            decoration: InputDecoration(
              hintText: 'Phoenix',
              labelText: 'Name',
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.name,
            validator: _buildNotEmptyValidator('favorite character'),
            onSaved: (val) => _feedBackData.favoriteCharacter = val!.trim(),
            decoration: InputDecoration(
              hintText: 'Tokyo',
              labelText: 'Favorite character',
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            validator: _buildNotEmptyValidator('reason'),
            onSaved: (val) => _feedBackData.reason = val!,
            decoration: InputDecoration(
              hintText: 'Because she is Tokyo!)',
              labelText: 'Reason',
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            validator: _buildNotEmptyValidator('email'),
            onSaved: (val) => _feedBackData.email = val!,
            decoration: InputDecoration(
              hintText: 'some@some.su',
              labelText: 'Email',
            ),
          ),
          OutlinedButton(
            onPressed: _sendForm(context),
            child: Text('Submit'),
          )
        ],
      ),
    );
  }

  String? Function(String? val) _buildNotEmptyValidator(String forAttr) {
    return (String? val) {
      if (val == null || val.isEmpty) {
        return 'Please enter your $forAttr';
      }
      return null;
    };
  }

  void Function() _sendForm(context) {
    return () {
      if (_formKey.currentState != null && _formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Thanks ${_feedBackData.name} for your feedback!'),
          ),
        );
      }
    };
  }
}

class FeedBackData {
  String name;
  String favoriteCharacter;
  String reason;
  String email;

  FeedBackData({
    this.name = "",
    this.favoriteCharacter = "",
    this.reason = "",
    this.email = "",
  });
}
