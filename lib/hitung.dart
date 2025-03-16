import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String passedUrl;
  final String passedTitle;
  final int passedPrice;

  const OrderPage(
      {super.key,
      required this.passedUrl,
      required this.passedTitle,
      required this.passedPrice});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final jumlah = TextEditingController();
  int total = 0;
  String errorMessage = '';

  _calculate() {
    setState(() {
      try {
        total = widget.passedPrice * int.parse(jumlah.text);
        errorMessage = '';
      } catch (e) {
        errorMessage = 'Input harus berupa angka';
        total = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Detail Pilihan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: 550,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(widget.passedUrl),
              Text(
                widget.passedTitle,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "Rp.${widget.passedPrice},00",
                style: TextStyle(fontSize: 17),
              ),
              TextField(
                controller: jumlah,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(label: Text("Jumlah beli")),
              ),
              ElevatedButton(
                  onPressed: () {
                    _calculate();
                  },
                  child: Text("Hitung")),
              Text(
                "TOTAL HARGA : Rp.$total,00",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              if (errorMessage.isNotEmpty)
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ),
    ));
  }
}
