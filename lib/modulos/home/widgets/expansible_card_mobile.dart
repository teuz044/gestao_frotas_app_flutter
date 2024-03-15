import 'package:flutter/material.dart';
import 'package:gestao_frotas_app/core/ui/class_estilos_texto.dart';

import 'expanded_section.dart';


class ExpansibleCardMobile extends StatefulWidget {
  final bool? expandedCard;
  final Color colorHeader;
  final double? height;
  final double? width;
  final Widget body;
  final String title;
  final Icon iconHeader;
  final void Function() onTap;
  const ExpansibleCardMobile(
      {super.key,
      this.expandedCard,
      required this.onTap,
      required this.colorHeader,
      this.height,
      this.width,
      required this.body,
      required this.title,
      required this.iconHeader,});
  @override
  State<ExpansibleCardMobile> createState() => _ExpansibleCardMobileState();
}

class _ExpansibleCardMobileState extends State<ExpansibleCardMobile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(
          iconeHeader: widget.iconHeader,
          title: widget.title,
          height: widget.height,
          width: widget.width,
          colorHeader: widget.colorHeader,
          onTap: widget.onTap,
        ),
        ExpandedSection(
          expand: widget.expandedCard ?? false,
          child: Content(body: widget.body),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  final VoidCallback onTap;
  final Color colorHeader;
  final double? height;
  final double? width;
  final String title;
  final Icon iconeHeader;

  const Header(
      {super.key,
      required this.onTap,
      required this.colorHeader,
      this.height,
      this.width,
      required this.title,
      required this.iconeHeader,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(
                0,
                3,
              ),
            ),
          ],
          color: colorHeader,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        ),
        height: height ?? 50,
        width: width ?? double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: ClassEstilosTextos.branccoSize20w600Montserrat,
              ),
              iconeHeader,
            ],
          ),
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  final Widget body;
  const Content({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return body;
  }
}
