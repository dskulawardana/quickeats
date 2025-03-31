class ConfigModel {
  String? _quickeatsName;
  String? _quickeatsOpenTime;
  String? _quickeatsCloseTime;
  String? _quickeatsLogo;
  String? _quickeatsAddress;
  String? _quickeatsPhone;
  String? _quickeatsEmail;
  BaseUrls? _baseUrls;
  String? _currencySymbol;
  double? _deliveryCharge;
  String? _cashOnDelivery;
  String? _digitalPayment;
  String? _termsAndConditions;
  String? _privacyPolicy;
  String? _aboutUs;
  bool? _emailVerification;
  bool? _phoneVerification;
  String? _currencySymbolPosition;

  String? _countryCode;
  bool? _selfPickup;
  bool? _homeDelivery;
  quickeatsLocationCoverage? _quickeatsLocationCoverage;
  double? _minimumOrderValue;
  List<Branches>? _branches;
  DeliveryManagement? _deliveryManagement;
  int? _decimalPointSettings;
  String? _timeFormat;
  bool? _toggleDmRegistration;
  bool? _isVegNonVegActive;
  MaintenanceMode? _maintenanceMode;



  ConfigModel(
      {String? quickeatsName,
        String? quickeatsOpenTime,
        String? quickeatsCloseTime,
        String? quickeatsLogo,
        String? quickeatsAddress,
        String? quickeatsPhone,
        String? quickeatsEmail,
        BaseUrls? baseUrls,
        String? currencySymbol,
        double? deliveryCharge,
        String? cashOnDelivery,
        String? digitalPayment,
        String? termsAndConditions,
        String? privacyPolicy,
        String? aboutUs,
        bool? emailVerification,
        bool? phoneVerification,
        String? currencySymbolPosition,

        String? countryCode,
        quickeatsLocationCoverage? quickeatsLocationCoverage,
        double? minimumOrderValue,
        List<Branches>? branches,
        bool? selfPickup,
        bool? homeDelivery,
        DeliveryManagement? deliveryManagement,
        int? decimalPointSettings,
        String? timeFormat,
        bool? toggleDmRegistration,
        bool? isVegNonVegActive,
        MaintenanceMode? maintenanceMode

      }) {
    _quickeatsName = quickeatsName;
    _quickeatsOpenTime = quickeatsOpenTime;
    _quickeatsCloseTime = quickeatsCloseTime;
    _quickeatsLogo = quickeatsLogo;
    _quickeatsAddress = quickeatsAddress;
    _quickeatsPhone = quickeatsPhone;
    _quickeatsEmail = quickeatsEmail;
    _baseUrls = baseUrls;
    _currencySymbol = currencySymbol;
    _deliveryCharge = deliveryCharge;
    _cashOnDelivery = cashOnDelivery;
    _digitalPayment = digitalPayment;
    _termsAndConditions = termsAndConditions;
    _aboutUs = aboutUs;
    _privacyPolicy = privacyPolicy;
    _quickeatsLocationCoverage = quickeatsLocationCoverage;
    _minimumOrderValue = minimumOrderValue;
    _branches = branches;
    _emailVerification = emailVerification;
    _phoneVerification = phoneVerification;
    _currencySymbolPosition = currencySymbolPosition;

    if (maintenanceMode != null) {
      _maintenanceMode = maintenanceMode;
    }
    _countryCode = countryCode;
    _selfPickup = selfPickup;
    _homeDelivery = homeDelivery;
    _deliveryManagement = deliveryManagement;
    _decimalPointSettings = decimalPointSettings;
    _timeFormat = timeFormat;
    _toggleDmRegistration = toggleDmRegistration;
    _isVegNonVegActive = isVegNonVegActive;

  }

  String? get quickeatsName => _quickeatsName;
  String? get quickeatsOpenTime => _quickeatsOpenTime;
  String? get quickeatsCloseTime => _quickeatsCloseTime;
  String? get quickeatsLogo => _quickeatsLogo;
  String? get quickeatsAddress => _quickeatsAddress;
  String? get quickeatsPhone => _quickeatsPhone;
  String? get quickeatsEmail => _quickeatsEmail;
  BaseUrls? get baseUrls => _baseUrls;
  String? get currencySymbol => _currencySymbol;
  double? get deliveryCharge => _deliveryCharge;
  String? get cashOnDelivery => _cashOnDelivery;
  String? get digitalPayment => _digitalPayment;
  String? get termsAndConditions => _termsAndConditions;
  String? get aboutUs=> _aboutUs;
  String? get privacyPolicy=> _privacyPolicy;
  quickeatsLocationCoverage? get quickeatsLocationCoverage => _quickeatsLocationCoverage;
  double? get minimumOrderValue => _minimumOrderValue;
  List<Branches>? get branches => _branches;
  bool? get emailVerification => _emailVerification;
  bool? get phoneVerification => _phoneVerification;
  String? get currencySymbolPosition => _currencySymbolPosition;

  String? get countryCode => _countryCode;
  bool? get selfPickup => _selfPickup;
  bool? get homeDelivery => _homeDelivery;
  DeliveryManagement? get deliveryManagement => _deliveryManagement;
  int? get decimalPointSettings => _decimalPointSettings;
  String? get timeFormat => _timeFormat;
  bool? get toggleDmRegistration => _toggleDmRegistration;
  bool? get isVegNonVegActive => _isVegNonVegActive;
  MaintenanceMode? get maintenanceMode => _maintenanceMode;


  ConfigModel.fromJson(Map<String, dynamic> json) {
    _quickeatsName = json['quickeats_name'];
    _quickeatsOpenTime = json['quickeats_open_time'];
    _quickeatsCloseTime = json['quickeats_close_time'];
    _quickeatsLogo = json['quickeats_logo'];
    _quickeatsAddress = json['quickeats_address'];
    _quickeatsPhone = json['quickeats_phone'];
    _quickeatsEmail = json['quickeats_email'];
    _baseUrls = json['base_urls'] != null
        ? BaseUrls.fromJson(json['base_urls'])
        : null;
    _currencySymbol = json['currency_symbol'];
    _deliveryCharge = json['delivery_charge'].toDouble();
    _cashOnDelivery = json['cash_on_delivery'];
    _digitalPayment = json['digital_payment'];
    _termsAndConditions = json['terms_and_conditions'];
    _privacyPolicy = json['privacy_policy'];
    _aboutUs = json['about_us'];
    _emailVerification = json['email_verification'];
    _phoneVerification = json['phone_verification'];
    _currencySymbolPosition = json['currency_symbol_position'];
    _maintenanceMode = json['advance_maintenance_mode'] != null
        ? MaintenanceMode.fromJson(json['advance_maintenance_mode'])
        : null;

    _countryCode = json['country'];
    _selfPickup = json['self_pickup'];
    _homeDelivery = json['delivery'];
    _quickeatsLocationCoverage = json['quickeats_location_coverage'] != null
        ? quickeatsLocationCoverage.fromJson(json['quickeats_location_coverage']) : null;
    _minimumOrderValue = json['minimum_order_value'] != null ? json['minimum_order_value'].toDouble() : 0;
    if (json['branches'] != null) {
      _branches = [];
      json['branches'].forEach((v) {
        _branches!.add(Branches.fromJson(v));
      });
    }
    _deliveryManagement = json['delivery_management'] != null
        ? DeliveryManagement.fromJson(json['delivery_management'])
        : null;
    _decimalPointSettings = json['decimal_point_settings'] ?? 1;
    _timeFormat =  json['time_format'];
    _toggleDmRegistration =  '${json['toggle_dm_registration']}'.contains('1');
    _isVegNonVegActive = '${json['is_veg_non_veg_active']}'.contains('1');

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quickeats_name'] = _quickeatsName;
    data['quickeats_open_time'] = _quickeatsOpenTime;
    data['quickeats_close_time'] = _quickeatsCloseTime;
    data['quickeats_logo'] = _quickeatsLogo;
    data['quickeats_address'] = _quickeatsAddress;
    data['quickeats_phone'] = _quickeatsPhone;
    data['quickeats_email'] = _quickeatsEmail;
    if (_baseUrls != null) {
      data['base_urls'] = _baseUrls!.toJson();
    }
    data['currency_symbol'] = _currencySymbol;
    data['delivery_charge'] = _deliveryCharge;
    data['cash_on_delivery'] = _cashOnDelivery;
    data['digital_payment'] = _digitalPayment;
    data['terms_and_conditions'] = _termsAndConditions;
    data['privacy_policy'] = privacyPolicy;
    data['about_us'] = aboutUs;
    data['email_verification'] = emailVerification;
    data['phone_verification'] = phoneVerification;
    data['currency_symbol_position'] = currencySymbolPosition;

    data['country'] = countryCode;
    data['self_pickup'] = selfPickup;
    data['delivery'] = homeDelivery;
    if (_quickeatsLocationCoverage != null) {
      data['quickeats_location_coverage'] = _quickeatsLocationCoverage!.toJson();
    }
    if (maintenanceMode != null) {
      data['advance_maintenance_mode'] = maintenanceMode!.toJson();
    }
    data['minimum_order_value'] = _minimumOrderValue;
    if (_branches != null) {
      data['branches'] = _branches!.map((v) => v.toJson()).toList();
    }
    if (_deliveryManagement != null) {
      data['delivery_management'] = _deliveryManagement!.toJson();
    }
    return data;
  }
}

