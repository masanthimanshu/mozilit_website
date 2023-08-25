import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mozilit/models/features/sidebar_data.dart';

class FeatureSidebarButton extends ConsumerStatefulWidget {
  const FeatureSidebarButton({
    super.key,
    required this.data,
    required this.value,
    required this.subMenu,
  });

  final int value;
  final String data;
  final List<SubFeaature> subMenu;

  @override
  ConsumerState<FeatureSidebarButton> createState() =>
      _FeatureSidebarButtonState();
}

class _FeatureSidebarButtonState extends ConsumerState<FeatureSidebarButton> {
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
                    itemCount: widget.subMenu.length,
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.subMenu[index].subFeature),
                                const SizedBox(height: 5),
                                Text(
                                  widget.subMenu[index].subPrice.toString(),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  widget.subMenu[index].subDay.toString(),
                                  style: const TextStyle(
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
