class Category {
  final String idCategory;
  final String strCategory;
  final String strCategoryThumbs;

  Category(
      {required this.idCategory,
      required this.strCategory,
      required this.strCategoryThumbs});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      idCategory: json['idCategory'],
      strCategory: json['strCategory'] ?? 'Unknown',
      strCategoryThumbs: json['strCategoryThumbs'] ?? '',
    );
  }
}
