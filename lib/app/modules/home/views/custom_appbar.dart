import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(85);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      toolbarHeight: 85,
      titleSpacing: 18,
      title: Row(
        children: [
          /// Logo
          Row(
            children: [
              Image.network(
                "https://picsum.photos/70",
                width: 55,
                height: 55,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "ALL INDIA",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: Color(0xff123C8E),
                      height: 1,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    "PACKERS & MOVERS",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffF15A29),
                      letterSpacing: .4,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(width: 20),

          /// Navigation Items
          Row(
            children: [
              _navItem("Home"),
              _navItem("About Us"),
              _navItem("Services", hasArrow: true),
              _navItem("Service Areas"),
              _navItem("Why Choose Us"),
              _navItem("Contact Us"),
            ],
          ),

          const Spacer(),

          /// Phone
          Row(
            children: const [
              Icon(Icons.phone, color: Color(0xff123C8E), size: 24),
              SizedBox(width: 10),
              Text(
                "+91 9883632477",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff123C8E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navItem(String title, {bool hasArrow = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff1D1D1D),
                ),
              ),
              if (hasArrow) ...[
                const SizedBox(width: 4),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 18,
                  color: Colors.black87,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
