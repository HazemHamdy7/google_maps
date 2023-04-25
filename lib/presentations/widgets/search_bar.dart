import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bussniss_logic/maps/maps_cubit.dart';
import '../../data/model/plaecsSuggestions.dart';
import 'place_item.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:uuid/uuid.dart';

import '../../constant/colors_app.dart';

class FloatingSearchbar extends StatelessWidget {
  const FloatingSearchbar({
    super.key,
  });

  // final BuildContext context;

  @override
  Widget build(BuildContext context) {
    FloatingSearchBarController controller = FloatingSearchBarController();
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return FloatingSearchBar(
      builder: (context, transition) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                buildSeggestionBloc(),
                Container(
                  height: 112,
                  color: Colors.white,
                ),
              ],
            ));
      },
      controller: controller,
      elevation: 6,
      hintStyle: const TextStyle(fontSize: 18),
      queryStyle: const TextStyle(fontSize: 18),
      hint: 'Fine a place..',
      border: const BorderSide(style: BorderStyle.none),
      margins: const EdgeInsets.fromLTRB(20, 70, 20, 0),
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      height: 52,
      iconColor: AppColors.blue,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 36),
      transitionDuration: const Duration(microseconds: 600),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(microseconds: 500),
      onQueryChanged: (query) {
        void getPlacesSuggestions(String query) {
          final sessionToken = Uuid().v4();
          BlocProvider.of<MapsCubit>(context)
              .emitPlaceSuggestions(query, sessionToken);
        }
      },
      onFocusChanged: (isFocused) {},
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
              icon: Icon(
                Icons.place,
                color: Colors.black.withOpacity(0.6),
              ),
              onPressed: () {}),
        )
      ],
    );
  }
}

Widget buildSeggestionBloc() {
  return BlocBuilder<MapsCubit, MapsState>(
    builder: (context, state) {
      if (state is PlacesLoaded) {
        List<PlaceSuggtion> places = [];
        if (places.isNotEmpty) {
          return buildPlacesList();
        } else {
          return Container();
        }
      } else {
        return Container();
      }
    },
  );
}

Widget buildPlacesList() {
  List<PlaceSuggtion> places = [];

  return ListView.builder(
      itemCount: places.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          child: PlacesItem(
            suggestion: places[index],
          ),
          onTap: () {
            // controller.close();
          },
        );
      });
}
