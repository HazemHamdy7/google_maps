class PlaceSuggtion {
  late String placeId;
  late String description;

  PlaceSuggtion.fromJson(Map<String, dynamic> json) {
    placeId = json["place_id"];
    description = json["description"];
  }
}
