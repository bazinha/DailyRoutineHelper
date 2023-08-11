import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_diet_model.dart';
export 'edit_diet_model.dart';

class EditDietWidget extends StatefulWidget {
  const EditDietWidget({
    Key? key,
    required this.codigoDieta,
  }) : super(key: key);

  final int? codigoDieta;

  @override
  _EditDietWidgetState createState() => _EditDietWidgetState();
}

class _EditDietWidgetState extends State<EditDietWidget> {
  late EditDietModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditDietModel());

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
        List<UsuarioRow> editDietUsuarioRowList = snapshot.data!;
        final editDietUsuarioRow = editDietUsuarioRowList.isNotEmpty
            ? editDietUsuarioRowList.first
            : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              top: true,
              child: FutureBuilder<List<DietaRow>>(
                future: DietaTable().querySingleRow(
                  queryFn: (q) => q
                      .eq(
                        'codigo_dieta',
                        widget.codigoDieta,
                      )
                      .eq(
                        'codigo_usuario',
                        editDietUsuarioRow?.codigo,
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
                  List<DietaRow> stackDietaRowList = snapshot.data!;
                  final stackDietaRow = stackDietaRowList.isNotEmpty
                      ? stackDietaRowList.first
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
                                    'Editar Dieta',
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
                          'Qual sua dieta?',
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
                            await DietaTable().update(
                              data: {
                                'nome_dieta': _model.nameController1.text,
                                'codigo_dieta': widget.codigoDieta,
                                'codigo_usuario': editDietUsuarioRow?.codigo,
                                'descricao_dieta': _model.nameController2.text,
                                'codigo_inicio': _model.checkboxValue,
                              },
                              matchingRows: (rows) => rows.eq(
                                'codigo_dieta',
                                widget.codigoDieta,
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
                        alignment: AlignmentDirectional(-0.83, -0.47),
                        child: Text(
                          'Conte mais sobre a sua dieta',
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
                            await DietaTable().update(
                              data: {
                                'codigo_ativo': false,
                              },
                              matchingRows: (rows) => rows
                                  .eq(
                                    'codigo_dieta',
                                    widget.codigoDieta,
                                  )
                                  .eq(
                                    'codigo_usuario',
                                    editDietUsuarioRow?.codigo,
                                  ),
                            );
                            await RefeicaoTable().update(
                              data: {
                                'codigo_ativo': false,
                              },
                              matchingRows: (rows) => rows.eq(
                                'codigo_dieta',
                                widget.codigoDieta,
                              ),
                            );

                            context.pushNamed('Dieta');
                          },
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
                                    alignment:
                                        AlignmentDirectional(-0.8, -0.63),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Container(
                                        width: 300.0,
                                        child: TextFormField(
                                          controller: _model.nameController1 ??=
                                              TextEditingController(
                                            text: stackDietaRow?.nomeDieta,
                                          ),
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
                            ),
                            Align(
                              alignment: AlignmentDirectional(-0.65, -0.19),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width: 350.0,
                                  child: TextFormField(
                                    controller: _model.nameController2 ??=
                                        TextEditingController(
                                      text: stackDietaRow?.descricaoDieta,
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
                      Align(
                        alignment: AlignmentDirectional(-0.8, 0.3),
                        child: Container(
                          width: 204.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Stack(
                              alignment: AlignmentDirectional(0.0, -1.0),
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor: Colors.black,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue ??=
                                          stackDietaRow!.codigoInicio,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.checkboxValue = newValue!);
                                        if (newValue!) {
                                          setState(() {
                                            _model.checkboxValue = true;
                                          });
                                        } else {
                                          setState(() {
                                            _model.checkboxValue = false;
                                          });
                                        }
                                      },
                                      activeColor: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      checkColor: FlutterFlowTheme.of(context)
                                          .customColor1,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.9, 0.0),
                                  child: Text(
                                    'Mostrar na pagina inicial?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Colors.black,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
