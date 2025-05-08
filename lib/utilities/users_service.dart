// TODO-2: Import http and dart:convert
import 'dart:convert';
import 'package:http/http.dart';

class UsersService {
  static final UsersService _singleton = UsersService._internal();
  UsersService._internal();
  static UsersService get instance => _singleton;

  // TODO-3: Add base URL
  final String baseURL = 'https://68103e1927f2fdac2410aaa6.mockapi.io/User';

  Future<List<dynamic>> getUsers() async {
    // TODO-4: Fetch all users
    Response res = await get(Uri.parse('$baseURL'));
    if (res.statusCode == 200){
      return jsonDecode(res.body);
    }else{
      throw "Unable to retrieve contacts";
    }
  }

  Future<dynamic> updateUser(String id, Map<String, dynamic> data) async {
    // TODO-5: Update a user
    Response res = await put (
        Uri.parse('$baseURL/$id'),
        headers: {
          'Content-Type': 'application/json', // Specify the content type
        },
        body: jsonEncode(data), // Convert the map to JSON
    );
    if(res.statusCode == 200){
      return jsonDecode(res.body);
    }else{
      throw "Unable to update contact";
    }
  }

  Future<dynamic> createUser(Map<String, dynamic> data) async {
    // TODO-6: Create new user
    Response res = await post(
        Uri.parse('$baseURL'),
        headers: {
            'Content-Type': 'application/json', // Specify the content type
        },
        body: jsonEncode(data), // Convert the map to JSON
    );
  //Check the response status code
    if (res.statusCode == 201) { // Check for 201 Created
        return jsonDecode(res.body); // Parse and return the response body
    } else {
        throw "Unable to create user: ${res.statusCode}"; // Include status code in the error
    }
  }

  Future<dynamic> deleteUser(String id) async {
    // TODO-7: Delete a user
    Response res = await delete(
      Uri.parse('$baseURL/$id'),
      headers: {
        'Content-Type' : 'application/json',
      },
    );
    if (res.statusCode == 200){
      // return jsonDecode(res.body);
      print('User deleted successfully');
    }else{
      throw "Unable to delete contact";
    }
  }
}
