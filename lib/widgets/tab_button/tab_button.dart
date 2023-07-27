import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/widgets/tab_button/tab_button_controller.dart';

class TabButton extends ConsumerWidget {
  const TabButton({
    super.key,
    required this.isSelected,
    required this.btnIndex,
    required this.btnItem,
  });

  final bool isSelected;
  final Widget btnItem;
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
          color: isSelected ? Colors.grey.shade300 : Colors.white,
          border: Border.all(
            width: 2,
            color: Colors.grey.shade300,
          ),
        ),
        child: btnItem,
      ),
    );
  }
}
