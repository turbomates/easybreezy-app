class Paging<T> {
  List<T> data;
  int currentPage;
  bool hasMore;
  int pageSize;

  Paging({this.data, this.currentPage, this.hasMore, this.pageSize});

  factory Paging.fromJson(Map<String, dynamic> json, Function fromJson) {
    final items = json['data'].cast<Map<String, dynamic>>();

    return Paging<T>(
        pageSize: json['pageSize'],
        hasMore: json['hasMore'],
        currentPage: json['currentPage'],
        data: new List<T>.from(items.map((itemsJson) => fromJson(itemsJson))));
  }
}
