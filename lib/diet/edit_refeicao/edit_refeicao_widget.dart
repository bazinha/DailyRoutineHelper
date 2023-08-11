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
import 'edit_refeicao_model.dart';
export 'edit_refeicao_model.dart';

class EditRefeicaoWidget extends StatefulWidget {
  const EditRefeicaoWidget({
    Key? key,
    required this.codigoRefeicao,
    required this.codigoDieta,
  }) : super(key: key);

  final int? codigoRefeicao;
  final int? codigoDieta;

  @override
  _EditRefeicaoWidgetState createState() => _EditRefeicaoWidgetState();
}

class _EditRefeicaoWidgetState extends State<EditRefeicaoWidget> {
  late EditRefeicaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditRefeicaoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
            backgroundColor: Colors.white,
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
        List<UsuarioRow> editRefeicaoUsuarioRowList = snapshot.data!;
        final editRefeicaoUsuarioRow = editRefeicaoUsuarioRowList.isNotEmpty
            ? editRefeicaoUsuarioRowList.first
            : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              top: true,
              child: FutureBuilder<List<RefeicaoRow>>(
                future: RefeicaoTable().querySingleRow(
                  queryFn: (q) => q
                      .eq(
                        'codigo_refeicao',
                        widget.codigoRefeicao,
                      )
                      .eq(
                        'codigo_usuario',
                        editRefeicaoUsuarioRow?.codigo,
                      ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<RefeicaoRow> stackRefeicaoRowList = snapshot.data!;
                  final stackRefeicaoRow = stackRefeicaoRowList.isNotEmpty
                      ? stackRefeicaoRowList.first
                      : null;
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/Design_sem_nome.png',
                          width: 406.0,
                          height: 866.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.01, -1.02),
                        child: Container(
                          width: 450.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).info,
                          ),
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
                                        .primaryBtnText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('HomePage');
                                  },
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Editar Refeicao',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.84, -0.71),
                        child: Text(
                          'Qual sua refeicao?',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Plus Jakarta Sans',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.84, -0.48),
                        child: Text(
                          'Qual o horario?',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Plus Jakarta Sans',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.2, 0.88),
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
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).customColor3,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                        alignment: AlignmentDirectional(-0.78, 0.88),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            await RefeicaoTable().update(
                              data: {
                                'codigo_refeicao': widget.codigoRefeicao,
                                'nome_refeicao': _model.nameController1.text,
                                'codigo_usuario':
                                    editRefeicaoUsuarioRow?.codigo,
                                'horario_refeicao': _model.dataController.text,
                                'codigo_dieta': stackRefeicaoRow?.codigoDieta,
                                'descricao_refeicao':
                                    _model.nameController2.text,
                              },
                              matchingRows: (rows) => rows.eq(
                                'codigo_refeicao',
                                widget.codigoRefeicao,
                              ),
                            );

                            context.goNamed(
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
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).info,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
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
                        alignment: AlignmentDirectional(-0.84, -0.25),
                        child: Text(
                          'Conte mais sobre a sua refeicao',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Plus Jakarta Sans',
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.77, 0.88),
                        child: FlutterFlowIconButton(
                          borderColor:
                              FlutterFlowTheme.of(context).customColor3,
                          borderRadius: 20.0,
                          borderWidth: 1.0,
                          buttonSize: 40.0,
                          fillColor: FlutterFlowTheme.of(context).customColor3,
                          icon: Icon(
                            Icons.delete_rounded,
                            color: Colors.black,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            await RefeicaoTable().update(
                              data: {
                                'codigo_ativo': false,
                              },
                              matchingRows: (rows) => rows
                                  .eq(
                                    'codigo_refeicao',
                                    widget.codigoRefeicao,
                                  )
                                  .eq(
                                    'codigo_usuario',
                                    editRefeicaoUsuarioRow?.codigo,
                                  ),
                            );
                            context.safePop();
                          },
                        ),
                      ),
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Stack(
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-0.8, -0.39),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Container(
                                      width: 300.0,
                                      child: TextFormField(
                                        controller: _model.dataController ??=
                                            TextEditingController(
                                          text:
                                              stackRefeicaoRow?.horarioRefeicao,
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          hintText: 'HH:mm',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'Rubik',
                                                    color: Color(0x75FFFFFF),
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .grayIcon,
                                        validator: _model
                                            .dataControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [_model.dataMask],
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.8, -0.63),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Container(
                                      width: 300.0,
                                      child: TextFormField(
                                        controller: _model.nameController1 ??=
                                            TextEditingController(
                                          text: stackRefeicaoRow?.nomeRefeicao,
                                        ),
                                        autofocus: true,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Colors.black,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .override(
                                                    fontFamily: 'Rubik',
                                                    color: Color(0x75FFFFFF),
                                                    fontSize: 15.0,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .grayIcon,
                                        validator: _model
                                            .nameController1Validator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.8, 0.09),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width: 350.0,
                                  child: TextFormField(
                                    controller: _model.nameController2 ??=
                                        TextEditingController(
                                      text: stackRefeicaoRow?.descricaoRefeicao,
                                    ),
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
                                            fontFamily: 'Rubik',
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
                                    cursorColor:
                                        FlutterFlowTheme.of(context).grayIcon,
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
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
