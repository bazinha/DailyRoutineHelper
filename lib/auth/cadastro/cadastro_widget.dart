import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cadastro_model.dart';
export 'cadastro_model.dart';

class CadastroWidget extends StatefulWidget {
  const CadastroWidget({Key? key}) : super(key: key);

  @override
  _CadastroWidgetState createState() => _CadastroWidgetState();
}

class _CadastroWidgetState extends State<CadastroWidget> {
  late CadastroModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CadastroModel());

    _model.emailController ??= TextEditingController();
    _model.passwordController ??= TextEditingController();
    _model.password1Controller ??= TextEditingController();
    _model.nameController ??= TextEditingController();
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
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Form(
                  key: _model.formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.02, 0.17),
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
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
                                hintText: 'Email',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0x75FFFFFF),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
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
                                    color: Color(0x75FFFFFF),
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
                        alignment: AlignmentDirectional(0.02, 0.33),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              controller: _model.passwordController,
                              obscureText: !_model.passwordVisibility,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF828282),
                                      fontWeight: FontWeight.w300,
                                    ),
                                hintText: 'Senha',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0x75FFFFFF),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FontStyle.italic,
                                    ),
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
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => _model.passwordVisibility =
                                        !_model.passwordVisibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    _model.passwordVisibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Color(0xFF95A1AC),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0x75FFFFFF),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic,
                                  ),
                              textAlign: TextAlign.start,
                              cursorColor: Color(0xFF828282),
                              validator: _model.passwordControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.02, 0.49),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              controller: _model.password1Controller,
                              obscureText: !_model.password1Visibility,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF828282),
                                      fontWeight: FontWeight.w300,
                                    ),
                                hintText: 'Confirme a senha',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0x75FFFFFF),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
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
                                suffixIcon: InkWell(
                                  onTap: () => setState(
                                    () => _model.password1Visibility =
                                        !_model.password1Visibility,
                                  ),
                                  focusNode: FocusNode(skipTraversal: true),
                                  child: Icon(
                                    _model.password1Visibility
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Color(0xFF95A1AC),
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .headlineMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0x75FFFFFF),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic,
                                  ),
                              textAlign: TextAlign.start,
                              cursorColor: Color(0xFF828282),
                              validator: _model.password1ControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.02, 0.01),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Container(
                            width: 300.0,
                            child: TextFormField(
                              controller: _model.nameController,
                              autofocus: true,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Color(0xFF828282),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
                                hintText: 'Nome',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0x75FFFFFF),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.italic,
                                    ),
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
                                    color: Color(0x75FFFFFF),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.italic,
                                  ),
                              textAlign: TextAlign.start,
                              cursorColor: Color(0xFF828282),
                              validator: _model.nameControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.12, -0.13),
                child: Text(
                  'Cadastro',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Plus Jakarta Sans',
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.02, 0.64),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.formKey.currentState == null ||
                        !_model.formKey.currentState!.validate()) {
                      return;
                    }
                    GoRouter.of(context).prepareAuthEvent();
                    if (_model.passwordController.text !=
                        _model.password1Controller.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Passwords don\'t match!',
                          ),
                        ),
                      );
                      return;
                    }

                    final user = await authManager.createAccountWithEmail(
                      context,
                      _model.emailController.text,
                      _model.passwordController.text,
                    );
                    if (user == null) {
                      return;
                    }

                    await UsuarioTable().insert({
                      'nome': _model.nameController.text,
                      'email': _model.emailController.text,
                      'senha': _model.password1Controller.text,
                    });

                    context.goNamedAuth('PaginaInicial', context.mounted);
                  },
                  text: 'Cadastrar',
                  options: FFButtonOptions(
                    width: 331.0,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Colors.white,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFF1C4494),
                          fontSize: 22.0,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-0.03, 0.92),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed('Authentication');
                  },
                  child: Text(
                    'Ja possui uma conta? Faca o login',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Colors.white,
                          fontSize: 10.0,
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
