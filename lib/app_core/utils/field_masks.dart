import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FieldMasks {
  static MaskTextInputFormatter phoneMaskFormatter = MaskTextInputFormatter(
    mask: '+998 (##) ###-##-##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );
}
