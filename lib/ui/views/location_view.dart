import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const viewColor = Colors.purpleAccent;
const viewLabel = 'Location';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: viewColor,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              viewLabel,
              style: GoogleFonts.montserratAlternates(
                fontSize: 80,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
