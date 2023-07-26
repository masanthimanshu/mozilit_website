import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/controllers/base/tab_index_controller.dart';

class GreyButton extends ConsumerWidget {
  const GreyButton({
    super.key,
    required this.buttonName,
    required this.isSelected,
    required this.btnIndex,
  });

  final String buttonName;
  final bool isSelected;
  final int btnIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(tabIndexProvider.notifier).update((state) => btnIndex);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 45,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade300 : Colors.transparent,
          border: Border.all(
            width: 2,
            color: Colors.grey.shade300,
          ),
        ),
        child: Text(
          buttonName,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
