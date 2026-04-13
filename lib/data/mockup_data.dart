Map<String, dynamic> stations = {
  "001": {
    "name": "Station 1",
    "availableBike": 5,
    "totalSlots": 10,
    "latitude": 11.5564,
    "longitude": 104.9282,
  },
  "002": {
    "name": "Station 2",
    "availableBike": 3,
    "totalSlots": 8,
    "latitude": 11.5764,
    "longitude": 104.9182,
  },
  "003": {
    "name": "Station 3",
    "availableBike": 7,
    "totalSlots": 12,
    "latitude": 11.5464,
    "longitude": 104.9482,
  },
  "004": {
    "name": "Station 4",
    "availableBike": 2,
    "totalSlots": 8,
    "latitude": 11.5364,
    "longitude": 104.9082,
  },
  "005": {
    "name": "Station 5",
    "availableBike": 4,
    "totalSlots": 10,
    "latitude": 11.5264,
    "longitude": 104.9382,
  },
};
Map<String, dynamic> slots = {
  "1": {"isOccupied": true, "bikeId": "001"},
  "2": {"isOccupied": true, "bikeId": "002"},
  "3": {"isOccupied": true, "bikeId": "003"},
  "4": {"isOccupied": true, "bikeId": "004"},
  "5": {"isOccupied": true, "bikeId": "005"},
  "6": {"isOccupied": false},
  "7": {"isOccupied": false},
  "8": {"isOccupied": false},
  "9": {"isOccupied": false},
  "10": {"isOccupied": false},
};

Map<String, dynamic> bikes = {
  "001": {"isAvailable": true},
  "002": {"isAvailable": true},
  "003": {"isAvailable": true},
  "004": {"isAvailable": true},
  "005": {"isAvailable": true},
  "006": {"isAvailable": true},
  "007": {"isAvailable": true},
  "008": {"isAvailable": true},
};

Map<String, dynamic> passes = {
  "001": {
    "pass_type": "day",
    "price": 10.0,
    "description": "kim heng is gay as well",
  },
  "002": {
    "pass_type": "monthly",
    "price": 10.0,
    "description": "monich is gay",
  },
  "003": {
    "pass_type": "annumual",
    "price": 10.0,
    "description": "monich is gay",
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
