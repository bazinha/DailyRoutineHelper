import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class EditRoutineModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  TextEditingController? nameController1;
  String? Function(BuildContext, String?)? nameController1Validator;
  // State field(s) for Data widget.
  TextEditingController? dataController;
  final dataMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? dataControllerValidator;
  String? _dataControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatorio';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for Name widget.
  TextEditingController? nameController2;
  String? Function(BuildContext, String?)? nameController2Validator;
  String? _nameController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatorio';
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 5) {
      return 'Maximum 5 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    dataControllerValidator = _dataControllerValidator;
    nameController2Validator = _nameController2Validator;
  }

  void dispose() {
    unfocusNode.dispose();
    nameController1?.dispose();
    dataController?.dispose();
    nameController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
