import 'package:flutter/material.dart';
import 'package:rides_showcase/styleguide/dimensions.dart';

class WhereToField extends StatelessWidget {
  const WhereToField({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          margin: const EdgeInsets.symmetric(horizontal: medium),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.grey.shade600),
              const SizedBox(width: small),
              Text(
                'Where to?',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: medium,
                ),
              ),
            ],
          ),
        ),
      );
}
