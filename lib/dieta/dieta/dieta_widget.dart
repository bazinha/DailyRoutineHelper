import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dieta_model.dart';
export 'dieta_model.dart';

class DietaWidget extends StatefulWidget {
  const DietaWidget({Key? key}) : super(key: key);

  @override
  _DietaWidgetState createState() => _DietaWidgetState();
}

class _DietaWidgetState extends State<DietaWidget> {
  late DietaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DietaModel());

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
        List<UsuarioRow> dietaUsuarioRowList = snapshot.data!;
        final dietaUsuarioRow =
            dietaUsuarioRowList.isNotEmpty ? dietaUsuarioRowList.first : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Stack(
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
                        alignment: AlignmentDirectional(-0.17, 1.0),
                        child: Container(
                          width: double.infinity,
                          height: 75.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF1C4494),
                          ),
                          child: Container(
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, -0.97),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 0.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 50.0,
                                      icon: Icon(
                                        FFIcons.kgoalSvgrepoCom,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        size: 50.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed('Goal');
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.56),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        21.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Metas',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.33, -0.88),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 50.0,
                                    icon: Icon(
                                      FFIcons.ktimeSvgrepoCom,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 50.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed('Rotina');
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.35, 0.64),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        21.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Rotina',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.56),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        21.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Metas',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.26, -1.23),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 50.0,
                                    icon: Icon(
                                      FFIcons.kmealSvgrepoCom,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 60.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed('Dieta');
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.24, 0.56),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        21.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Dieta',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.79, -2.12),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 50.0,
                                    icon: Icon(
                                      FFIcons.kdumbbellSvgrepoCom,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 200.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed('Treino');
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.77, 0.52),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        21.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Treino',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                                  'Dieta',
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
                    ],
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 170.0),
                      child: Stack(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 120.0, 0.0, 0.0),
                              child: FutureBuilder<List<DietaRow>>(
                                future: DietaTable().queryRows(
                                  queryFn: (q) => q
                                      .eq(
                                        'codigo_usuario',
                                        dietaUsuarioRow?.codigo,
                                      )
                                      .eq(
                                        'codigo_ativo',
                                        true,
                                      )
                                      .order('codigo_dieta', ascending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<DietaRow> columnDietaRowList =
                                      snapshot.data!;
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(
                                          columnDietaRowList.length,
                                          (columnIndex) {
                                        final columnDietaRow =
                                            columnDietaRowList[columnIndex];
                                        return Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: 367.0,
                                                    height: 51.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.01,
                                                                      -0.82),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  columnDietaRow
                                                                      .nomeDieta,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Plus Jakarta Sans',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            20.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .info_outline,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 24.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'DietaItens',
                                                                    queryParameters:
                                                                        {
                                                                      'codigoDieta':
                                                                          serializeParam(
                                                                        columnDietaRow
                                                                            .codigoDieta,
                                                                        ParamType
                                                                            .int,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 1.0),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        5.0,
                                                                        5.0,
                                                                        5.0),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.horizontal,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      columnDietaRow
                                                                          .descricaoDieta!,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Plus Jakarta Sans',
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).divide(SizedBox(height: 5.0)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.08, 0.76),
                    child: FFButtonWidget(
                      onPressed: () async {
                        context.pushNamed('AdicionarDieta');
                      },
                      text: 'Adicionar',
                      options: FFButtonOptions(
                        width: 132.0,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
