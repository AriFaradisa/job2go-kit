import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job2go_kit/utils/common_util.dart';

import 'colors.dart';

class J2GTextAreaField extends StatefulWidget {
  final TextEditingController? controller;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final String? hint;
  final String? errorText;
  final bool? autoCorrect;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final TextCapitalization? textCapitalization;
  final int? maxLength;
  final bool? hasLabel;
  final bool? hasDeleteIcon;
  final bool? expands;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final Color? overrideColor;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final bool hasCounter;

  const J2GTextAreaField(
      {Key? key,
      required this.controller,
      this.onChanged,
      this.onFieldSubmitted,
      required this.hint,
      this.errorText,
      this.autoCorrect,
      this.textInputType,
      this.inputFormatter,
      this.focusNode,
      this.padding,
      this.textCapitalization,
      this.keyboardType,
      this.maxLength,
      this.hasLabel = false,
      this.overrideColor,
      this.textInputAction = TextInputAction.done,
      this.expands = false,
      this.hasDeleteIcon = false,
      this.maxLines = 1,
      this.minLines = 1,
      this.validator,
      this.enabled = true,
      this.hasCounter = true})
      : super(key: key);

  @override
  _J2GTextAreaFieldState createState() => _J2GTextAreaFieldState();
}

class _J2GTextAreaFieldState extends State<J2GTextAreaField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (text) {
          widget.onChanged!(text);
        },
        cursorColor: Colors.red,
        expands: widget.expands!,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        keyboardType: widget.keyboardType,
        enabled: widget.enabled,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            counterText: widget.hasCounter ? null : "",
            hintText: widget.hint,
            labelText: widget.hasLabel! ? widget.hint : null,
            labelStyle: TextStyle(color: Colors.grey),
            hintStyle: TextStyle(fontSize: 15, color: Job2goPalette.greyHint),
            errorText: widget.errorText,
            suffixIcon: widget.hasDeleteIcon!
                ? widget.controller!.text.length > 0
                    ? GestureDetector(
                        onTap: () {
                          widget.controller!.text = "";
                        },
                        child: SizedBox(
                            width: 10,
                            height: 10,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset("assets/images/delete.png"),
                            )))
                    : null
                : null,
            focusColor: widget.overrideColor ?? Theme.of(context).primaryColor),
        autocorrect: widget.autoCorrect ?? false,
        textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
        textInputAction: widget.textInputAction,
        // keyboardType: widget.textInputType ?? TextInputType.text,
        style: TextStyle(fontSize: 15),
        inputFormatters: widget.inputFormatter,
        maxLength: widget.maxLength,
        focusNode: widget.focusNode,
        onFieldSubmitted: (term) {
          widget.onFieldSubmitted!();
        },
        validator: widget.validator,
      ),
    );
  }
}

class J2GTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final String? hint;
  final String? errorText;
  final bool? autoCorrect;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final TextCapitalization? textCapitalization;
  final int? maxLength;
  final bool? hasLabel;
  final bool? hasDeleteIcon;
  final bool? expands;
  final int? maxLines;
  final int? minLines;
  final Color? overrideColor;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final bool hasCounter;

  const J2GTextField(
      {Key? key,
        required this.controller,
        this.onChanged,
        this.onFieldSubmitted,
        required this.hint,
        this.errorText,
        this.autoCorrect,
        this.textInputType,
        this.inputFormatter,
        this.focusNode,
        this.padding,
        this.textCapitalization,
        this.maxLength,
        this.hasLabel = false,
        this.overrideColor,
        this.textInputAction = TextInputAction.done,
        this.expands = false,
        this.hasDeleteIcon = false,
        this.maxLines = 1,
        this.minLines = 1,
        this.validator,
        this.enabled = true,
        this.hasCounter = true})
      : super(key: key);

  @override
  _J2GTextFieldState createState() => _J2GTextFieldState();
}

