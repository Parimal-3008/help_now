import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'database_helper.dart';
import 'notes.dart';
import 'package:ext_storage/ext_storage.dart';

class Export extends StatefulWidget {
  @override
  _ExportState createState() => _ExportState();
}

final _formKey = GlobalKey<FormState>();


class _ExportState extends State<Export> {
  var date1;
String str;
var date2;
String str1;
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Export')),
          backgroundColor: Colors.blue,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      child: Text('From  date'),
                      onPressed: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));

                        setState(() {
                          str = DateFormat('dd-MM-yyyy').format(date);
                          date1 = date;
                        });
                      }),
                  str != null ? Text(str) : Container(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      child: Text('To  date'),
                      onPressed: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));

                        setState(() {
                          str1 = DateFormat('dd-MM-yyyy').format(date);
                          date2 = date;
                        });
                      }),
                  str1 != null ? Text(str1) : Container(),
                ],
              ),
              RaisedButton(
                  onPressed: () async {
                    List<List<dynamic>> rows = [];
                    List<dynamic> row = [];
                   
                    row.add("name");
                    row.add("contact");
                    row.add("product type");
                    row.add("amount");
                    row.add("amount type");
                    row.add("date");
                    rows.add(row);
                    List<Note> list =
                        await NotesDatabase.instance.readAllNotes();
                    for (int i = 0; i < list.length; i++) {
                      var res = list[i].createdTime;
                      if ((res.isAfter(date1) || res.isAtSameMomentAs(date1)) &&
                          (res.isBefore(date2) ||
                              res.isAtSameMomentAs(date2))) {
                        List<dynamic> r = [];
                       print(DateFormat('dd-MM-yyyy').format(list[i].createdTime) as String);
                        r.add(list[i].name);
                        r.add(list[i].contact);
                        r.add(list[i].product_type);
                        r.add(list[i].amount);
                        r.add(list[i].amount_type);
                        // ignore: unnecessary_cast
                        r.add(DateFormat('dd-MM-yyyy').format(list[i].createdTime) as String);
                        rows.add(r);
                      }
                    }
                      String csv = const ListToCsvConverter().convert(rows);
                     String dir = await ExtStorage.getExternalStoragePublicDirectory(ExtStorage.DIRECTORY_DOWNLOADS);
                      print("dir $dir");
                      String file = "$dir";
                      File f = File(file + "/filename.csv");
                      f.writeAsString(csv);
                      setState(() {
                        Navigator.pop(context);
                      });
                    
                  },
                  child: Text('Read Saved data'))
            ],
          ),
        ));
  }
}
