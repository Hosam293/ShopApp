class ChangeFavModel
{
bool? status;
String? message;
ChangeFavDataModel? data;
ChangeFavModel.fromJson(Map<String,dynamic>json)
{
  status=json['status'];
  message=json['message'];
  data=ChangeFavDataModel.fromJson(json['data']);
}

}

class ChangeFavDataModel
{
  int? id;
  ChangeFavDataProductModel? data;
  ChangeFavDataModel.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    data=ChangeFavDataProductModel.fromJson(json['data']);
  }
}

class ChangeFavDataProductModel
{
  int? id;
  ChangeFavDataProductModel.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
  }
}