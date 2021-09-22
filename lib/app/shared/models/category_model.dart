class CategoryModel {
  int? id;
  String? description;
  String? img;
  bool? selected;

  CategoryModel({
    this.id,
    this.description,
    this.img,
    this.selected,
  });

  static List<CategoryModel> listCategory = [
    CategoryModel(id: 1, description: "Eletronica", img: "https://images.unsplash.com/photo-1470225620780-dba8ba36b745?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1100&q=80", selected: false),
    CategoryModel(id: 2, description: "Rock", img: "https://images.unsplash.com/photo-1528495612343-9ca9f4a4de28?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80", selected: false),
    CategoryModel(id: 3, description: "Sertanejo", img: "https://images.unsplash.com/photo-1472739039010-7d4053f339f8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1100&q=80", selected: false),
  ];
}
