
class CategoriesModel
{
  late bool status;
  late CategoriesDataModel data;

  CategoriesModel.fromJson(Map<String,dynamic> json)
  {
    status = json['status'];
    data = CategoriesDataModel.fromJson(json['data']);


  }
}


class CategoriesDataModel
{
  int? currentPage;
  List<DataModel> data= [];


  CategoriesDataModel.fromJson(Map<String,dynamic> json)
  {
    currentPage = json['current_page'];
    json['data'].forEach((element){
      data.add(DataModel.fromjson(element));
    });

  }


}



class DataModel
{
  int? id;
  String? image;
  String? name;

  DataModel.fromjson(Map<String,dynamic> json)
  {
    id = json['id'];
    image = json['image'];
    name = json['name'];



  }
}