class _J2GTextFieldState extends State<J2GTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (text) {
          widget.onChanged!(text);
        },
        cursorColor: Colors.red,
        expands: widget.expands!,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        enabled: widget.enabled,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            counterText: widget.hasCounter ? null : "",
            hintText: widget.hint,
            labelText: widget.hasLabel! ? widget.hint : null,
            labelStyle: TextStyle(color: Colors.grey),
            hintStyle: TextStyle(fontSize: 15, color: Job2goPalette.greyHint),
            errorText: widget.errorText,
            suffixIcon: widget.hasDeleteIcon!
                ? widget.controller!.text.length > 0
                ? GestureDetector(
                onTap: () {
                  widget.controller!.text = "";
                },
                child: SizedBox(
                    width: 10,
                    height: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/delete.png"),
                    )))
                : null
                : null,
            focusColor: widget.overrideColor ?? Theme.of(context).primaryColor),
        autocorrect: widget.autoCorrect ?? false,
        textCapitalization:
        widget.textCapitalization ?? TextCapitalization.none,
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType ?? TextInputType.text,
        style: TextStyle(fontSize: 15),
        inputFormatters: widget.inputFormatter,
        maxLength: widget.maxLength,
        focusNode: widget.focusNode,
        onFieldSubmitted: (term) {
          widget.onFieldSubmitted!();
        },
        validator: widget.validator,
      ),
    );
  }
}

class J2GTextFieldBorder extends StatefulWidget {
  final TextEditingController? controller;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final String? hint;
  final String? errorText;
  final bool? autoCorrect;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final TextCapitalization? textCapitalization;
  final int? maxLength;
  final bool? hasLabel;
  final bool? hasDeleteIcon;
  final bool? expands;
  final int? maxLines;
  final int? minLines;
  final Color? overrideColor;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final bool hasCounter;

  const J2GTextFieldBorder(
      {Key? key,
        required this.controller,
        this.onChanged,
        this.onFieldSubmitted,
        required this.hint,
        this.errorText,
        this.autoCorrect,
        this.textInputType,
        this.inputFormatter,
        this.focusNode,
        this.padding,
        this.textCapitalization,
        this.maxLength,
        this.hasLabel = false,
        this.overrideColor,
        this.textInputAction = TextInputAction.done,
        this.expands = false,
        this.hasDeleteIcon = false,
        this.maxLines = 1,
        this.minLines = 1,
        this.validator,
        this.enabled = true,
        this.hasCounter = true})
      : super(key: key);

  @override
  _J2GTextFieldStateBorder createState() => _J2GTextFieldStateBorder();
}

class _J2GTextFieldStateBorder extends State<J2GTextFieldBorder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (text) {
          widget.onChanged!(text);
        },
        cursorColor: Colors.red,
        expands: widget.expands!,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        enabled: widget.enabled,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10, right: 10),
            filled: true,
            fillColor: Colors.transparent,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1,color: Colors.red),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1,color: Colors.grey.withOpacity(0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1,color: Colors.grey.withOpacity(0.2)),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 1,)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1,color: Colors.red.withOpacity(0.3)),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1,color: Colors.red.withOpacity(0.3)),
            ),
            counterText: widget.hasCounter ? null : "",
            hintText: widget.hint,
            labelText: widget.hasLabel! ? widget.hint : null,
            labelStyle: TextStyle(color: Colors.grey),
            hintStyle: TextStyle(fontSize: 15, color: Job2goPalette.greyHint),
            errorText: widget.errorText,
            suffixIcon: widget.hasDeleteIcon!
                ? widget.controller!.text.length > 0
                ? GestureDetector(
                onTap: () {
                  widget.controller!.text = "";
                },
                child: SizedBox(
                    width: 10,
                    height: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/images/delete.png"),
                    )))
                : null
                : null,
            focusColor: widget.overrideColor ?? Theme.of(context).primaryColor),
        autocorrect: widget.autoCorrect ?? false,
        textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType ?? TextInputType.text,
        style: TextStyle(fontSize: 15),
        inputFormatters: widget.inputFormatter,
        maxLength: widget.maxLength,
        focusNode: widget.focusNode,
        onFieldSubmitted: (term) {
          widget.onFieldSubmitted!();
        },
        validator: widget.validator,
      ),
    );
  }
}

class J2GTextFieldPassword extends StatefulWidget {
  final TextEditingController? controller;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final String? hint;
  final String? errorText;
  final bool? autoCorrect;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;

  const J2GTextFieldPassword(
      {Key? key,
      this.controller,
      this.onChanged,
      this.onFieldSubmitted,
      @required this.hint,
      this.errorText,
      this.autoCorrect,
      this.textInputType,
      this.inputFormatter,
      this.textInputAction,
      this.focusNode,
      this.padding,
      this.validator})
      : super(key: key);

  @override
  _J2GTextFieldPasswordState createState() => _J2GTextFieldPasswordState();
}

class _J2GTextFieldPasswordState extends State<J2GTextFieldPassword> {
  bool _obscureText = true;

