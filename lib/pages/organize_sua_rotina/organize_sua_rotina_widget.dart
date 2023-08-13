import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'organize_sua_rotina_model.dart';
export 'organize_sua_rotina_model.dart';

class OrganizeSuaRotinaWidget extends StatefulWidget {
  const OrganizeSuaRotinaWidget({Key? key}) : super(key: key);

  @override
  _OrganizeSuaRotinaWidgetState createState() =>
      _OrganizeSuaRotinaWidgetState();
}

class _OrganizeSuaRotinaWidgetState extends State<OrganizeSuaRotinaWidget> {
  late OrganizeSuaRotinaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrganizeSuaRotinaModel());

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
                alignment: AlignmentDirectional(0.81, 0.88),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20.0,
                  borderWidth: 0.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(
                      'CrieHabitos',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                        ),
                      },
                    );
                  },
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.72, 0.85),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed('Authentication');
                  },
                  text: 'Pular',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0x00FFFFFF),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Colors.black,
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
              Align(
                alignment: AlignmentDirectional(0.01, -1.64),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Design_sem_nome.png',
                    width: 300.0,
                    height: 671.0,
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
                      'Organize sua Rotina',
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
            ],
          ),
        ),
      ),
    );
  }
}
