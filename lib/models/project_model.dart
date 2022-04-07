class Projects {
    String id;
    String name;
    String createdDate;
    String admin;
    String member;

  Projects({ this.id, this.name, this.createdDate, this.admin, this.member });

  factory Projects.fromJson(Map<String, dynamic> json) {
    return Projects(
      id: json['_id'] as String,
      name: json['name'] as String,
      createdDate: json['createdDate'] as String,
     
      admin: json['admin'] as String,
      member: json['member'] as String,
    
    );
  }

  @override
  String toString() {
    return 'Trans{id: $id, name: $name, age: $createdDate}';
  }
}