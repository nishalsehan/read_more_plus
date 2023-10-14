import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ReadMore extends StatefulWidget {
  final String text;
  final String? collapsedText;
  final String? expandedText;
  final TextStyle? style;
  final int maxLines;
  final Color readMoreTextColor;
  const ReadMore(
      {super.key,
      required this.text,
      this.style,
      this.maxLines = 2,

      /// default no of lines: 2
      this.readMoreTextColor = Colors.blue,

      /// default read more label color: Colors.blue
      this.collapsedText,
      this.expandedText});
  @override
  ReadMoreState createState() => ReadMoreState();
}

class ReadMoreState extends State<ReadMore> {
  final GlobalKey _textKey = GlobalKey();
  int lastCharacterIndex = 0;

  /// index of the last character at the end of the last line in the read more text
  late String text;
  Size textSize = Size.zero;
  bool readMore = false;

  /// set default status of the read more to true

  @override
  void initState() {
    super.initState();
    text = widget.text;

    /// run the _findLinePosition method at end of the frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _findLinePosition();
    });
  }

  /// calculate the last position of the text when collapse
  void _findLinePosition() {
    /// create a text painter to build
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: widget.style),
      textDirection: TextDirection.ltr,
      maxLines: widget.maxLines,

      /// Limit to given line count.
    );

    /// define the width
    textPainter.layout(
        minWidth: 0, maxWidth: _textKey.currentContext!.size!.width);

    /// get the offset of the last line last character
    final lineEnd = textPainter.getPositionForOffset(Offset(double.infinity,
        textPainter.preferredLineHeight * (widget.maxLines - 1)));

    setState(() {
      lastCharacterIndex = lineEnd.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: _textKey,
      child: RichText(
        maxLines: lastCharacterIndex == 0 ? widget.maxLines : null,

        /// limit the text line length to maxLines until lastCharacterIndex calculate
        text: TextSpan(
          text: readMore ||
                  lastCharacterIndex < 15 ||
                  lastCharacterIndex == text.length
              ? text
              : text.substring(0, lastCharacterIndex - 15),

          /// display the full text if readMore status true or if text length is not enough to cover total lines
          style: widget.style ?? const TextStyle(color: Colors.black87),
          children: <TextSpan>[
            /// hide the read more link if full text can be shown
            if (lastCharacterIndex != text.length)
              TextSpan(
                text: readMore
                    ? " ${widget.expandedText ?? "read less"}"
                    : "...${widget.collapsedText ?? "read more"}",

                /// display read more and read less labels based on the readMore status
                style: (widget.style ?? const TextStyle())
                    .copyWith(color: widget.readMoreTextColor),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    /// change the readMore status on label click
                    setState(() {
                      readMore = !readMore;
                    });
                  },
              ),
          ],
        ),
      ),
    );
  }
}
