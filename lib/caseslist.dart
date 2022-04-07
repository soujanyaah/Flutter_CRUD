import 'package:flutter/material.dart';
import 'package:flutter_restapi/models/project_model.dart';
import 'detailwidget.dart';

class ProjectsList extends StatelessWidget {
  final List<Projects> projects;
  ProjectsList({Key key, this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: projects == null ? 0 : projects.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
              child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailWidget(projects[index])),
              );
            },
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(projects[index].name),
              subtitle: Text(projects[index].createdDate),
            ),
          ));
        });
  }
}
