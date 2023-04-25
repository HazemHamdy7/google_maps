// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:google_maps/data/model/plaecsSuggestions.dart';

import '../../constant/colors_app.dart';

class PlacesItem extends StatelessWidget {
  const PlacesItem({
    Key? key,
    required this.suggestion,
  }) : super(key: key);
  final PlaceSuggtion suggestion;

  @override
  Widget build(BuildContext context) {
    var subTitle = suggestion.description
        .replaceAll(suggestion.description.split(',')[0], '');
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.lightblue),
                child: const Icon(
                  Icons.place,
                  color: AppColors.blue,
                ),
              ),
              title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: '${suggestion.description.split(',')[0]}\n',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: subTitle.substring(2),
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ]),
              ))
        ],
      ),
    );
  }
}
