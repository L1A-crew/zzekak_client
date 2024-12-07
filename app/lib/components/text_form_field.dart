import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:zzekak/schemes/color_schemes.dart';
import 'package:zzekak/schemes/font_style.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String? label;
  final bool required;
  final FormFieldSetter onSaved;
  final FormFieldValidator validator;
  final String placeholder;
  final String? initialValue;

  const TextFormFieldWidget({
    super.key,
    this.label,
    this.required = true,
    required this.onSaved,
    required this.validator,
    this.placeholder = "",
    this.initialValue,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  final TextEditingController _controller = TextEditingController();
  final BehaviorSubject<String> _textSubject = BehaviorSubject<String>();
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _initializeController();
    _controller.addListener(_onControllerChange);
  }

  void _initializeController() {
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
      _textSubject.add(widget.initialValue!);
      _showClearButton = true;
    }
  }

  void _onControllerChange() {
    _textSubject.add(_controller.text);
    setState(() {
      _showClearButton = _controller.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            widget.label != null
                ? Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: widget.label,
                          style: ZzekakTextStyle.h5(
                              context, context.color.tertiaryContainer),
                          children: widget.required
                              ? [
                                  TextSpan(
                                    text: ' *',
                                    style: ZzekakTextStyle.h5(
                                        context, context.color.error),
                                  ),
                                ]
                              : [],
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            TextFormField(
                controller: _controller,
                onSaved: widget.onSaved,
                validator: widget.validator,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(16, 18, 12, 18),
                    fillColor: context.color.onTertiary,
                    hintText: widget.placeholder,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    errorStyle:
                        ZzekakTextStyle.h5(context, context.color.error),
                    suffixIcon: _showClearButton
                        ? IconButton(
                            icon: Icon(Icons.cancel_rounded,
                                color: context.color.tertiary),
                            onPressed: () {
                              setState(() {
                                _controller.clear();
                                _textSubject.add('');
                              });
                            },
                          )
                        : null)),
            Container(height: 16.0),
          ],
        ));
  }
}