  _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (text) {
          widget.onChanged!(text);
        },
        cursorColor: Colors.red,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            hintText: widget.hint,
            hintStyle: TextStyle(fontSize: 15, color: Job2goPalette.greyHint),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                _toggle();
              },
            ),
            errorText: widget.errorText),
        obscureText: _obscureText,
        autocorrect: widget.autoCorrect ?? false,
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType ?? TextInputType.text,
        style: TextStyle(fontSize: 15),
        inputFormatters: widget.inputFormatter,
        focusNode: widget.focusNode,
        onFieldSubmitted: (term) {
          widget.onFieldSubmitted!();
        },
        validator: widget.validator,
      ),
    );
  }
}

class J2GTextFieldPasswordBorder extends StatefulWidget {
  final TextEditingController? controller;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final String? hint;
  final String? errorText;
  final bool? autoCorrect;
  final bool? hasLabel;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;

  const J2GTextFieldPasswordBorder(
      {Key? key,
        this.controller,
        this.onChanged,
        this.onFieldSubmitted,
        @required this.hint,
        this.errorText,
        this.hasLabel = false,
        this.autoCorrect,
        this.textInputType,
        this.inputFormatter,
        this.textInputAction,
        this.focusNode,
        this.padding,
        this.validator})
      : super(key: key);

  @override
  _J2GTextFieldPasswordStateBorder createState() => _J2GTextFieldPasswordStateBorder();
}

class _J2GTextFieldPasswordStateBorder extends State<J2GTextFieldPasswordBorder> {
  bool _obscureText = true;

  _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        controller: widget.controller,
        onChanged: (text) {
          widget.onChanged!(text);
        },
        cursorColor: Colors.red,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10, right: 10),
            filled: true,
            fillColor: Colors.transparent,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1,color: Colors.red),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1,color: Colors.grey.withOpacity(0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1,color: Colors.grey.withOpacity(0.2)),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 1,)
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1,color: Colors.red.withOpacity(0.3)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1,color: Colors.red.withOpacity(0.3)),
            ),
            labelText: widget.hasLabel! ? widget.hint : null,
            hintText: widget.hint,
            hintStyle: TextStyle(fontSize: 15, color: Job2goPalette.greyHint),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                _toggle();
              },
            ),
            errorText: widget.errorText),
        obscureText: _obscureText,
        autocorrect: widget.autoCorrect ?? false,
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType ?? TextInputType.text,
        style: TextStyle(fontSize: 15),
        inputFormatters: widget.inputFormatter,
        focusNode: widget.focusNode,
        onFieldSubmitted: (term) {
          widget.onFieldSubmitted!(term);
        },
        validator: widget.validator,
      ),
    );
  }
}

class J2GTextFieldPrefix extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final String? hint;
  final bool? hasLabel;
  final String? errorText;
  final bool? autoCorrect;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final TextCapitalization? textCapitalization;
  final String? prefixText;
  final FormFieldValidator<String>? validator;
  final double? fontSize;
  final bool removeUnderline;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? prefixStyle;
  final bool? hasCounter;
  final int? maxLength;

  const J2GTextFieldPrefix({
    Key? key,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    @required this.hint,
    this.hasLabel = false,
    this.errorText,
    this.autoCorrect,
    this.textInputType,
    this.inputFormatter,
    this.focusNode,
    this.padding,
    this.textCapitalization,
    this.prefixText,
    this.validator,
    this.fontSize,
    this.removeUnderline = false,
    this.style,
    this.hintStyle,
    this.prefixStyle,
    this.hasCounter,
    this.maxLength,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        onChanged: (text) {
          onChanged!(text);
        },
        cursorColor: Colors.red,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: removeUnderline
                ? BorderSide(color: Colors.transparent)
                : BorderSide(color: Colors.red),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          counterText: hasCounter==null?"":null ,
          hintText: hint,
          hintStyle: hintStyle ?? TextStyle(fontSize: fontSize ?? 15, color: Job2goPalette.greyHint),
          labelText: hasLabel! ? hint : null,
          labelStyle: TextStyle(color: Colors.grey),
          errorText: errorText,
          errorMaxLines: 2,
          isDense: true,
          prefixIcon: Text(
            prefixText! + " ",
            // textAlign: TextAlign.end,
            style: prefixStyle ?? TextStyle(fontSize: fontSize ?? 15),
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
        ),
        autocorrect: autoCorrect ?? false,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        textInputAction: TextInputAction.next,
        keyboardType: textInputType ?? TextInputType.text,
        style: style ?? TextStyle(fontSize: 15),
        inputFormatters: inputFormatter,
        focusNode: focusNode,
        maxLength: maxLength??100,
        onFieldSubmitted: (term) {
          onFieldSubmitted!();
        },
        validator: validator,
      ),
    );
  }
}

