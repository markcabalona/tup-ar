import 'package:flutter/material.dart';
import 'package:tup_ar/core/router/app_router.dart';
import 'package:tup_ar/core/router/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      children: [
        GestureDetector(
          onTap: _onTapCard,
          child: const Card(
            child: Center(child: Text("Event's Place 1")),
          ),
        ),
        GestureDetector(
          onTap: _onTapCard,
          child: const Card(
            child: Center(child: Text("Event's Place 2")),
          ),
        ),
        GestureDetector(
          onTap: _onTapCard,
          child: const Card(
            child: Center(child: Text("Event's Place 3")),
          ),
        ),
        GestureDetector(
          onTap: _onTapCard,
          child: const Card(
            child: Center(child: Text("Event's Place 4")),
          ),
        ),
        GestureDetector(
          onTap: _onTapCard,
          child: const Card(
            child: Center(child: Text("Event's Place 5")),
          ),
        ),
      ],
    );
  }

  void _onTapCard() {
    AppRouter.push(AppRoutes.ar);
  }
}
