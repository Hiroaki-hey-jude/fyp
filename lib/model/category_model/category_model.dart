class CategoryModel {
  final String icon, title, categoryNumber;
  final String? id;

  CategoryModel({
    required this.icon,
    required this.title,
    required this.categoryNumber,
    this.id,
  });
}

List<CategoryModel> category_list = [
  CategoryModel(
    icon: 'assets/potato.png',
    title: 'potato',
    categoryNumber: '0',
  ),
  CategoryModel(
    icon: 'assets/rice.png',
    title: 'rice',
    categoryNumber: '1',
  ),
  CategoryModel(
    icon: 'assets/tomato.png',
    title: 'tomato',
    categoryNumber: '2',
  ),
  CategoryModel(
    icon: 'assets/imperfect.png',
    title: 'imperfect',
    categoryNumber: '3',
  ),
];
