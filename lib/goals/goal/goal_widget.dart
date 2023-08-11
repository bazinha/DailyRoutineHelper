import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'goal_model.dart';
export 'goal_model.dart';

class GoalWidget extends StatefulWidget {
  const GoalWidget({Key? key}) : super(key: key);

  @override
  _GoalWidgetState createState() => _GoalWidgetState();
}

class _GoalWidgetState extends State<GoalWidget> {
  late GoalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoalModel());

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
        List<UsuarioRow> goalUsuarioRowList = snapshot.data!;
        final goalUsuarioRow =
            goalUsuarioRowList.isNotEmpty ? goalUsuarioRowList.first : null;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.white,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/Design_sem_nome.png',
                        width: 406.0,
                        height: 866.0,
                        fit: BoxFit.cover,
                      ),
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
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.home,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('HomePage');
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              'Metas',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 150.0),
                      child: Stack(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-0.98, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 120.0, 0.0, 0.0),
                              child: FutureBuilder<List<MetaRow>>(
                                future: MetaTable().queryRows(
                                  queryFn: (q) => q
                                      .eq(
                                        'codigo_usuario',
                                        goalUsuarioRow?.codigo,
                                      )
                                      .eq(
                                        'codigo_ativa',
                                        true,
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<MetaRow> columnMetaRowList =
                                      snapshot.data!;
                                  return SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          columnMetaRowList.length,
                                          (columnIndex) {
                                        final columnMetaRow =
                                            columnMetaRowList[columnIndex];
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Container(
                                                  width: 412.0,
                                                  height: 53.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.7, -0.05),
                                                        child: Text(
                                                          columnMetaRow
                                                              .nomeMeta,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                              ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.25, -0.3),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      360.0,
                                                                      0.0),
                                                          child: Theme(
                                                            data: ThemeData(
                                                              checkboxTheme:
                                                                  CheckboxThemeData(
                                                                visualDensity:
                                                                    VisualDensity
                                                                        .compact,
                                                                materialTapTargetSize:
                                                                    MaterialTapTargetSize
                                                                        .shrinkWrap,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              4.0),
                                                                ),
                                                              ),
                                                              unselectedWidgetColor:
                                                                  Colors.black,
                                                            ),
                                                            child: Checkbox(
                                                              value: _model
                                                                      .checkboxValueMap[
                                                                  columnMetaRow] ??= false,
                                                              onChanged:
                                                                  (newValue) async {
                                                                setState(() =>
                                                                    _model.checkboxValueMap[
                                                                            columnMetaRow] =
                                                                        newValue!);
                                                                if (newValue!) {
                                                                  await MetaTable()
                                                                      .update(
                                                                    data: {
                                                                      'codigo_ativa':
                                                                          false,
                                                                    },
                                                                    matchingRows:
                                                                        (rows) =>
                                                                            rows.eq(
                                                                      'codigo_meta',
                                                                      columnMetaRow
                                                                          .codigoMeta,
                                                                    ),
                                                                  );
                                                                } else {
                                                                  await MetaTable()
                                                                      .update(
                                                                    data: {
                                                                      'codigo_ativa':
                                                                          true,
                                                                    },
                                                                    matchingRows:
                                                                        (rows) =>
                                                                            rows.eq(
                                                                      'codigo_meta',
                                                                      columnMetaRow
                                                                          .codigoMeta,
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                              activeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor1,
                                                              checkColor:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.87, 0.03),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      30.0,
                                                                      0.0),
                                                          child:
                                                              FlutterFlowIconButton(
                                                            borderRadius: 20.0,
                                                            borderWidth: 1.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .info_outline,
                                                              color:
                                                                  Colors.black,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                'EditGoal',
                                                                queryParameters:
                                                                    {
                                                                  'codigoMeta':
                                                                      serializeParam(
                                                                    columnMetaRow
                                                                        .codigoMeta,
                                                                    ParamType
                                                                        .int,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 650.0, 0.0, 0.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.03, -0.83),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('AddGoal');
                            },
                            text: 'Adicionar',
                            options: FFButtonOptions(
                              width: 187.0,
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
                      ],
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-0.17, 1.0),
                    child: Container(
                      width: 411.0,
                      height: 73.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).info,
                      ),
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
                                  FFIcons.kgoalSvgrepoCom1,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  size: 50.0,
                                ),
                                onPressed: () async {
                                  context.pushNamed('Goal');
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.99, 0.69),
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
                                          .primaryBtnText,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.78, 0.69),
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
                                          .primaryBtnText,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.86, -4.11),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                FFIcons.kdumbbellSvgrepoCom,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                size: 250.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('Workout');
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.44, 0.69),
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
                                          .primaryBtnText,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.36, -0.97),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                FFIcons.ktimeSvgrepoCom,
                                color: FlutterFlowTheme.of(context).gray200,
                                size: 50.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('Routine');
                              },
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.15, 0.65),
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
                                          .primaryBtnText,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.22, -1.89),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 60.0,
                              icon: Icon(
                                FFIcons.kmealSvgrepoCom,
                                color:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                size: 70.0,
                              ),
                              onPressed: () async {
                                context.pushNamed('Dieta');
                              },
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
      },
    );
  }
}