class J2GTextFieldPrefixAndSuffix extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final String? hint;
  final bool? hasLabel;
  final String? errorText;
  final bool? autoCorrect;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final TextCapitalization? textCapitalization;
  final String? prefixText;
  final Image ? suffixIcon;
  final FormFieldValidator<String>? validator;
  final double? fontSize;
  final bool removeUnderline;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? prefixStyle;

  const J2GTextFieldPrefixAndSuffix({
    Key? key,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    @required this.hint,
    this.hasLabel = false,
    this.errorText,
    this.autoCorrect,
    this.textInputType,
    this.inputFormatter,
    this.focusNode,
    this.padding,
    this.textCapitalization,
    this.prefixText,
    this.suffixIcon,
    this.validator,
    this.fontSize,
    this.removeUnderline = false,
    this.style,
    this.hintStyle,
    this.prefixStyle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        onChanged: (text) {
          onChanged!(text);
        },
        cursorColor: Colors.red,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: removeUnderline
                ? BorderSide(color: Colors.transparent)
                : BorderSide(color: Colors.red),
          ),
          hintText: hint,
          hintStyle: hintStyle ?? TextStyle(fontSize: fontSize ?? 15, color: Job2goPalette.greyHint),
          labelText: hasLabel! ? hint : null,
          labelStyle: TextStyle(color: Colors.grey),
          errorText: errorText,
          errorMaxLines: 2,
          isDense: true,
          prefixIcon: Text(
            prefixText! + " ",
            // textAlign: TextAlign.end,
            style: prefixStyle ?? TextStyle(fontSize: fontSize ?? 15),
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
          suffixIcon: suffixIcon,
        ),
        autocorrect: autoCorrect ?? false,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        textInputAction: TextInputAction.next,
        keyboardType: textInputType ?? TextInputType.text,
        style: style ?? TextStyle(fontSize: 15),
        inputFormatters: inputFormatter,
        focusNode: focusNode,
        onFieldSubmitted: (term) {
          onFieldSubmitted!();
        },
        validator: validator,
      ),
    );
  }
}

class J2GTextFieldPrefixCurrency extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final String? hint;
  final bool? hasLabel;
  final String? errorText;
  final bool? autoCorrect;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final TextCapitalization? textCapitalization;
  final String? prefixText;
  final bool hasCounter;
  final int? maxLength;
  final bool? enabled;
  final FormFieldValidator<String>? validator;

  const J2GTextFieldPrefixCurrency(
      {Key? key,
      this.controller,
      this.onChanged,
      this.onFieldSubmitted,
      @required this.hint,
      this.hasLabel = false,
      this.errorText,
      this.autoCorrect,
      this.textInputType,
      this.textInputAction,
      this.inputFormatter,
      this.focusNode,
      this.padding,
      this.textCapitalization,
      this.prefixText,
      this.maxLength,
      this.hasCounter = false,
        this.enabled,
      this.validator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        onChanged: (text) {
          onChanged!(text);
        },
        enabled: enabled??true,
        cursorColor: Colors.red,
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            hintText: hint,
            counterText: hasCounter ? null : "",
            hintStyle: TextStyle(fontSize: 15, color: Job2goPalette.greyHint),
            labelText: hasLabel! ? hint : null,
            labelStyle: TextStyle(color: Colors.grey),
            errorText: errorText,
            isDense: true,
            prefixText: prefixText! + " "),
        autocorrect: autoCorrect ?? false,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: textInputType ?? TextInputType.text,
        style: TextStyle(fontSize: 15),
        inputFormatters: inputFormatter,
        maxLength: maxLength,
        focusNode: focusNode,
        validator: validator,
        onFieldSubmitted: (term) {
          onFieldSubmitted!();
        },
      ),
    );
  }
}

