import 'package:flutter/material.dart';
import 'package:newmum/widget/generalWidget/uniheader.dart';

class choosingInstitute extends StatefulWidget {
  const choosingInstitute({super.key});

  @override
  State<choosingInstitute> createState() => _choosingInstituteState();
}

class _choosingInstituteState extends State<choosingInstitute> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Uniheader(),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              width: 382,
              height: 410,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 78,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 217, 217, 217),
                          shape: BoxShape.circle,
                          border: Border.fromBorderSide(BorderSide.none),
                        ),
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 217, 217, 217),
                          shape: BoxShape.circle,
                          border: Border.fromBorderSide(BorderSide.none),
                        ),
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 217, 217, 217),
                          shape: BoxShape.circle,
                          border: Border.fromBorderSide(BorderSide.none),
                        ),
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 217, 217, 217),
                          shape: BoxShape.circle,
                          border: Border.fromBorderSide(BorderSide.none),
                        ),
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle,
                          border: Border.fromBorderSide(BorderSide.none),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const SizedBox(
              width: 380,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      "Choose Your",
                      style: TextStyle(
                        fontFamily: "NexaDemo-Bold",
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      "Institution",
                      style: TextStyle(
                        fontFamily: "NexaDemo-Bold",
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search",
                      hintStyle:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: 380,
                    height: 60,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: (_formKey.currentState != null &&
                                _formKey.currentState!.validate())
                            ? Colors.red
                            : Colors.grey,
                        side: BorderSide.none,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                            fontFamily: "Outfit-Medium",
                            fontWeight: FontWeight.w700,
                            fontSize: 23),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Done"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
