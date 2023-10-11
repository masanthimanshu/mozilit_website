import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mozilit/models/features/screen_data.dart';

class FeatureSidebarButton extends ConsumerStatefulWidget {
  const FeatureSidebarButton({
    super.key,
    required this.data,
    required this.value,
    required this.subMenu,
  });

  final int value;
  final String data;
  final List<SubFeature> subMenu;

  @override
  ConsumerState<FeatureSidebarButton> createState() =>
      _FeatureSidebarButtonState();
}

class _FeatureSidebarButtonState extends ConsumerState<FeatureSidebarButton> {
  final _numberFormatter = NumberFormat("###,###.0#", "en_US");

  int _hoverValue = 0;
  int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
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
                    if (_selectedValue == widget.value + 1) {
                      setState(() {
                        _selectedValue = 0;
                      });
                    } else {
                      setState(() {
                        _selectedValue = widget.value + 1;
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            _selectedValue == widget.value + 1
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.subMenu.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (e, index) {
                      final subItemPrice = widget.subMenu[index].subPrice;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.indigo,
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.subMenu[index].subFeature),
                                    const SizedBox(height: 5),
                                    Text(
                                      "₹ ${_numberFormatter.format(subItemPrice)}",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      "${widget.subMenu[index].subDay} days",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            widget.subMenu.length - 1 != index
                                ? const Divider()
                                : const SizedBox(),
                          ],
                        ),
                      );
                    },
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