class J2GTextFieldPrefixIconCurrency extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final String? hint;
  final bool? hasLabel;
  final String? errorText;
  final bool? autoCorrect;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final TextCapitalization? textCapitalization;
  final String? prefixText;
  final String? suffixIcon;
  final FormFieldValidator<String>? validator;

  const J2GTextFieldPrefixIconCurrency(
      {Key? key,
        this.controller,
        this.onChanged,
        this.onFieldSubmitted,
        @required this.hint,
        this.hasLabel = false,
        this.errorText,
        this.autoCorrect,
        this.textInputType,
        this.textInputAction,
        this.inputFormatter,
        this.focusNode,
        this.padding,
        this.textCapitalization,
        this.suffixIcon,
        this.prefixText,
        this.validator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        onChanged: (text) {
          onChanged!(text);
        },
        cursorColor: Colors.red,
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            hintText: hint,
            hintStyle: TextStyle(fontSize: 15, color: Job2goPalette.greyHint),
            labelText: hasLabel! ? hint : null,
            labelStyle: TextStyle(color: Colors.grey),
            errorText: errorText,
            isDense: true,
            suffixIcon: suffixIcon != ""
                ? Image.asset(
              "assets/images/${CommonUtil.convertDisplayIconPulsaType(suffixIcon!)}",
              height: 10,
              width: 10,
              scale: 1.5,)
                : Container(width: 1,),
            prefixText: prefixText! + " "),
        autocorrect: autoCorrect ?? false,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: textInputType ?? TextInputType.text,
        style: TextStyle(fontSize: 15),
        inputFormatters: inputFormatter,
        focusNode: focusNode,
        validator: validator,
        onFieldSubmitted: (term) {
          onFieldSubmitted!();
        },
      ),
    );
  }
}

class J2GTextFieldPrefixIconCurrencyBorder extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final String? hint;
  final bool? hasLabel;
  final String? errorText;
  final bool? autoCorrect;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final TextCapitalization? textCapitalization;
  final String? prefixText;
  final String? suffixIcon;
  final FormFieldValidator<String>? validator;

  const J2GTextFieldPrefixIconCurrencyBorder(
      {Key? key,
        this.controller,
        this.onChanged,
        this.onFieldSubmitted,
        @required this.hint,
        this.hasLabel = false,
        this.errorText,
        this.autoCorrect,
        this.textInputType,
        this.textInputAction,
        this.inputFormatter,
        this.focusNode,
        this.padding,
        this.textCapitalization,
        this.suffixIcon,
        this.prefixText,
        this.validator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        onChanged: (text) {
          onChanged!(text);
        },
        cursorColor: Colors.red,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10, right: 10),
            filled: true,
            fillColor: Colors.transparent,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1,color: Colors.red),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1,color: Colors.grey.withOpacity(0.2)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1,color: Colors.grey.withOpacity(0.2)),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 1,)
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1,color: Colors.red.withOpacity(0.3)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(width: 1,color: Colors.red.withOpacity(0.3)),
            ),
            hintText: hint,
            hintStyle: TextStyle(fontSize: 15, color: Job2goPalette.greyHint),
            labelText: hasLabel! ? hint : null,
            labelStyle: TextStyle(color: Colors.grey),
            errorText: errorText,
            isDense: true,
            suffixIcon: suffixIcon != ""
                ? Image.asset(
              "assets/images/${CommonUtil.convertDisplayIconPulsaType(suffixIcon!)}",
              height: 10,
              width: 10,
              scale: 1.5,)
                : Container(width: 1,),
            prefixText: prefixText! + " "),
        autocorrect: autoCorrect ?? false,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        textInputAction: textInputAction ?? TextInputAction.next,
        keyboardType: textInputType ?? TextInputType.text,
        style: TextStyle(fontSize: 15),
        inputFormatters: inputFormatter,
        focusNode: focusNode,
        validator: validator,
        onFieldSubmitted: (term) {
          onFieldSubmitted!();
        },
      ),
    );
  }
}

class J2GTextFieldSuffix extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final String? hint;
  final String? errorText;
  final bool? autoCorrect;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final TextCapitalization? textCapitalization;
  final Icon? suffixIcon;
  final bool? enable;
  final bool? hasLabel;
  final FormFieldValidator<String>? validator;

  const J2GTextFieldSuffix(
      {Key? key,
      this.controller,
      this.onChanged,
      this.onFieldSubmitted,
      @required this.hint,
      this.errorText,
      this.autoCorrect,
      this.textInputType,
      this.inputFormatter,
      this.focusNode,
      this.padding,
      this.textCapitalization,
      this.suffixIcon,
      this.enable = true,
      this.hasLabel = false,
      this.validator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(left: 25, right: 25),
      child: TextFormField(
        controller: controller,
        onChanged: (text) {
          onChanged!(text);
        },
        cursorColor: Colors.red,
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 15, color: Job2goPalette.greyHint),
          errorText: errorText,
          isDense: true,
          labelStyle: TextStyle(color: Colors.grey),
          suffixIcon: suffixIcon,
          contentPadding: EdgeInsets.only(top: 16, bottom: 5),
          labelText: hasLabel! ? hint : null,
        ),
        enabled: enable,
        autocorrect: autoCorrect ?? false,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        textInputAction: TextInputAction.next,
        keyboardType: textInputType ?? TextInputType.text,
        style: TextStyle(fontSize: 15),
        inputFormatters: inputFormatter,
        focusNode: focusNode,
        onFieldSubmitted: (term) {
          onFieldSubmitted!();
        },
        validator: validator,
      ),
    );
  }
}

