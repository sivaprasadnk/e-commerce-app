import 'package:e_comm_app/presentation/bloc/route/route_bloc.dart';
import 'package:e_comm_app/presentation/bloc/route/route_event.dart';
import 'package:e_comm_app/presentation/bloc/route/route_state.dart';
import 'package:e_comm_app/presentation/screens/cart/cart_screen.dart';
import 'package:e_comm_app/presentation/screens/home/widgets/bottom_navbar_item.dart';
import 'package:e_comm_app/presentation/screens/products/products_screen.dart';
import 'package:e_comm_app/presentation/screens/profile/profile_screen.dart';
import 'package:e_comm_app/presentation/screens/wishlist/wishlist_screen.dart';
import 'package:e_comm_app/utils/common_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List screens = [
    const ProductsScreen(),
    const WishlistScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<RouteBloc, RouteState>(
        builder: (context, state) {
          var currentIndex = state.currentIndex!;
          debugPrint('## currentIndex $currentIndex');

          return Container(
            width: double.infinity,
            height: 60,
            color: whiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavbarItem(
                  callback: () {
                    context.read<RouteBloc>().add(UpdateIndexEvent(0));
                  },
                  title: 'Home',
                  icon: Icons.home,
                  isSelected: currentIndex == 0,
                ),
                BottomNavbarItem(
                  callback: () {
                    context.read<RouteBloc>().add(UpdateIndexEvent(1));
                  },
                  title: 'WishList',
                  icon: Icons.favorite,
                  isSelected: state.currentIndex == 1,
                ),
                BottomNavbarItem(
                  callback: () {
                    context.read<RouteBloc>().add(UpdateIndexEvent(2));
                  },
                  title: 'Cart',
                  icon: Icons.shopping_cart,
                  isSelected: currentIndex == 2,
                ),
                BottomNavbarItem(
                  callback: () {
                    context.read<RouteBloc>().add(UpdateIndexEvent(3));
                  },
                  title: 'Profile',
                  icon: Icons.person,
                  isSelected: currentIndex == 3,
                ),
              ],
            ),
          );
        },
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: blackColor,
      //   unselectedItemColor: greyColor,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite),
      //       label: 'WishList',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart),
      //       label: 'Cart',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
      body: BlocBuilder<RouteBloc, RouteState>(builder: (context, state) {
        return screens[state.currentIndex ?? 0];
      }),
    );
  }
}
