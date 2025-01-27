import 'package:flutter/material.dart';

class SearchParWidget extends StatelessWidget{
  const SearchParWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: TextField(
              decoration: InputDecoration(
                constraints: BoxConstraints(maxHeight: 35, maxWidth: 500),
                filled: true,
                fillColor: Color.fromARGB(255, 218, 217, 223),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                hintText: "What jam are we listening to today ?",
                suffixIcon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 79, 77, 77),
                  size: 21,
                )
              ),
            ),
          );
  }
}