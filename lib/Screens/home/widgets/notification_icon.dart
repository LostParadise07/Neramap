import 'package:flutter/material.dart';
// import 'package:neuramap/Screens/Welcome/welcome_screen.dart';
// import 'package:neuramap/services/services.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showLogoutMenu(context);
      },
      child: Container(
        padding: const EdgeInsets.all(15.0),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 248, 249, 250),
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
        ),
        child: const Icon(
          Icons.settings,
          size: 28.0,
          color: Color.fromARGB(255, 102, 5, 144),
        ),
      ),
    );
  }

  void _showLogoutMenu(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final offset = button.localToGlobal(Offset.zero);

    final selected = await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + button.size.height,
        offset.dx + button.size.width,
        offset.dy + button.size.height + 10.0,
      ),
      items: <PopupMenuEntry>[
        const PopupMenuItem(
          value: 'logout',
          child: ListTile(
            title: Text('Logout'),
          ),
        ),
      ],
    );

    if (selected == 'logout') {
      // Handle logout here
    }
  }
}
