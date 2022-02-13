import '../api/pdf_api.dart';
import '../api/pdf_invoice_api.dart';
import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../homepage/homepage_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/customer.dart';
import '../model/invoice.dart';
import '../model/supplier.dart';

class SucessoWidget extends StatefulWidget {
  const SucessoWidget({
    Key key,
    this.price,
  }) : super(key: key);

  final String price;

  @override
  _SucessoWidgetState createState() => _SucessoWidgetState();
}

class _SucessoWidgetState extends State<SucessoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Color(0xFF1E2429),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      buttonSize: 46,
                      icon: Icon(
                        Icons.close_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () async {
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomepageWidget(),
                          ),
                          (r) => false,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: Color(0xFF333366),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(70),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                  child: Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Text(
                'Pagemento Confirmado !!!',
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF333366),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Text(
                '\$425.24',
                style: GoogleFonts.getFont(
                  'Overpass',
                  color: Colors.white,
                  fontWeight: FontWeight.w100,
                  fontSize: 72,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
              child: Text(
                'Seu pagamento foi confirmado. Pode levar de 1 a 2 horas para que o pagamento seja processado e apareça na sua lista de transações.',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.bodyText2.override(
                  fontFamily: 'Lexend Deca',
                  color: Color(0xFF8B97A2),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: Container(
                width: 300,
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xFF1E2429),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0xFF090F13),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Image.asset(
                        'assets/images/VISAW.png',
                        width: 40,
                        height: 40,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                            child: AuthUserStreamWidget(
                              child: Text(
                                'XXXX XXXX XXXX ${functions.lastfourdigits(currentUserDocument?.cardNumber)}',
                                style: FlutterFlowTheme.bodyText2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF8B97A2),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                            child: Text(
                              '${widget.price} Mt',
                              style: FlutterFlowTheme.subtitle2.override(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        print('Button pressed ...');
                        final date = DateTime.now();
                        final dueDate = date.add(Duration(days: 7));

                        final invoice = Invoice(
                          supplier: Supplier(
                            name: 'Sarah Field',
                            address: 'Sarah Street 9, Beijing, China',
                            paymentInfo: 'https://paypal.me/sarahfieldzz',
                          ),
                          customer: Customer(
                            name: 'Apple Inc.',
                            address: 'Apple Street, Cupertino, CA 95014',
                          ),
                          info: InvoiceInfo(
                            date: date,
                            dueDate: dueDate,
                            description: 'My description...',
                            number: '${DateTime.now().year}-9999',
                          ),
                          items: [
                            InvoiceItem(
                              description: 'Coffee',
                              date: DateTime.now(),
                              quantity: 3,
                              vat: 0.19,
                              unitPrice: 5.99,
                            ),
                            InvoiceItem(
                              description: 'Water',
                              date: DateTime.now(),
                              quantity: 8,
                              vat: 0.19,
                              unitPrice: 0.99,
                            ),
                            InvoiceItem(
                              description: 'Orange',
                              date: DateTime.now(),
                              quantity: 3,
                              vat: 0.19,
                              unitPrice: 2.99,
                            ),
                            InvoiceItem(
                              description: 'Apple',
                              date: DateTime.now(),
                              quantity: 8,
                              vat: 0.19,
                              unitPrice: 3.99,
                            ),
                            InvoiceItem(
                              description: 'Mango',
                              date: DateTime.now(),
                              quantity: 1,
                              vat: 0.19,
                              unitPrice: 1.59,
                            ),
                            InvoiceItem(
                              description: 'Blue Berries',
                              date: DateTime.now(),
                              quantity: 5,
                              vat: 0.19,
                              unitPrice: 0.99,
                            ),
                            InvoiceItem(
                              description: 'Lemon',
                              date: DateTime.now(),
                              quantity: 4,
                              vat: 0.19,
                              unitPrice: 1.29,
                            ),
                          ],
                        );

                        final pdfFile = await PdfInvoiceApi.generate(invoice);

                        PdfApi.openFile(pdfFile);
                      },
                      text: 'BAIXAR RECIBO',
                      options: FFButtonOptions(
                        width: 230,
                        height: 50,
                        color: Color(0xFF1E2429),
                        textStyle: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        elevation: 0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
