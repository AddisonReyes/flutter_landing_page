import 'package:flutter_landing_page/ui/shared/custom_menu_item.dart';
import 'package:flutter_landing_page/providers/page_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

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
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

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
            height: isOpen ? 310 : 50,
            child: Column(
              children: [
                _MenuTile(
                  controller: controller,
                  duration: duration,
                  isOpen: isOpen,
                ),
                if (isOpen) ...[
                  CustomMenuItem(
                    text: 'Home',
                    onPressed: () {
                      pageProvider.goTo(0);
                    },
                    delay: 0,
                  ),
                  CustomMenuItem(
                    text: 'About',
                    onPressed: () {
                      pageProvider.goTo(1);
                    },
                    delay: 30,
                  ),
                  CustomMenuItem(
                    text: 'Pricing',
                    onPressed: () {
                      pageProvider.goTo(2);
                    },
                    delay: 60,
                  ),
                  CustomMenuItem(
                    text: 'Contact',
                    onPressed: () {
                      pageProvider.goTo(3);
                    },
                    delay: 90,
                  ),
                  CustomMenuItem(
                    text: 'Location',
                    onPressed: () {
                      pageProvider.goTo(4);
                    },
                    delay: 120,
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    super.key,
    required this.controller,
    required this.duration,
    required this.isOpen,
  });

  final AnimationController controller;
  final Duration duration;
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: duration,
            curve: Curves.easeInOut,
            width: isOpen ? 40 : 0,
          ),
          Text(
            'Menú',
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontSize: 20,
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
    );
  }
}
