import 'package:flutter/material.dart';
import 'package:food_buddy/components/constants.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  final double _minValue = 8.0;
  bool isLoading = false;
  bool hasError = false;
  String message = "";

  String _feedbackType = 'COMMENT';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextStyle _errorStyle = TextStyle(
    color: Colors.red,
    fontSize: 16.6,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<bool> _onBackTap() async {
    Navigator.of(context).pop();
    return true;
  }

  Widget _buildFirstName() {
    return TextFormField(
      controller: _firstNameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          errorStyle: _errorStyle,
          border: OutlineInputBorder(),
          contentPadding:
              EdgeInsets.symmetric(vertical: _minValue, horizontal: _minValue),
          labelText: 'İsim',
          hintText: 'İsim',
          labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      controller: _lastNameController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          errorStyle: _errorStyle,
          border: OutlineInputBorder(),
          contentPadding:
              EdgeInsets.symmetric(vertical: _minValue, horizontal: _minValue),
          hintText: 'Soyisim',
          labelText: 'Soyisim',
          labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          errorStyle: _errorStyle,
          border: OutlineInputBorder(),
          contentPadding:
              EdgeInsets.symmetric(vertical: _minValue, horizontal: _minValue),
          hintText: 'Email',
          labelText: 'Email',
          labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
    );
  }

  Widget _buildDescription() {
    return TextFormField(
      controller: _messageController,
      keyboardType: TextInputType.text,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
          errorStyle: _errorStyle,
          border: OutlineInputBorder(),
          contentPadding:
              EdgeInsets.symmetric(vertical: _minValue, horizontal: _minValue),
          labelText: 'Geri Bildirim',
          hintText: 'Geri Bildirim',
          labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
    );
  }

  Widget _buildSubmitBtn() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _minValue * 3),
      child: RaisedButton(
        onPressed: () => null,
        padding: EdgeInsets.symmetric(vertical: _minValue * 2),
        elevation: 0.0,
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        child: Text('SAVE'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onBackTap,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0.0,
          title: Text("Food Buddy Geri Bildirim"),
          centerTitle: true,
        ),
        backgroundColor: Color.fromARGB(255, 240, 233, 233),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: _minValue * 2, vertical: _minValue * 3),
              child: Text(
                "Food Buddy ekibi olarak fikirlerinizi ve geri bildirimlerinizi önemsiyoruz. Uygulamamızı daha iyi hale getirmek için önerilerinizi bizimle paylaşmanız çok değerli.",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Container(
              padding: EdgeInsets.all(_minValue * 2),
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(child: Text("Geri bildirim", style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 20),)),
                      SizedBox(
                        height: _minValue * 3,
                      ),
                      _buildFirstName(),
                      SizedBox(
                        height: _minValue * 3,
                      ),
                      _buildLastName(),
                      SizedBox(
                        height: _minValue * 3,
                      ),
                      _buildEmail(),
                      SizedBox(
                        height: _minValue * 3,
                      ),
                      _buildDescription(),
                      SizedBox(
                        height: _minValue * 4,
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          width: size.width * 0.8,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(29),
                              child: ElevatedButton(
                                child: Text(
                                  'GÖNDER',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  if (_emailController.text == "" ||
                                      _messageController.text == "" ||
                                      _firstNameController == "" ||
                                      _lastNameController == "") {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          "Geri bildiriminizin ekibimize ulaşması için bütün alanları doldurmanız gerekir."),
                                      backgroundColor: Color.fromARGB(255, 231, 165, 164),
                                    ));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                "Tebrikler! Geri bildirminiz başarılı bir şekilde gönderilmiştir. Zaman ayırdığınız için teşekkür ederiz."), backgroundColor: Color.fromARGB(255, 164, 218, 166),));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: kPrimaryColor,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 20),
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                              )),
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
/*class FeedbackPage extends StatelessWidget {
  const FeedbackPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}*/

