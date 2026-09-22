import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profileheader extends StatelessWidget {
  Profileheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF282A28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/gamer (1)(8).png"),
                radius: 50,
              ),
              const SizedBox(width: 30),
              Row(
                children: [
                  _buildStatColumn('12', 'Wish List'),
                  const SizedBox(width: 40),
                  _buildStatColumn('10', 'History'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),

          const Text(
            'John Safwat',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 36,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}