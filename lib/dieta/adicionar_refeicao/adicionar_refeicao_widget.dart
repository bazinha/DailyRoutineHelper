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
import 'adicionar_refeicao_model.dart';
export 'adicionar_refeicao_model.dart';

class AdicionarRefeicaoWidget extends StatefulWidget {
  const AdicionarRefeicaoWidget({
    Key? key,
    required this.codigoDieta,
  }) : super(key: key);

  final int? codigoDieta;

  @override
  _AdicionarRefeicaoWidgetState createState() =>
      _AdicionarRefeicaoWidgetState();
}

class _AdicionarRefeicaoWidgetState extends State<AdicionarRefeicaoWidget> {
  late AdicionarRefeicaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdicionarRefeicaoModel());

    _model.dataController ??= TextEditingController();
    _model.nameController1 ??= TextEditingController();
    _model.nameController2 ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UsuarioRow>>(
      future: UsuarioTable().querySingleRow(
        queryFn: (q) => q.eq(
          'email',
          currentUserEmail,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsuarioRow> adicionarRefeicaoUsuarioRowList = snapshot.data!;
        final adicionarRefeicaoUsuarioRow =
            adicionarRefeicaoUsuarioRowList.isNotEmpty
                ? adicionarRefeicaoUsuarioRowList.first
                : null;
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
                    alignment: AlignmentDirectional(-1.01, -1.02),
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF1C4494),
                      ),
                      child: Container(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.91, -0.07),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.home,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed('PaginaInicial');
                                },
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Adicionar Refeicao',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.59, 0.88),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await RefeicaoTable().insert({
                          'nome_refeicao': _model.nameController1.text,
                          'horario_refeicao': _model.dataController.text,
                          'descricao_refeicao': _model.nameController2.text,
                          'codigo_dieta': widget.codigoDieta,
                          'codigo_ativo': true,
                        });

                        context.pushNamed(
                          'DietaItens',
                          queryParameters: {
                            'codigoDieta': serializeParam(
                              widget.codigoDieta,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'Confirmar',
                      options: FFButtonOptions(
                        width: 122.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF1C4494),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
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
                    alignment: AlignmentDirectional(0.49, 0.88),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed(
                          'DietaItens',
                          queryParameters: {
                            'codigoDieta': serializeParam(
                              widget.codigoDieta,
                              ParamType.int,
                            ),
                          }.withoutNulls,
                        );
                      },
                      text: 'Cancelar',
                      options: FFButtonOptions(
                        width: 122.0,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFFDA0000),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  color: Colors.white,
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
                  Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.14, -0.7),
                        child: Text(
                          'Qual sua refeicao?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.15, -0.4),
                        child: Text(
                          'Qual o horario?',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.08, -0.08),
                        child: Text(
                          'Conte mais sobre a sua refeicao',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -0.28),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Container(
                                        width: 300.0,
                                        child: TextFormField(
                                          controller: _model.dataController,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      color: Colors.black,
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            hintText: 'HH:mm',
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
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
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x6595A1AC),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
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
                                              ),
                                          textAlign: TextAlign.start,
                                          keyboardType: TextInputType.number,
                                          cursorColor: Color(0xFF828282),
                                          validator: _model
                                              .dataControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [_model.dataMask],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, -0.6),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Container(
                                        width: 300.0,
                                        child: TextFormField(
                                          controller: _model.nameController1,
                                          autofocus: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          'Plus Jakarta Sans',
                                                      color: Colors.black,
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            hintStyle: FlutterFlowTheme.of(
                                                    context)
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
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x6595A1AC),
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
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
                                              ),
                                          textAlign: TextAlign.start,
                                          cursorColor: Color(0xFF828282),
                                          validator: _model
                                              .nameController1Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.01, 0.37),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width: 350.0,
                                  child: TextFormField(
                                    controller: _model.nameController2,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Colors.black,
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.normal,
                                          ),
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
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x6595A1AC),
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(40.0),
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
                                        ),
                                    textAlign: TextAlign.start,
                                    maxLines: 10,
                                    cursorColor: Color(0xFF828282),
                                    validator: _model.nameController2Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
