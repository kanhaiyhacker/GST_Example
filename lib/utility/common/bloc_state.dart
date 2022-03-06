import 'package:gst_app/data/error/app_error.dart';

abstract class ApiState<T> {
  final Status status;
  final T? data;
  final String? message;
  final AppError? error;

  ApiState.loading(this.message, {this.data, this.error})
      : status = Status.loading;

  ApiState.completed(this.data, {this.message, this.error})
      : status = Status.completed;

  ApiState.error(this.error, {this.data, this.message})
      : status = Status.error;

  ApiState.initial({this.data, this.message, this.error})
      : status = Status.initial;
}

enum Status { loading, completed, error, initial }
