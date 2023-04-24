//
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

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
            child: Material(
                color: Colors.white,
                elevation: 4.0,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: Colors.accents.map((color) {
                    return Container(height: 112, color: color);
                  }).toList(),
                )));
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
      onQueryChanged: (query) {},
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