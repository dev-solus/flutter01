import 'package:flutter/material.dart';

import 'card_widget.dart';
import 'config_subject_controller.dart';
import 'config_subject_model.dart';

class ConfigSubjectScreen extends StatelessWidget {
  ConfigSubjectScreen({super.key});

  final _this = ConfigSubjectController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: StreamBuilder(
        stream: _this.dataSource,
        builder: (BuildContext context,
            AsyncSnapshot<List<ConfigSubject>> snapshot) {
          if (snapshot.hasData) {
            var list = snapshot.data!;

            // return Flex(
            //   direction: Axis.vertical,
            //   children: list.map((e) {
            //     return Expanded(
            //       child: CardItemWidget(item: e),
            //     );
            //   }).toList(),
            // );

            // return Text(s!.name);
            return ListView.builder(
              // separatorBuilder: (context, index) =>
              //     Divider(color: Colors.black),
              itemCount: list.length,
              itemBuilder: (BuildContext ctx, int index) {
                final e = list[index];

                return CardItemWidget(item: e);
                // return ListTile(
                //   title: Text("${element.id}"),
                //   subtitle: Text("${element.titre}"),
                // );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _this.action.add(true);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
