import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditarTreinoModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Name widget.
  TextEditingController? nameController1;
  String? Function(BuildContext, String?)? nameController1Validator;
  // State field(s) for Name widget.
  TextEditingController? nameController2;
  String? Function(BuildContext, String?)? nameController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nameController1?.dispose();
    nameController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
