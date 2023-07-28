import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/widgets/sidebar/selected_value.dart';

class FeatureSidebarButton extends ConsumerStatefulWidget {
  const FeatureSidebarButton({
    super.key,
    required this.data,
    required this.value,
  });

  final int value;
  final String data;

  @override
  ConsumerState<FeatureSidebarButton> createState() =>
      _FeatureSidebarButtonState();
}

class _FeatureSidebarButtonState extends ConsumerState<FeatureSidebarButton> {
  int _hoverValue = 0;

  @override
  Widget build(BuildContext context) {
    final selectedValue = ref.watch(selectedValueProvider);

    return MouseRegion(
      onEnter: (e) {
        setState(() {
          _hoverValue = widget.value + 1;
        });
      },
      onExit: (e) {
        setState(() {
          _hoverValue = 0;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: _hoverValue == widget.value + 1
              ? Colors.grey.shade100
              : Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 2,
              color: Colors.grey.shade300,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(
                  Icons.message_rounded,
                  color: Colors.grey,
                ),
                const SizedBox(width: 10),
                Text(
                  widget.data,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    if (selectedValue == widget.value + 1) {
                      ref
                          .read(selectedValueProvider.notifier)
                          .update((state) => 0);
                    } else {
                      ref
                          .read(selectedValueProvider.notifier)
                          .update((state) => widget.value + 1);
                    }
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            selectedValue == widget.value + 1
                ? ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (e, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Colors.indigo,
                            ),
                            const SizedBox(width: 5),
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Data"),
                                SizedBox(height: 5),
                                Text(
                                  "₹48,515.63",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  "5.0 days",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey,
                                  ),
                                ),
                                child: const Icon(
                                  Icons.delete_forever,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    })
                : Container(),
          ],
        ),
      ),
    );
  }
}
