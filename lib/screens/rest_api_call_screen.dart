import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RestApiCallScreen extends StatefulWidget {
  const RestApiCallScreen({super.key});

  @override
  State<RestApiCallScreen> createState() => _RestApiCallScreenState();
}

class _RestApiCallScreenState extends State<RestApiCallScreen> {
  String _responseData = 'No data';
  bool _isLoading = false;
  SharedPreferences? pref;

  ///Entry point: server_url: https://ispickdev.bilsamtech.in/
  ///endpoint: api/v1/get-home-content
/// Request type: post type

  Future<void> _postData() async {
    setState(() {
      _isLoading = true;
    });

    try {

      // Replace with your API endpoint
      final url = Uri.parse('https://ispickdev.bilsamtech.in/api/v1/create-guest-token');

      // Prepare the data to be sent
      Map<String, dynamic> postParameter = {
        'deviceid': 'dkmdfjkvndjfnv',
        'userid': 1234,
        'email':"ssam@gmailc.com"
      };

      // Set up the headers
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };


      // Make the POST request
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(postParameter),
      );

      print("dfsdf: ${response.statusCode}");
      if (response.statusCode == 200) {
        ///decoding json data from api response to access
        Map<String, dynamic> responseData = json.decode(response.body);

        setState(() {
          _isLoading = false;
          _responseData = responseData['message'];
        });
        /// accessing data from json object
        print("dfsdf: ${responseData}");
        print("status: ${responseData['status']} "
            "\nmessage:${responseData['message']} "
            "\ndata:${responseData['data']} "
            "\nuser_type: ${responseData['data']['user_type']}");


        pref = await SharedPreferences.getInstance();
        await pref?.setString("user_token", responseData['data']['user_type']);
        await pref?.setInt("userid", 1);
        await pref?.setBool("status", responseData['status']);

        /// to save values locally
        /// 1. shared prefereneces
        // Value to store (key,value)
      }else{
        setState(() {
          _isLoading = false;
          _responseData = 'No data found';
        });
      }
    } catch (e) {
      setState(() {
        _responseData = 'Error: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _removeSharedPref() async {
    pref = await SharedPreferences.getInstance();
    await pref?.remove("user_token");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter POST API Call Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_isLoading)
              const CircularProgressIndicator()
            else
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(_responseData),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isLoading ? null : _postData,
              child: Text(_isLoading ? 'Sending...' : 'Send POST Request'),
            ),
          ],
        ),
      ),
    );
  }
}