class J2GDropdownBorder extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onChanged;
  final String? hint;
  final bool? enabled;
  final String? text;
  final String? errorText;
  final EdgeInsets? padding;
  final Function? onClick;
  final Color? textColor;
  final Color? hintColor;
  final Color? labelColor;
  final Color? iconColor;
  final bool? hasLabel;
  final FormFieldValidator<String>? validator;

  const J2GDropdownBorder(
      {Key? key,
      this.controller,
      this.onChanged,
      required this.hint,
      this.enabled = true,
      this.text,
      this.errorText,
      this.padding,
      this.textColor,
      this.hintColor,
      this.labelColor,
      this.iconColor,
      this.hasLabel = false,
      required this.onClick,
      this.validator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(left: 25, right: 25),
      child: GestureDetector(
        onTap: () {
          if (enabled!) {
            onClick!();
          }
        },
        child: AbsorbPointer(
          child: TextFormField(
              controller: controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              enabled: enabled,
              onChanged: (text) {
                onChanged!(text);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                  filled: true,
                  fillColor: Colors.transparent,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(width: 1,color: Colors.red),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(width: 1,color: Colors.grey.withOpacity(0.2)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(width: 1,color: Colors.grey.withOpacity(0.2)),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(width: 1,)
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(width: 1,color: Colors.red.withOpacity(0.3)),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(width: 1,color: Colors.red.withOpacity(0.3)),
                  ),
                  labelText: hasLabel! ? hint : null,
                  labelStyle: TextStyle(
                      color: labelColor != null ? labelColor : Colors.grey),
                  hintText: hint,
                  hintStyle: TextStyle(
                      fontSize: 15,
                      color: hintColor != null ? hintColor : Job2goPalette.greyHint),
                  errorText: errorText,
                  suffixIcon: Icon(
                    Icons.expand_more,
                    color: iconColor != null ? iconColor : Colors.grey,
                  )),
              textInputAction: TextInputAction.next,
              style: TextStyle(
                  fontSize: 15,
                  color: textColor != null ? textColor : Colors.black),
              validator: validator),
        ),
      ),
    );
  }
}

class J2GDropdown extends StatelessWidget {
  final TextEditingController? controller;
  final Function? onChanged;
  final String? hint;
  final bool? enabled;
  final String? text;
  final String? errorText;
  final EdgeInsets? padding;
  final Function? onClick;
  final Color? textColor;
  final Color? hintColor;
  final Color? labelColor;
  final Color? iconColor;
  final bool? hasLabel;
  final FormFieldValidator<String>? validator;

  const J2GDropdown(
      {Key? key,
        this.controller,
        this.onChanged,
        required this.hint,
        this.enabled = true,
        this.text,
        this.errorText,
        this.padding,
        this.textColor,
        this.hintColor,
        this.labelColor,
        this.iconColor,
        this.hasLabel = false,
        required this.onClick,
        this.validator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.only(left: 25, right: 25),
      child: GestureDetector(
        onTap: () {
          if (enabled!) {
            onClick!();
          }
        },
        child: AbsorbPointer(
          child: TextFormField(
              controller: controller,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              enabled: enabled,
              onChanged: (text) {
                onChanged!(text);
              },
              decoration: InputDecoration(
                  labelText: hasLabel! ? hint : null,
                  labelStyle: TextStyle(
                      color: labelColor != null ? labelColor : Colors.grey),
                  hintText: hint,
                  hintStyle: TextStyle(
                      fontSize: 15,
                      color: hintColor != null ? hintColor : Job2goPalette.greyHint),
                  errorText: errorText,
                  suffixIcon: Icon(
                    Icons.expand_more,
                    color: iconColor != null ? iconColor : Colors.grey,
                  )),
              textInputAction: TextInputAction.next,
              style: TextStyle(
                  fontSize: 15,
                  color: textColor != null ? textColor : Colors.black),
              validator: validator),
        ),
      ),
    );
  }
}

