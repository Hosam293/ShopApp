class OnBoardModel {
  String title;
  String body;
  String image;

  OnBoardModel({required this.title, required this.body, required this.image});
}

List<OnBoardModel> onBoardModel = [
  OnBoardModel(
      title: 'Title number One',
      body: 'body number One',
      image: 'assets/images/illustrations2.png'),
  OnBoardModel(
      title: 'Title number two',
      body: 'body number two',
      image: 'assets/images/illustrations2.png'),
  OnBoardModel(
      title: 'Title number three',
      body: 'body number three',
      image: 'assets/images/illustrations2.png'),
];
