import 'package:dio/dio.dart';
import 'package:quick_eats_delivery_boy/data/datasource/remote/dio/dio_client.dart';
import 'package:quick_eats_delivery_boy/data/datasource/remote/exception/api_error_handler.dart';
import 'package:quick_eats_delivery_boy/common/models/api_response_model.dart';
import 'package:quick_eats_delivery_boy/features/home/enums/delivery_analytics_time_range_enum.dart';
import 'package:quick_eats_delivery_boy/utill/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderRepo {
  final DioClient? dioClient;
  final SharedPreferences? sharedPreferences;

  OrderRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponseModel> getAllOrders(int offset) async {
    try {
      final response = await dioClient!.get(
          '${AppConstants.currentOrdersUri}${sharedPreferences!.get(AppConstants.token)}&limit=10&offset=$offset'
      );
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> getOrderDetails({String? orderID}) async {
    try {
      final response = await dioClient!.get('${AppConstants.orderDetailsUri}${sharedPreferences!.get(AppConstants.token)}&order_id=$orderID');
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> getDeliveryOrderStatistics({String? filter}) async {
    try {
      final response = await dioClient!.get('${AppConstants.deliveryOrderStatisticsUri}?token=${sharedPreferences!.get(AppConstants.token)}&filter=${filter ?? DeliveryAnalyticsTimeRangeEnum.all_time.name}');
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponseModel> getAllOrderHistory(int offset, String status) async {
    try {
      final response = await dioClient!.get('${AppConstants.orderHistoryUri}${sharedPreferences!.get(AppConstants.token)}&status=$status&limit=8&offset=$offset');
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> updateOrderStatus({String? token, int? orderId, String? status}) async {
    try {
      Response response = await dioClient!.post(
        AppConstants.updateOrderStatusUri,
        data: {"token": token, "order_id": orderId, "status": status, "_method": 'put'},
      );
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponseModel> updatePaymentStatus({String? token, int? orderId, String? status}) async {
    try {
      Response response = await dioClient!.post(
        AppConstants.updatePaymentStatusUri,
        data: {"token": token, "order_id": orderId, "status": status, "_method": 'put'},
      );
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponseModel> getOrderModel(String orderId) async {
    try {
      final response = await dioClient!.get('${AppConstants.getOrderModel}${sharedPreferences!.get(AppConstants.token)}&id=$orderId');
      return ApiResponseModel.withSuccess(response);
    } catch (e) {
      return ApiResponseModel.withError(ApiErrorHandler.getMessage(e));
    }
  }
}
