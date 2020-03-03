import 'package:flutter/material.dart';
import 'package:demo6/homepage.dart';
import 'dart:io';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';



void main() => runApp(MyHome());

class MyHome extends StatelessWidget {
  


  
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Exple Form';
    return MaterialApp(
      title : appTitle,
      initialRoute: '/', routes: { '/homepage' : (context) => Homepage()},
      home: MyApp(title : appTitle),
    );
  }
}

class MyApp extends StatelessWidget {
  final String title;
  MyApp({Key key,this.title}) : super(key : key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      drawer: Drawer(child: Drawer(child: ListView(children: <Widget>[
        DrawerHeader(child: Text('Drawer Header'),
        decoration: BoxDecoration(color: Colors.blue),
              ),
                ListTile(title: Text('HomePage'),
                  onTap: () {
                    Navigator.pushNamed(context, '/homepage');
                  },),
                ListTile(title: Text('Item 2'),
                  onTap: () {},)
            ],
          ),
        ),
      ),
          body: Center(
          child : ListView(children: <Widget>[
          MyRadio(),
        ],)
      ),
    );
  }
    

}

class MyRadio extends StatefulWidget {
  MyRadio({Key key}) : super(key: key);

  @override
  _MyRadioState createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  @override
String sex;
bool checkboxValueA = true;
bool checkboxValueB = true;
List<String> provices = ['','BKK','Pathumthani','Outbound'];
  String provice = '';
final _format = DateFormat('dd/MM/yyyy');  
File _avatar;

  DateTimeField buildDateField() {
    return DateTimeField(
      decoration: InputDecoration(labelText: 'Birth Date'),
      format: _format,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
    );
  }

  onChooseImage() async{
    File image = await ImagePicker.pickImage(source: ImageSource.camera);
      setState(() {
        _avatar = image;
      });
  }

  InputDecorator buildSelectField() {
      return InputDecorator(
        decoration: InputDecoration(labelText: 'Province'),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: provice,
            onChanged: (value) {
              setState(() {
                provice = value;
              });
            },
              items: provices
                .map((value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                ),
                
            ).toList(),
          ),
        ),
      );
    }

  Widget build(BuildContext context) {
    return Container(
      child: Column(mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(children: <Widget>[
            Radio(value: "M",
                  groupValue: sex,
                  onChanged: (value) {
                    setState(() {
                      sex = value;
                    });
                  },
            ), Text('Male'),
                Radio(value: 'F',
                      groupValue: sex,
                      onChanged: (value) {
                        setState(() {
                          sex = value;
                        });
                      },),
                      Text('Female'),
          ]),
          Row(children: <Widget>[Text('$sex')],),
          Row(children: <Widget>[
            Checkbox(
              value: checkboxValueA,
              onChanged: (bool value) {
                setState(() {
                  checkboxValueA = value;
                });
              },
            ),
            Text('CHecKBox A'),
              Checkbox(value: checkboxValueB,
                onChanged: (bool value) {
                  setState(() {
                    checkboxValueB = value;
                  });
                },
              ),
              Text('CheckBox B'),
            ],
          ),
          Row(children: <Widget>[
              Text('$checkboxValueA'),
              Text('$checkboxValueB')
            ],
          ),
            buildSelectField(),
            buildDateField(),
            _avatar == null
             ? RaisedButton(child: Text('Choose Avatar'),
              onPressed: () {
                onChooseImage();
              },

            ) : Image.file(_avatar)
        ],
      )
    );
  }
}