import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AddRoutineModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Descricao widget.
  TextEditingController? descricaoController;
  String? Function(BuildContext, String?)? descricaoControllerValidator;
  // State field(s) for NameTarefa widget.
  TextEditingController? nameTarefaController;
  String? Function(BuildContext, String?)? nameTarefaControllerValidator;
  String? _nameTarefaControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatorio';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

  // State field(s) for Hora widget.
  TextEditingController? horaController;
  final horaMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? horaControllerValidator;
  String? _horaControllerValidator(BuildContext context, String? val) {
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
    nameTarefaControllerValidator = _nameTarefaControllerValidator;
    horaControllerValidator = _horaControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    descricaoController?.dispose();
    nameTarefaController?.dispose();
    horaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
