import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class homescreen extends StatefulWidget {
  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final Stored_data = GetStorage();

  int totalAmount = 50000;

  int atmBalance = 50000;

  int withdrawalAmount = 0;

  int hundred = 0;

  int twohundred = 0;

  int fivehundred = 0;

  int twothusand = 0;

  String lastTransactionDetails = "0";

  List<String> transaction_history = [];

  TextEditingController sbi_amount_controller = TextEditingController();

  void _clearTextField() => sbi_amount_controller.clear();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 160, 85, 251),
        title: const Text('My ATM', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * .2,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                shadows: const [
                  BoxShadow(
                    blurStyle: BlurStyle.outer,
                    color: Color(0x3F000000),
                    blurRadius: 22,
                    offset: Offset(0, -1),
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'ATM Amount',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs.100',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs.200',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs.500',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs.2000',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Rs.$atmBalance',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                        Text('Rs.${atmBalance ~/ 100}',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                        Text('Rs.${atmBalance ~/ 200}',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                        Text('Rs.${atmBalance ~/ 500}',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                        Text('Rs.${atmBalance ~/ 2000}',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: TextFormField(
                controller: sbi_amount_controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Enter Amount',
                    labelText: 'Enter Your Withdrawal amount',
                    border: OutlineInputBorder(),
                    enabled: true),
                onChanged: (value) =>
                    setState(() => withdrawalAmount = int.tryParse(value) ?? 0),
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 160, 85, 251),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 150, vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80))),
                onPressed: () {
                  _clearTextField();

                  if (withdrawalAmount % 100 == 0 &&
                      withdrawalAmount <= atmBalance) {
                    _withdrawMoney();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Withdrawal Successful!'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                    updateLastTransactionDetails();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid Withdrawal Amount!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                  FocusScope.of(context).unfocus();
                },
                child: const Text(
                  'WITHDRAW',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(" Last Transectione",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            Container(
              margin: const EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * .2,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                shadows: const [
                  BoxShadow(
                    blurStyle: BlurStyle.outer,
                    color: Color(0x3F000000),
                    blurRadius: 22,
                    offset: Offset(0, -1),
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'ATM Amount',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs.100',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs.200',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs.500',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rs.2000',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Rs.$withdrawalAmount',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                        Text('Rs.$hundred',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                        Text('Rs.$twohundred',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                        Text('Rs.$fivehundred',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                        Text('Rs.$twothusand',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              " Transaction History",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'ATM Amount',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rs.100',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rs.200',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rs.500',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rs.2000',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  height: MediaQuery.of(context).size.height * .7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: transaction_history
                        .map((transaction) => Text(
                              transaction,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void updateLastTransactionDetails() {
    int money2000 = withdrawalAmount ~/ 2000;
    int money500 = (withdrawalAmount % 2000) ~/ 500;
    int money200 = ((withdrawalAmount % 2000) % 500) ~/ 200;
    int money100 = (((withdrawalAmount % 2000) % 500) % 200) ~/ 100;

    lastTransactionDetails =
        '$withdrawalAmount - $money100, $money200, $money500, $money2000';
    hundred = money100;
    twohundred = money200;
    fivehundred = money500;
    twothusand = money2000;

    String transactionDetails =
        'Rs.${withdrawalAmount.toString().padLeft(13)} ${money100.toString().padLeft(13)}, ${money200.toString().padLeft(13)}, ${money500.toString().padLeft(13)}, ${money2000.toString().padLeft(13)}';
    transaction_history.add(transactionDetails);
  }

  void _withdrawMoney() => setState(() => atmBalance -= withdrawalAmount);
}
