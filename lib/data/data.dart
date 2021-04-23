import 'package:memory_game/models/TileModel.dart';

String selectedImage = "";
int selectedIndex ;
bool pairSelected = true;
int points = 0;

List<TileModel> myPairs = <TileModel>[];
List<bool> clicked = <bool>[];

List<bool> getClicked(){

  List<bool> yoClicked = <bool>[];
  List<TileModel> myairs = <TileModel>[];
  myairs = getPairs();
  for(int i=0;i<myairs.length;i++){
    yoClicked[i] = false;
  }

  return yoClicked;
}

List<TileModel>  getPairs(){

  List<TileModel> question = <TileModel>[];

  

  //1
  TileModel tileModel = new TileModel(
    imageAssetPath: "assets/fox.png",
    isSelected: false
  );
  question.add(tileModel);
  question.add(tileModel);
  

  //2
  tileModel = new TileModel(
    imageAssetPath: "assets/hippo.png",
    isSelected: false
  );
  question.add(tileModel);
  question.add(tileModel);

  //3
  tileModel = new TileModel(
    imageAssetPath: "assets/horse.png",
    isSelected: false
  );
  question.add(tileModel);
  question.add(tileModel);

  //4
  tileModel = new TileModel(
    imageAssetPath: "assets/monkey.png",
    isSelected: false
  );
  question.add(tileModel);
  question.add(tileModel);
  //5
  tileModel = new TileModel(
    imageAssetPath: "assets/panda.png",
    isSelected: false
  );
  question.add(tileModel);
  question.add(tileModel);

  //6
  tileModel = new TileModel(
    imageAssetPath: "assets/parrot.png",
    isSelected: false
  );
  question.add(tileModel);
  question.add(tileModel);

  //7
  tileModel = new TileModel(
    imageAssetPath: "assets/rabbit.png",
    isSelected: false
  );
  question.add(tileModel);
  question.add(tileModel);

  //8
  tileModel = new TileModel(
    imageAssetPath: "assets/zoo.png",
    isSelected: false
  );
  question.add(tileModel);
  question.add(tileModel);

  return question;
}

List<TileModel>  getQuestionPairs(){
List<TileModel> question = <TileModel>[];

  

  //1
  TileModel tileModel = new TileModel(
    imageAssetPath: "assets/question.png",
    isSelected: false
  );
  question.add(tileModel);
  question.add(tileModel);
  

  //2
  tileModel = new TileModel(
    imageAssetPath: "assets/question.png",
    isSelected: false
  );
  question.add(tileModel);
  question.add(tileModel);

  //3
  tileModel = new TileModel(
    imageAssetPath: "assets/question.png",
    isSelected: false
  );
  question.add(tileModel);
  question.add(tileModel);

  //4
  tileModel = new TileModel(
    imageAssetPath: "assets/question.png",
    isSelected: false
  );
  question.add(tileModel);
  question.add(tileModel);
  //5
  tileModel = new TileModel(
    imageAssetPath: "assets/question.png",
    isSelected: false
  );
  question.add(tileModel);
  question.add(tileModel);

  //6
  tileModel = new TileModel(
    imageAssetPath: "assets/question.png",
    isSelected: false
  );
  question.add(tileModel);
  question.add(tileModel);

  //7
  tileModel = new TileModel(
    imageAssetPath: "assets/question.png",
    isSelected: false
  );
  question.add(tileModel);
  question.add(tileModel);

  //8
  tileModel = new TileModel(
    imageAssetPath: "assets/question.png",
    isSelected: false
  );
  question.add(tileModel);
  question.add(tileModel);

  return question;
}