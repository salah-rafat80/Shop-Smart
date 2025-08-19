import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/main_appbar_widget.dart';
import 'cart_screen.dart';
import 'home_screen.dart';
import '../../Controller/card_controller.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const String id = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Shop tab

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(_selectedIndex, _onItemTapped),
      body: IndexedStack(
        index: _selectedIndex,
        children: const [HomeTab(), CartTab()],
      ),
      bottomNavigationBar: Consumer<CardController>(
        builder: (context, cart, _) {
          final count = cart.items.fold<int>(0, (acc, e) => acc + e.qty);
          return BottomNavigationBar(
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(Icons.shopping_cart_outlined),
                    if (count > 0)
                      Positioned(
                        right: -6,
                        top: -6,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 15,
                            minHeight: 15,
                          ),
                          child: Center(
                            child: Text(
                              '$count',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                label: 'Cart',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            elevation: 8,
          );
        },
      ),
    );
  }
}
