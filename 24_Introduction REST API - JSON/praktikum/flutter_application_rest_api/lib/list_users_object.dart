class ListUsersObject{

   ListUsersObject({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<Map<String, dynamic>> data;

  factory ListUsersObject.fromJSON(Map<String, dynamic> json){

    return ListUsersObject(
      page: json['page'], 
      perPage: json['per_page'], 
      total: json['total'], 
      totalPages: json['total_pages'], 
      data: (json['data'] as List).cast<Map<String, dynamic>>()
    );
  }
}