class BaseUrls {
  String? _productImageUrl;
  String? _customerImageUrl;
  String? _bannerImageUrl;
  String? _categoryImageUrl;
  String? _reviewImageUrl;
  String? _notificationImageUrl;
  String? _quickeatsImageUrl;
  String? _deliveryManImageUrl;
  String? _chatImageUrl;

  BaseUrls(
      {String? productImageUrl,
        String? customerImageUrl,
        String? bannerImageUrl,
        String? categoryImageUrl,
        String? reviewImageUrl,
        String? notificationImageUrl,
        String? quickeatsImageUrl,
        String? deliveryManImageUrl,
        String? chatImageUrl}) {
    _productImageUrl = productImageUrl;
    _customerImageUrl = customerImageUrl;
    _bannerImageUrl = bannerImageUrl;
    _categoryImageUrl = categoryImageUrl;
    _reviewImageUrl = reviewImageUrl;
    _notificationImageUrl = notificationImageUrl;
    _quickeatsImageUrl = quickeatsImageUrl;
    _deliveryManImageUrl = deliveryManImageUrl;
    _chatImageUrl = chatImageUrl;
  }

  String? get productImageUrl => _productImageUrl;
  String? get customerImageUrl => _customerImageUrl;
  String? get bannerImageUrl => _bannerImageUrl;
  String? get categoryImageUrl => _categoryImageUrl;
  String? get reviewImageUrl => _reviewImageUrl;
  String? get notificationImageUrl => _notificationImageUrl;
  String? get quickeatsImageUrl => _quickeatsImageUrl;
  String? get deliveryManImageUrl => _deliveryManImageUrl;
  String? get chatImageUrl => _chatImageUrl;