class J2GTextFieldSearch extends StatefulWidget {
  final TextEditingController? controller;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final String? hint;
  final String? errorText;
  final bool? autoCorrect;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final TextCapitalization? textCapitalization;
  final int? maxLength;
  final bool? hasLabel;
  final bool? hasDeleteIcon;
  final bool? enable;
  final Function? overrideDelete;
  final bool? autofocus;
  final Color? color;

  const J2GTextFieldSearch(
      {Key? key,
      this.controller,
      this.onChanged,
      this.onFieldSubmitted,
      @required this.hint,
      this.errorText,
      this.autoCorrect,
      this.textInputType,
      this.inputFormatter,
      this.focusNode,
      this.padding,
      this.textCapitalization,
      this.maxLength,
      this.hasLabel,
      this.hasDeleteIcon = false,
      this.enable = true,
      this.overrideDelete,
      this.autofocus = false,
      this.color})
      : super(key: key);

  @override
  _J2GTextFieldSearchState createState() => _J2GTextFieldSearchState();
}

class _J2GTextFieldSearchState extends State<J2GTextFieldSearch> {
  int _textLength = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: widget.color ?? Colors.grey[300],
      ),
      child: Padding(
        padding: widget.padding ?? EdgeInsets.only(left: 25, right: 25),
        child: TextFormField(
          controller: widget.controller,
          autofocus: widget.autofocus!,
          onChanged: (text) {
            setState(() {
              _textLength = text.length;
            });
            print(_textLength);
            widget.onChanged!(text);
          },
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              prefixIcon: Icon(
                Icons.search,
                size: 20,
              ),
              border: InputBorder.none,
              hintText: widget.hint,
              enabled: widget.enable!,
              hintStyle: TextStyle(fontSize: 15, color: Job2goPalette.greyHint),
              errorText: widget.errorText,
              suffixIcon: widget.hasDeleteIcon!
                  ? _textLength > 0
                      ? GestureDetector(
                          onTap: () {
                            if (widget.overrideDelete != null) {
                              widget.overrideDelete!();
                            }
                            setState(() {
                              _textLength = 0;
                            });
                            print(_textLength);
                            widget.controller!.text = "";
                          },
                          child: Image.asset("assets/images/delete.png"))
                      : null
                  : null),
          autocorrect: widget.autoCorrect ?? false,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          textInputAction: TextInputAction.search,
          keyboardType: widget.textInputType ?? TextInputType.text,
          style: TextStyle(fontSize: 15),
          inputFormatters: widget.inputFormatter,
          maxLength: widget.maxLength,
          focusNode: widget.focusNode,
          onFieldSubmitted: (term) {
            widget.onFieldSubmitted!();
          },
        ),
      ),
    );
  }
}

class J2GTextFieldSearchBorder extends StatefulWidget {
  final TextEditingController? controller;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final String? hint;
  final String? errorText;
  final bool? autoCorrect;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final TextCapitalization? textCapitalization;
  final int? maxLength;
  final bool? hasLabel;
  final bool? hasDeleteIcon;
  final bool? enable;
  final Function? overrideDelete;
  final bool? autofocus;
  final Color? color;

  const J2GTextFieldSearchBorder(
      {Key? key,
        this.controller,
        this.onChanged,
        this.onFieldSubmitted,
        @required this.hint,
        this.errorText,
        this.autoCorrect,
        this.textInputType,
        this.inputFormatter,
        this.focusNode,
        this.padding,
        this.textCapitalization,
        this.maxLength,
        this.hasLabel,
        this.hasDeleteIcon = false,
        this.enable = true,
        this.overrideDelete,
        this.autofocus = false,
        this.color})
      : super(key: key);

  @override
  _J2GTextFieldSearchStateBorder createState() => _J2GTextFieldSearchStateBorder();
}

