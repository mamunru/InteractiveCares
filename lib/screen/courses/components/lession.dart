import 'package:flutter/material.dart';

class LessionList extends StatelessWidget {
  const LessionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ListTile(
                  title: Text('Class Number ' + index.toString()),
                  subtitle: Text('This is the test '),
                ),
              ),
            );
          }),
    );
  }
}
