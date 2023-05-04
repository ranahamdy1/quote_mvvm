import 'package:flutter/material.dart';
import '../repositorys/quotes/quotes_api.dart';
import '../view_models/quote_view_model.dart';
import '../view_models/quotes_view_model.dart';

class QuotesView extends StatelessWidget {
  QuotesView({Key? key}) : super(key: key);
  //dependency injection
  final quotesViewModel = QuotesViewModel(quotesRepository: QuotesApi());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black26,
        ),
        body: Center(
            child: FutureBuilder<QuoteViewModel>(
          future: quotesViewModel.fetchAllQuotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              var quotes = snapshot.data;
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) => Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(32),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage("assets/images/2.jpeg"),
                          fit: BoxFit.cover,
                        )),
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Text(
                                quotes!.content,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Row(
                                  children: [
                                    const Text("author : ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)),
                                    Text(quotes.author),
                                  ],
                                ),
                              ),
                              Text("${quotes.tags}"),
                            ],
                          ),
                        ),
                      ));
            }
          },
        )));
  }
}
