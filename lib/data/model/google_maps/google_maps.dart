import 'package:equatable/equatable.dart';

class GoogleMaps extends Equatable {
  final String? description;
  // final List<MatchedSubstring>? matchedSubstrings;
  final String? placeId;
  // final String? reference;
  // final StructuredFormatting? structuredFormatting;
  // final List<Term>? terms;
  // final List<String>? types;

  const GoogleMaps({
    this.description,
    // this.matchedSubstrings,
    this.placeId,
    // this.reference,
    //   this.structuredFormatting,
    //   this.terms,
    //   this.types,
  });

  factory GoogleMaps.fromJson(Map<String, dynamic> json) => GoogleMaps(
        description: json['description'] as String?,
        // matchedSubstrings: (json['matched_substrings'] as List<dynamic>?)
        //     ?.map((e) => MatchedSubstring.fromJson(e as Map<String, dynamic>))
        //     .toList(),
        placeId: json['place_id'] as String?,
        // reference: json['reference'] as String?,
        // structuredFormatting: json['structured_formatting'] == null
        //     ? null
        //     : StructuredFormatting.fromJson(
        //         json['structured_formatting'] as Map<String, dynamic>),
        // terms: (json['terms'] as List<dynamic>?)
        //     ?.map((e) => Term.fromJson(e as Map<String, dynamic>))
        //     .toList(),
        // types: json['types'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        // 'matched_substrings':
        // matchedSubstrings?.map((e) => e.toJson()).toList(),
        'place_id': placeId,
        // 'reference': reference,
        // 'structured_formatting': structuredFormatting?.toJson(),
        // 'terms': terms?.map((e) => e.toJson()).toList(),
        // 'types': types,
      };

  @override
  List<Object?> get props {
    return [
      description,
      // matchedSubstrings,
      placeId,
      // reference,
      // structuredFormatting,
      // terms,
      // types,
    ];
  }
}
