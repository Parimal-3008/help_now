import 'dart:io';

import 'package:flutter/material.dart';
import 'package:help_now/notes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';
class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}
final _formKey = GlobalKey<FormState>();
// ignore: non_constant_identifier_names

final _dateController = TextEditingController();
class _AddState extends State<Add> {
  @override
  void initState() {
    // TODO: implement initState
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    super.initState();
  }
  String prod_ser;
String mode;
String name;
String contactinfo;
String amount;
File _image;
String str;DateTime d1;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Add')),
          backgroundColor: Colors.blue,
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person),
                  hintText: 'Enter your name',
                  labelText: 'Name',
                ),
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  icon: const Icon(Icons.phone),
                  hintText: 'Enter a phone number',
                  labelText: 'Phone',
                ),
                onChanged: (val) {
                  setState(() {
                    contactinfo = val;
                  });
                },
              ),
              Container(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: 'Product',
                            groupValue: prod_ser,
                            onChanged: (val) {
                              setState(() {
                                prod_ser = val;
                                print(prod_ser);
                              });
                            }),
                        Text(
                          'Product',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 'Service',
                            groupValue: prod_ser,
                            onChanged: (val) {
                              setState(() {
                                prod_ser = val;
                                print(prod_ser);
                              });
                            }),
                        Text('Service')
                      ],
                    ),
                  ],
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter the amt',
                  labelText: 'Amount ',
                ),
                onChanged: (val) {
                  setState(() {
                    amount = val;
                  });
                },
              ),
              Container(
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: 'Cash',
                            groupValue: mode,
                            onChanged: (val) {
                              setState(() {
                                mode = val;
                                print(mode);
                              });
                            }),
                        Text(
                          'Cash',
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 'Online',
                            groupValue: mode,
                            onChanged: (val) {
                              setState(() {
                                mode = val;
                                print(mode);
                              });
                            }),
                        Text('Online')
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 'Gpay',
                            groupValue: mode,
                            onChanged: (val) {
                              setState(() {
                                mode = val;
                                print(mode);
                              });
                            }),
                        Text('Gpay')
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      child: Text('Select date'),
                      onPressed: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));

                        setState(() {
                          str = DateFormat('dd-MM-yyyy').format(date);
                          d1=date;
                        });
                      }),
                  str != null ? Text(str) : Container(),
                ],
              ),
              RaisedButton(
                color: Colors.blue,
                child: Text('Upload Photo'),
                onPressed: () async {
                  final pickedFile =
                      await ImagePicker().getImage(source: ImageSource.gallery);
                  setState(() {
                    _image = File(pickedFile.path);
                  });
                },
              ),
              Container(
                  child: _image == null
                      ? Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 40.0,
                              ),
                            ],
                          ),
                        )
                      : Container(
                          child: Image.file(
                            _image,
                            fit: BoxFit.cover,
                          ),
                        )),
              Container(
                  padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                  child: new RaisedButton(
                    child: const Text('Submit'),
                    onPressed: () async {
                      {
                        Note n= Note(name: name,amount: amount,product_type: prod_ser,amount_type:mode,contact: contactinfo,createdTime: d1) ;
                          NotesDatabase.instance.create(n);
                          final Directory directory = await getExternalStorageDirectory();
                          String path=directory.path;
                          print(path);
                             final File newImage = await _image.copy('$path/image1.png');

                          setState(() {
                            Navigator.pop(context);
                          });
                          
                      }
                    },
                  )),
            
            ],
          ),
        ));
  }
}
