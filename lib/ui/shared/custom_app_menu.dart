import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({super.key});

  @override
  State<CustomAppMenu> createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  Duration duration = const Duration(milliseconds: 200);
  late AnimationController controller;
  bool isOpen = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: duration);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (isOpen) {
              controller.reverse();
            } else {
              controller.forward();
            }
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(6),
            ),
            width: 150,
            height: 50,
            child: Row(
              children: [
                AnimatedContainer(
                  duration: duration,
                  curve: Curves.easeInOut,
                  width: isOpen ? 50 : 0,
                ),
                Text(
                  'Menú',
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  color: Colors.white,
                  progress: controller,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