  BaseUrls.fromJson(Map<String, dynamic> json) {
    _productImageUrl = json['product_image_url'];
    _customerImageUrl = json['customer_image_url'];
    _bannerImageUrl = json['banner_image_url'];
    _categoryImageUrl = json['category_image_url'];
    _reviewImageUrl = json['review_image_url'];
    _notificationImageUrl = json['notification_image_url'];
    _quickeatsImageUrl = json['quickeats_image_url'];
    _deliveryManImageUrl = json['delivery_man_image_url'];
    _chatImageUrl = json['chat_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_image_url'] = _productImageUrl;
    data['customer_image_url'] = _customerImageUrl;
    data['banner_image_url'] = _bannerImageUrl;
    data['category_image_url'] = _categoryImageUrl;
    data['review_image_url'] = _reviewImageUrl;
    data['notification_image_url'] = _notificationImageUrl;
    data['quickeats_image_url'] = _quickeatsImageUrl;
    data['delivery_man_image_url'] = _deliveryManImageUrl;
    data['chat_image_url'] = _chatImageUrl;
    return data;
  }
}

class quickeatsLocationCoverage {
  String? _longitude;
  String? _latitude;
  double? _coverage;

  quickeatsLocationCoverage(
      {String? longitude, String? latitude, double? coverage}) {
    _longitude = longitude;
    _latitude = latitude;
    _coverage = coverage;
  }

  String? get longitude => _longitude;
  String? get latitude => _latitude;
  double? get coverage => _coverage;

  quickeatsLocationCoverage.fromJson(Map<String, dynamic> json) {
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _coverage = json['coverage'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['longitude'] = _longitude;
    data['latitude'] = _latitude;
    data['coverage'] = _coverage;
    return data;
  }
}

class Branches {
  int? _id;
  String? _name;
  String? _email;
  String? _longitude;
  String? _latitude;
  String? _address;
  double? _coverage;

  Branches(
      {int? id,
        String? name,
        String? email,
        String? longitude,
        String? latitude,
        String? address,
        double? coverage}) {
    _id = id;
    _name = name;
    _email = email;
    _longitude = longitude;
    _latitude = latitude;
    _address = address;
    _coverage = coverage;
  }

  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get longitude => _longitude;
  String? get latitude => _latitude;
  String? get address => _address;
  double? get coverage => _coverage;

  Branches.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _address = json['address'];
    _coverage = json['coverage'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['email'] = _email;
    data['longitude'] = _longitude;
    data['latitude'] = _latitude;
    data['address'] = _address;
    data['coverage'] = _coverage;
    return data;
  }
}

class DeliveryManagement {
  int? _status;
  double? _minShippingCharge;
  double? _shippingPerKm;

  DeliveryManagement(
      {int? status, double? minShippingCharge, double? shippingPerKm}) {
    _status = status;
    _minShippingCharge = minShippingCharge;
    _shippingPerKm = shippingPerKm;
  }

  int? get status => _status;
  double? get minShippingCharge => _minShippingCharge;
  double? get shippingPerKm => _shippingPerKm;

