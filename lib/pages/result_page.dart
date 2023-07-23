import 'package:chicken_sense/model/result_model.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({required this.result, super.key});
  static const routeName = '/result';
  final ResultCLass result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'ANALISIS PENYAKIT AYAM',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.blue, strokeAlign: 1.0)),
                    height: MediaQuery.of(context).size.height / 16,
                    width: MediaQuery.of(context).size.width / 2,
                    child: Center(child: Text(result.namaPenyakit))),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Column(
                    children: [
                      const Text(
                        'Gejala',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.fade,
                        result.gejala.join(','),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              height: MediaQuery.of(context).size.height * 2 / 3,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    child: Card(
                        child: Column(
                      children: [
                        const Text(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            'Penjelasan Singkat'),
                        Text(
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.fade,
                          result.summary,
                        ),
                      ],
                    )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    child: Card(
                      child: Column(
                        children: [
                          const Text(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              'Obat'),
                          Text(
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.fade,
                              result.obat.join(',')),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              'Aplikasi ini memiliki akurasi 88% \n jika masih ragu harap hubungi \n dokter hewan',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Image.asset('assets/explanation_logo.png'))
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
