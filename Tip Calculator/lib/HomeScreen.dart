import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const defaultBillAmount = 0.0;
  static const defaultTipPercentage = 15;
  final _billAmountController =
      TextEditingController(text: defaultBillAmount.toString());
  final _tipPercentageController =
      TextEditingController(text: defaultTipPercentage.toString());
  double _billAmount = defaultBillAmount;
  int _tipPercentage = defaultTipPercentage;

  @override
  void initState() {
    super.initState();
    _billAmountController.addListener(_onBillAmountChanged);
    _tipPercentageController.addListener(_onTipAmountChanged);
  }

  _onBillAmountChanged() {
    setState(() {
      _billAmount = double.tryParse(_billAmountController.text) ?? 0.0;
    });
  }

  _onTipAmountChanged() {
    setState(() {
      _tipPercentage = int.tryParse(_tipPercentageController.text) ?? 0;
    });
  }

  _getTipAmount() => _billAmount * _tipPercentage / 100;

  _getTotalAmount() => _billAmount + _getTipAmount();

  @override
  Widget build(BuildContext context) {
    // This method builds the UI of the Tip Calculator.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tip Calculator',
          style: TextStyle(
            color: Colors.blueAccent,
          ),
        ),
        backgroundColor: Colors.white70,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white70,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  key: Key("billAmount"),
                  controller: _billAmountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: 'Enter the Bill Amount',
                    labelText: 'Bill Amount',
                    labelStyle: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 25,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  key: Key("tipPercentage"),
                  controller: _tipPercentageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter the Tip Percentage',
                    labelText: 'Tip Percentage',
                    labelStyle: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 25,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(color: Colors.white),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(2, 2),
                        spreadRadius: 2,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      AmountText(
                        'Tip Amount: ${_getTipAmount()}',
                        key: Key('tipAmount'),
                      ),
                      AmountText(
                        'Total Amount: ${_getTotalAmount()}',
                        key: Key('totalAmount'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _billAmountController.dispose();
    _tipPercentageController.dispose();
    super.dispose();
  }
}

class AmountText extends StatelessWidget {
  final String text;

  const AmountText(
    this.text, {
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(text.toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
              fontSize: 20)),
    );
  }
}
