import 'dart:convert';
import 'package:flutter_restapi/models/project_model.dart';
import 'package:http/http.dart';

class ApiService {
  final String apiUrl = "http://192.168.8.101:8080/api/v1/projects";

  Future<List<Projects>> getProjects() async {
    Response res = await get(apiUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Projects> projects = body.map((dynamic item) => Projects.fromJson(item)).toList();
      return projects;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Projects> getProjectById(String id) async {
    final response = await get('$apiUrl/$id');

    if (response.statusCode == 200) {
      return Projects.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }

  Future<Projects> createProject(Projects projects) async {
    Map data = {
      'name': projects.name,
      'createdDate': projects.createdDate,
      'admin': projects.admin,
      'member': projects.member,
     
    };

    final Response response = await post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Projects.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }

  Future<Projects> updateProjects(String id, Projects projects) async {
    Map data = {
      'name': projects.name,
      'createdDate': projects.createdDate,
      'admin': projects.admin,
      'member': projects.member,
    };

    final Response response = await put(
      '$apiUrl/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Projects.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a case');
    }
  }

  Future<void> deleteProject(String id) async {
    Response res = await delete('$apiUrl/$id');

    if (res.statusCode == 200) {
      print("Case deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }

}
