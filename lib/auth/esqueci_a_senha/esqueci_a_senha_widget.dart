import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'esqueci_a_senha_model.dart';
export 'esqueci_a_senha_model.dart';

class EsqueciASenhaWidget extends StatefulWidget {
  const EsqueciASenhaWidget({Key? key}) : super(key: key);

  @override
  _EsqueciASenhaWidgetState createState() => _EsqueciASenhaWidgetState();
}

class _EsqueciASenhaWidgetState extends State<EsqueciASenhaWidget> {
  late EsqueciASenhaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EsqueciASenhaModel());

    _model.emailController ??= TextEditingController();
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
                alignment: AlignmentDirectional(-0.08, -1.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/Logo.png',
                    width: 302.0,
                    height: 420.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.02, 1.38),
                child: Container(
                  width: 451.0,
                  height: 381.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -0.78),
                        child: Text(
                          'Esqueci a Senha',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF1C4494),
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.08, -0.32),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              controller: _model.emailController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF828282),
                                      fontWeight: FontWeight.w300,
                                    ),
                                hintText: 'Email',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x6595A1AC),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x6595A1AC),
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                filled: true,
                                fillColor: Color(0x6595A1AC),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic,
                                  ),
                              textAlign: TextAlign.start,
                              cursorColor: Color(0xFF828282),
                              validator: _model.emailControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.12),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.emailController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Email required!',
                                  ),
                                ),
                              );
                              return;
                            }
                            await authManager.resetPassword(
                              email: _model.emailController.text,
                              context: context,
                            );
                          },
                          text: 'Enviar',
                          options: FFButtonOptions(
                            width: 271.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF1C4494),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.normal,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ],
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
