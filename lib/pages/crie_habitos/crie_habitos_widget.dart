import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'crie_habitos_model.dart';
export 'crie_habitos_model.dart';

class CrieHabitosWidget extends StatefulWidget {
  const CrieHabitosWidget({Key? key}) : super(key: key);

  @override
  _CrieHabitosWidgetState createState() => _CrieHabitosWidgetState();
}

class _CrieHabitosWidgetState extends State<CrieHabitosWidget> {
  late CrieHabitosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CrieHabitosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/Design_sem_nome.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.02, -0.46),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Design_sem_nome_(1).png',
                    width: 369.0,
                    height: 437.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.03, 0.38),
                child: Container(
                  width: 255.0,
                  height: 41.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(6.0),
                    shape: BoxShape.rectangle,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Crie habitos saudaveis',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.03, 0.6),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(
                      'Authentication',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                        ),
                      },
                    );
                  },
                  text: 'Comece agora',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.white,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFF1C4494),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
