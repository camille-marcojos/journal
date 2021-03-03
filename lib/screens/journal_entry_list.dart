import 'package:flutter/material.dart';


class EntriesListScreen extends StatelessWidget {

  static const routeName = 'journal_entries';

  final items = List<Map>.generate(10000, (i) {
    return {
      'title': 'Jopurnal entry $i',
      'subtitle': 'Subtitle text for $i',
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Journal Entries')),
      body:  Center(child: ListView.builder(itemBuilder: (context, index) {
          print('Creating item $index');
          return ListTile( 
            leading: FlutterLogo(),
            trailing: Icon(Icons.more_horiz),
            title: Text('Journal Entry ${items[index]['title']}'),
            subtitle: Text('Example ${items[index]['subtitle']}')
          );
        })
      ),
    );
  }
} 