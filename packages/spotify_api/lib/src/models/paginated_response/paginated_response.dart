import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'paginated_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginatedResponse<T> extends Equatable {
  const PaginatedResponse({
    required this.href,
    required this.items,
    required this.limit,
    required this.next,
    required this.offset,
    required this.previous,
    required this.total,
  });

  factory PaginatedResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PaginatedResponseFromJson(json, fromJsonT);

  final String href;
  final List<T> items;
  final int limit;
  final String? next;
  final int offset;
  final String? previous;
  final int total;

  @override
  List<Object?> get props => [
        href,
        items,
        limit,
        next,
        offset,
        previous,
        total,
      ];
}
