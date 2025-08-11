class AppException implements Exception{
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString(){
    return "$_prefix$_message";
  }
}

class InternetException extends AppException{
  InternetException([String? message]) : super(message, "No Internet Connection");
}

class RequestTimeOutException extends AppException{
  RequestTimeOutException([String? message]) : super(message, "Request TimeOut");
}

class ServerException extends AppException{
  ServerException([String? message]) : super(message, "Internal Server Error");
}

class InvalidUrlException extends AppException{
  InvalidUrlException([String? message]) : super(message, "Invalid Url");
}

class FetchDataException extends AppException{
  FetchDataException([String? message]) : super(message, "Error During Communication");

}

class BadRequestException extends AppException{
  BadRequestException([String? message]) : super(message, "Invalid Request");
}

class UnauthorisedException extends AppException{
  UnauthorisedException([String? message]) : super(message, "Unauthorised");
}

class InvalidInputException extends AppException{
  InvalidInputException([String? message]) : super(message, "Invalid Input");
}

