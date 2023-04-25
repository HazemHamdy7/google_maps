import '../model/plaecsSuggestions.dart';
import '../webservices/places_web_serviecs.dart';

class MapsRepository {
  final PlacesWebServices placesWebServices;
  MapsRepository(this.placesWebServices);

  Future<List<PlaceSuggtion>> fetchSuggestions(
    String place,
    String sessionToken,
  ) async {
    final suggestions =
        await placesWebServices.fetchSuggestions(place, sessionToken);
    return suggestions
        .map((suggestions) => PlaceSuggtion.fromJson(suggestions))
        .toList();
  }
}
