import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'editar_exercicio_model.dart';
export 'editar_exercicio_model.dart';

class EditarExercicioWidget extends StatefulWidget {
  const EditarExercicioWidget({
    Key? key,
    required this.codigoTreino,
    required this.codigoExercicio,
  }) : super(key: key);

  final int? codigoTreino;
  final int? codigoExercicio;

  @override
  _EditarExercicioWidgetState createState() => _EditarExercicioWidgetState();
}

class _EditarExercicioWidgetState extends State<EditarExercicioWidget> {
  late EditarExercicioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarExercicioModel());

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
        List<UsuarioRow> editarExercicioUsuarioRowList = snapshot.data!;
        final editarExercicioUsuarioRow =
            editarExercicioUsuarioRowList.isNotEmpty
                ? editarExercicioUsuarioRowList.first
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
                                'Editar Exercicio',
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
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FutureBuilder<List<ExercicioRow>>(
                      future: ExercicioTable().querySingleRow(
                        queryFn: (q) => q.eq(
                          'codigo_exercicio',
                          widget.codigoExercicio,
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
                        List<ExercicioRow> stackExercicioRowList =
                            snapshot.data!;
                        final stackExercicioRow =
                            stackExercicioRowList.isNotEmpty
                                ? stackExercicioRowList.first
                                : null;
                        return Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-0.16, -0.72),
                              child: Text(
                                'Qual seu exercicio?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.16, 0.45),
                              child: Text(
                                'Quantas repetições?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.36, 0.85),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                    'Exercicios',
                                    queryParameters: {
                                      'codigoTreino': serializeParam(
                                        widget.codigoTreino,
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
                                  color: Color(0xFFDA0000),
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
                              alignment: AlignmentDirectional(-0.81, 0.85),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.formKey.currentState == null ||
                                      !_model.formKey.currentState!
                                          .validate()) {
                                    return;
                                  }
                                  await ExercicioTable().update(
                                    data: {
                                      'codigo_treino':
                                          stackExercicioRow?.codigoTreino,
                                      'nome_exercicio':
                                          _model.nameController1.text,
                                      'descricao_exercicio':
                                          _model.nameController2.text,
                                      'numero_serie': int.tryParse(
                                          _model.dataController1.text),
                                      'numero_repeticao': int.tryParse(
                                          _model.dataController2.text),
                                      'codigo_ativo': true,
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'codigo_exercicio',
                                      widget.codigoExercicio,
                                    ),
                                  );

                                  context.pushNamed(
                                    'Exercicios',
                                    queryParameters: {
                                      'codigoTreino': serializeParam(
                                        widget.codigoTreino,
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
                                  color: Color(0xFF1C4494),
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
                              alignment: AlignmentDirectional(-0.15, -0.47),
                              child: Text(
                                'Descreva seu exercicio',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
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
                                          alignment: AlignmentDirectional(
                                              -0.03, -0.63),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Container(
                                              width: 300.0,
                                              child: TextFormField(
                                                controller:
                                                    _model.nameController1 ??=
                                                        TextEditingController(
                                                  text: stackExercicioRow
                                                      ?.nomeExercicio,
                                                ),
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0x75FFFFFF),
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x6595A1AC),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x6595A1AC),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Color(0x6595A1AC),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w300,
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
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.01, -0.19),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 8.0, 0.0),
                                            child: Container(
                                              width: 350.0,
                                              child: TextFormField(
                                                controller:
                                                    _model.nameController2 ??=
                                                        TextEditingController(
                                                  text: stackExercicioRow
                                                      ?.descricaoExercicio,
                                                ),
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0x75FFFFFF),
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x6595A1AC),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x6595A1AC),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                  filled: true,
                                                  fillColor: Color(0x6595A1AC),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color: Colors.black,
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                textAlign: TextAlign.start,
                                                maxLines: 10,
                                                cursorColor: Color(0xFF828282),
                                                validator: _model
                                                    .nameController2Validator
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
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.19, 0.2),
                              child: Text(
                                'Quantas séries?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.04, 0.34),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width: 300.0,
                                  child: TextFormField(
                                    controller: _model.dataController1 ??=
                                        TextEditingController(
                                      text: stackExercicioRow?.numeroSerie
                                          ?.toString(),
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
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
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
                                    validator: _model.dataController1Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.04, 0.6),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width: 300.0,
                                  child: TextFormField(
                                    controller: _model.dataController2 ??=
                                        TextEditingController(
                                      text: stackExercicioRow?.numeroRepeticao
                                          ?.toString(),
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
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
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
                                    validator: _model.dataController2Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.9, 0.87),
                              child: FlutterFlowIconButton(
                                borderColor: Color(0xFFDA0000),
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: Color(0xFFDA0000),
                                icon: Icon(
                                  Icons.delete_rounded,
                                  color: Colors.black,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  await ExercicioTable().update(
                                    data: {
                                      'codigo_ativo': false,
                                    },
                                    matchingRows: (rows) => rows.eq(
                                      'codigo_exercicio',
                                      widget.codigoExercicio,
                                    ),
                                  );

                                  context.pushNamed(
                                    'Exercicios',
                                    queryParameters: {
                                      'codigoTreino': serializeParam(
                                        widget.codigoTreino,
                                        ParamType.int,
                                      ),
                                    }.withoutNulls,
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
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
