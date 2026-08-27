class GeneralResponse<T> {
  final T data;
  
  GeneralResponse({required this.data});

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return {
      'data': toJsonT(data),
    };
  }
}