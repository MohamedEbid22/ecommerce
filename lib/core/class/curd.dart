import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommercee/core/class/statusrequest.dart';
import 'package:ecommercee/core/function/chickinternet.dart';
import 'package:http/http.dart' as http;

class Curd {
  Future<Either<StatusRequest, Map>> PostData(String linkurl, Map data) async {
    try {
      if (await ChickInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(response.statusCode);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
}
