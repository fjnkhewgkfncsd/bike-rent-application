Map<String, dynamic> stations = {
  "001": {
    "name": "monich is gay as fuck",
    "availableBike": 5,
    "totalSlots": 10,
  },
  "002": {
    "name": "monich is gay as fuck",
    "availableBike": 5,
    "totalSlots": 10,
  },
  "003": {
    "name": "monich is gay as fuck",
    "availableBike": 5,
    "totalSlots": 10,
  },
  "004": {
    "name": "monich is gay as fuck",
    "availableBike": 5,
    "totalSlots": 10,
  },
  "005": {
    "name": "monich is gay as fuck",
    "availableBike": 5,
    "totalSlots": 10,
  },
};

Map<String, dynamic> slots = {
  "1": {"isOccupied": true, "bikeId": "001"},
  "2": {"isOccupied": true, "bikeId": "001"},
  "3": {"isOccupied": true, "bikeId": "001"},
  "4": {"isOccupied": true, "bikeId": "001"},
  "5": {"isOccupied": true, "bikeId": "001"},
  "6": {"isOccupied": false},
  "7": {"isOccupied": false},
  "8": {"isOccupied": false},
  "9": {"isOccupied": false},
  "10": {"isOccupied": false},
};

Map<String, dynamic> bikes = {
  "001": {
    "bikeNumber": "Bike Number #001",
    "status": "available",
  },
  "002": {
    "bikeNumber": "Bike Number #001",
    "status": "available",
  },
  "003": {
    "bikeNumber": "Bike Number #001",
    "status": "available",
  },
  "004": {
    "bikeNumber": "Bike Number #001",
    "status": "available",
  },
  "005": {
    "bikeNumber": "Bike Number #001",
    "status": "available",
  },
  "006": {
    "bikeNumber": "Bike Number #001",
    "status": "available",
  },
  "007": {
    "bikeNumber": "Bike Number #001",
    "status": "available",
  },
  "008": {
    "bikeNumber": "Bike Number #001",
    "status": "available",
  },
};

Map<String, dynamic> passes = {
  "001": {
    "pass_type": "day",
    "price": 1.0,
    "description": "Valid for 24 hours from first use",
  },
  "002": {
    "pass_type": "monthly",
    "price": 15.0,
    "description": "Valid for 30 days with unlimited rides",
  },
  "003": {
    "pass_type": "annual",
    "price": 150.0,
    "description": "Valid for 365 days with unlimited rides",
  }
};

Map<String, dynamic> users = 
  {
    "001": {
      "email": "user@example.com",
      "username": "kimheng",
      "pass_status": "active",
      "pass_type": "monthly",
      "pass_expiry_date": DateTime.now().add(Duration(days: 30)),
    }
  };
