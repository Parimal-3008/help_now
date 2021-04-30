import 'package:flutter/material.dart';

import 'add.dart';
import 'database_helper.dart';
import 'export.dart';
import 'notes.dart';

class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}
List <Widget> li=[];
class _DisplayState extends State<Display> {
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Center(child: Text('HelpNow')),
          backgroundColor: Colors.blue,
        ),
        body: ListView(children:[
           Container(
            child: Card(
              child: ListTile(
                leading: CircleAvatar(foregroundImage: AssetImage('images/fide-logo.png'),),
                title: Text('Name-Contact'),
                subtitle: Text('date'),
                trailing: Text('amt'),
              ),
            ),
          ),
           Container(
            child: Card(
              child: ListTile(
                leading: CircleAvatar(foregroundImage: AssetImage('images/fide-logo.png'),),
                title: Text('Name-Contact'),
                subtitle: Text('date'),
                trailing: Text('amt'),
              ),
            ),
          ),
         Container(
            child: Card(
              child: ListTile(
                leading: CircleAvatar(foregroundImage: AssetImage('images/fide-logo.png'),),
                title: Text('Name-Contact'),
                subtitle: Text('date'),
                trailing: Text('amt'),
              ),
            ),
          ),
         Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       PopupMenuButton(
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              value: 'add',
                              child: Text('Add'),
                            ),
                            PopupMenuItem(
                              value: 'export',
                              child: Text('Export'),
                            )
                          ];
                        },
                        onSelected: (value){
                          setState(() {
                             if(value=='export')
                             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Export()));

                            else
                             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Add()));

                            
                          });
                           

                  },
                  offset: Offset.fromDirection(0,10),
                  icon: Icon( Icons.add,),
                  
                ),
                     ],
                   ),
        ]),
        );
  }
}
/*
 

             */