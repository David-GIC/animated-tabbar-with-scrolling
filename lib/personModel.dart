class New {

  int id;
  int categoryID;
  String url;
  String title;
  String description;
  String createdAt;
  String updatedAt;
  String content;

  New.fromJson(dynamic json){

    id = json['id'];
    url = json['url'];
    categoryID = json['category_id'];
    title = json['short_title'];
    description = json['short_description'];
    createdAt = json['created_at'];
    updatedAt = json['create_at'];
    content = json['content'];

  }
}