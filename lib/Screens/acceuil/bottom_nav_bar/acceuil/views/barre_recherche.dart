import 'package:flutter/material.dart';

Widget buildBarreRecherche() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: [
        Expanded(
          flex: 4,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Rechercher...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.blue, // Bordure bleue quand on tape dedans
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 8.0),
        ElevatedButton(
          onPressed: () {
            // Action de recherche
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Fond bleu pour le bouton
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Icon(
            Icons.search_rounded,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
