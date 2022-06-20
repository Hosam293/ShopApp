class ProfileModel
{
  bool? status;
  ProfileDataModel? data;
  ProfileModel.fromJson(Map<String,dynamic>json)
  {
    status=json['status'];
    data=ProfileDataModel.fromJson(json['data']);
  }

}
class ProfileDataModel
{
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;
  ProfileDataModel.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    image=json['image'];
    token=json['token'];
  }
}