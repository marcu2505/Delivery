class Category {
  String id;
  String name;
  String imageURL;

  Category({
    this.id,
    this.name,
    this.imageURL,
  }) {
    this.id = id;
    this.name = name;
    this.imageURL = imageURL;
  }

  toString() {
    return "Category: {id: ${this.id} "
        "name: ${this.name} "
        "imageURL: ${this.imageURL}}";
  }
}