  DeliveryManagement.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _minShippingCharge = json['min_shipping_charge'].toDouble();
    _shippingPerKm = json['shipping_per_km'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = _status;
    data['min_shipping_charge'] = _minShippingCharge;
    data['shipping_per_km'] = _shippingPerKm;
    return data;
  }
}

class MaintenanceMode {
  int? maintenanceStatus;
  SelectedMaintenanceSystem? selectedMaintenanceSystem;
  MaintenanceMessages? maintenanceMessages;
  MaintenanceTypeAndDuration? maintenanceTypeAndDuration;

  MaintenanceMode(
      {this.maintenanceStatus,
        this.selectedMaintenanceSystem,
        this.maintenanceMessages, this.maintenanceTypeAndDuration});

  MaintenanceMode.fromJson(Map<String, dynamic> json) {
    maintenanceStatus = json['maintenance_status'];
    selectedMaintenanceSystem = json['selected_maintenance_system'] != null
        ? SelectedMaintenanceSystem.fromJson(
        json['selected_maintenance_system'])
        : null;
    maintenanceMessages = json['maintenance_messages'] != null
        ? MaintenanceMessages.fromJson(json['maintenance_messages'])
        : null;
    maintenanceTypeAndDuration = json['maintenance_type_and_duration'] != null
        ? MaintenanceTypeAndDuration.fromJson(
        json['maintenance_type_and_duration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maintenance_status'] = maintenanceStatus;
    if (selectedMaintenanceSystem != null) {
      data['selected_maintenance_system'] =
          selectedMaintenanceSystem!.toJson();
    }
    if (maintenanceMessages != null) {
      data['maintenance_messages'] = maintenanceMessages!.toJson();
    }
    if (maintenanceTypeAndDuration != null) {
      data['maintenance_type_and_duration'] =
          maintenanceTypeAndDuration!.toJson();
    }
    return data;
  }
}

class SelectedMaintenanceSystem {
  int? branchPanel;
  int? customerApp;
  int? webApp;
  int? deliverymanApp;
  int? tableApp;
  int? kitchenApp;

  SelectedMaintenanceSystem(
      {this.branchPanel, this.customerApp, this.webApp, this.deliverymanApp, this.tableApp, this.kitchenApp});

  SelectedMaintenanceSystem.fromJson(Map<String, dynamic> json) {
    branchPanel = json['branch_panel'];
    customerApp = json['customer_app'];
    webApp = json['web_app'];
    deliverymanApp = json['deliveryman_app'];
    tableApp = json['table_app'];
    kitchenApp = json['kitchen_app'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['branch_panel'] = branchPanel;
    data['customer_app'] = customerApp;
    data['web_app'] = webApp;
    data['deliveryman_app'] = deliverymanApp;
    data['table_app'] = tableApp;
    data['kitchen_app'] = kitchenApp;
    return data;
  }
}

class MaintenanceMessages {
  int? businessNumber;
  int? businessEmail;
  String? maintenanceMessage;
  String? messageBody;

  MaintenanceMessages(
      {this.businessNumber,
        this.businessEmail,
        this.maintenanceMessage,
        this.messageBody});

  MaintenanceMessages.fromJson(Map<String, dynamic> json) {
    businessNumber = json['business_number'];
    businessEmail = json['business_email'];
    maintenanceMessage = json['maintenance_message'];
    messageBody = json['message_body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['business_number'] = businessNumber;
    data['business_email'] = businessEmail;
    data['maintenance_message'] = maintenanceMessage;
    data['message_body'] = messageBody;
    return data;
  }
}

class MaintenanceTypeAndDuration {
  String? _maintenanceDuration;
  String? _startDate;
  String? _endDate;

  MaintenanceTypeAndDuration(
      {String? maintenanceDuration, String? startDate, String? endDate}) {
    if (maintenanceDuration != null) {
      _maintenanceDuration = maintenanceDuration;
    }
    if (startDate != null) {
      _startDate = startDate;
    }
    if (endDate != null) {
      _endDate = endDate;
    }
  }

  String? get maintenanceDuration => _maintenanceDuration;
  set maintenanceDuration(String? maintenanceDuration) => _maintenanceDuration = maintenanceDuration;
  String? get startDate => _startDate;
  set startDate(String? startDate) => _startDate = startDate;
  String? get endDate => _endDate;
  set endDate(String? endDate) => _endDate = endDate;

  MaintenanceTypeAndDuration.fromJson(Map<String, dynamic> json) {
    _maintenanceDuration = json['maintenance_duration'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maintenance_duration'] = _maintenanceDuration;
    data['start_date'] = _startDate;
    data['end_date'] = _endDate;
    return data;
  }
}