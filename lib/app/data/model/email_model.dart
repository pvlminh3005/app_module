class EmailModel {
  late String? id;
  late String? name;
  late String? content;
  late String? date;
  late String? avatar;

  EmailModel({
    this.id = '',
    this.name = '',
    this.content = '',
    this.date = '',
    this.avatar = '',
  });

  EmailModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'] ?? 'Name';
    this.content = json['title'] ?? '';
    this.avatar = json['image'];
    this.date = json['date'];
  }
}