class _J2GTextFieldSearchStateBorder extends State<J2GTextFieldSearchBorder> {
  int _textLength = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.color ?? Colors.grey[300],
      ),
      child: Padding(
        padding: EdgeInsets.all(0),
        child: TextFormField(
          controller: widget.controller,
          autofocus: widget.autofocus!,
          onChanged: (text) {
            setState(() {
              _textLength = text.length;
            });
            print(_textLength);
            widget.onChanged!(text);
          },
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 0, right: 0),
              filled: true,
              fillColor: Colors.transparent,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 1,color: Colors.red),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 1,color: Colors.grey.withOpacity(0.2)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 1,color: Colors.grey.withOpacity(0.2)),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(width: 1,)
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 1,color: Colors.red.withOpacity(0.3)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 1,color: Colors.red.withOpacity(0.3)),
              ),
              alignLabelWithHint: true,
              prefixIcon: Icon(
                Icons.search,
                size: 20,
                color: Colors.black,
              ),
              // border: InputBorder.none,
              hintText: widget.hint,
              enabled: widget.enable!,
              hintStyle: TextStyle(fontSize: 15, color: Job2goPalette.greyHint),
              errorText: widget.errorText,
              suffixIcon: widget.hasDeleteIcon!
                  ? _textLength > 0
                  ? GestureDetector(
                  onTap: () {
                    if (widget.overrideDelete != null) {
                      widget.overrideDelete!();
                    }
                    setState(() {
                      _textLength = 0;
                    });
                    print(_textLength);
                    widget.controller!.text = "";
                  },
                  child: Image.asset("assets/images/delete.png"))
                  : null
                  : null),
          autocorrect: widget.autoCorrect ?? false,
          textCapitalization:
          widget.textCapitalization ?? TextCapitalization.none,
          textInputAction: TextInputAction.search,
          keyboardType: widget.textInputType ?? TextInputType.text,
          style: TextStyle(fontSize: 15),
          inputFormatters: widget.inputFormatter,
          maxLength: widget.maxLength,
          focusNode: widget.focusNode,
          onFieldSubmitted: (term) {
            widget.onFieldSubmitted!();
          },
        ),
      ),
    );
  }
}

class J2GTextFieldSearchHeight extends StatefulWidget {
  final TextEditingController? controller;
  final Function? onChanged;
  final Function? onFieldSubmitted;
  final String? hint;
  final String? errorText;
  final bool? autoCorrect;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatter;
  final FocusNode? focusNode;
  final EdgeInsets? padding;
  final TextCapitalization? textCapitalization;
  final int? maxLength;
  final bool? hasLabel;
  final bool? hasDeleteIcon;
  final bool? enable;
  final Function? overrideDelete;
  final bool? autofocus;
  final Color? color;

  const J2GTextFieldSearchHeight(
      {Key? key,
        this.controller,
        this.onChanged,
        this.onFieldSubmitted,
        @required this.hint,
        this.errorText,
        this.autoCorrect,
        this.textInputType,
        this.inputFormatter,
        this.focusNode,
        this.padding,
        this.textCapitalization,
        this.maxLength,
        this.hasLabel,
        this.hasDeleteIcon = false,
        this.enable = true,
        this.overrideDelete,
        this.autofocus = false,
        this.color})
      : super(key: key);

  @override
  _J2GTextFieldSearchState2 createState() => _J2GTextFieldSearchState2();
}

class _J2GTextFieldSearchState2 extends State<J2GTextFieldSearchHeight> {
  int _textLength = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: widget.color ?? Colors.grey[300],
      ),
      child: Padding(
        padding: widget.padding ?? EdgeInsets.only(left: 25, right: 25),
        child: Center(
          child: TextFormField(
            controller: widget.controller,
            autofocus: widget.autofocus!,
            onChanged: (text) {
              setState(() {
                _textLength = text.length;
              });
              print(_textLength);
              widget.onChanged!(text);
            },
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 10),
                alignLabelWithHint: true,
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                ),
                border: InputBorder.none,
                hintText: widget.hint,
                enabled: widget.enable!,
                hintStyle: TextStyle(fontSize: 15, color: Job2goPalette.greyHint),
                errorText: widget.errorText,
                suffixIcon: widget.hasDeleteIcon!
                    ? _textLength > 0
                    ? GestureDetector(
                        onTap: () {
                          if (widget.overrideDelete != null) {
                            widget.overrideDelete!();
                          }
                          setState(() {
                            _textLength = 0;
                          });
                          print(_textLength);
                          widget.controller!.text = "";
                        },
                        child: Image.asset("assets/images/delete.png"))
                    : null
                    : null),
            autocorrect: widget.autoCorrect ?? false,
            textCapitalization:
            widget.textCapitalization ?? TextCapitalization.none,
            textInputAction: TextInputAction.search,
            keyboardType: widget.textInputType ?? TextInputType.text,
            style: TextStyle(fontSize: 15),
            inputFormatters: widget.inputFormatter,
            maxLength: widget.maxLength,
            focusNode: widget.focusNode,
            onFieldSubmitted: (term) {
              widget.onFieldSubmitted!();
            },
          ),
        ),
      ),
    );
  }
}
