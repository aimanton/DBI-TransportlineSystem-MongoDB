/*
 Create 10
*/
function createTenEmployees() {
  for (let i = 1; i <= 10; i++) {
    let employee = {
      "e_id": i,
      "e_firstname": "John",
      "e_lastname": "Doe",
      "e_salary": 50000,
      "j_name": "Traindriver",
      "transportline": {
        "tl_id": i,
        "tl_name": `U${i}`,
        "stations": [
          {
            "st_id": i,
            "st_name": `oida_${i}`,
            "district": "Simmering"
          }
        ]
      }
    };

    db.TransportlineSystem.insertOne(employee);
  }
}

createTenEmployees();

/*
 Create 100
*/
function createTenEmployees() {
  for (let i = 1; i <= 100; i++) {
    let employee = {
      "e_id": i,
      "e_firstname": "John",
      "e_lastname": "Doe",
      "e_salary": 50000,
      "j_name": "Traindriver",
      "transportline": {
        "tl_id": i,
        "tl_name": `U${i}`,
        "stations": [
          {
            "st_id": i,
            "st_name": `oida_${i}`,
            "district": "Simmering"
          }
        ]
      }
    };

    db.TransportlineSystem.insertOne(employee);
  }
}

createHundredEmployees();


/*
 Create 1000
*/
function createThousandEmployees() {
  for (let i = 1; i <= 1000; i++) {
    let employee = {
      "e_id": i,
      "e_firstname": "John",
      "e_lastname": "Doe",
      "e_salary": 50000,
      "j_name": "Traindriver",
      "transportline": {
        "tl_id": i,
        "tl_name": `U${i}`,
        "stations": [
          {
            "st_id": i,
            "st_name": `oida_${i}`,
            "district": "Simmering"
          }
        ]
      }
    };

    db.TransportlineSystem.insertOne(employee);
  }
}
createThousandEmployees();


/*
 Find 10
*/

function findFirstTenEmployees() {
  const firstTenEmployees = db.TransportlineSystem.find().limit(10);
  return firstTenEmployees.toArray();
}

const firstTenEmployees = findFirstTenEmployees();
printjson(firstTenEmployees);



/*
 Find 100
*/

function findFirstHundretEmployees() {
  const firstTenEmployees = db.TransportlineSystem.find().limit(100);
  return firstTenEmployees.toArray();
}

const firstHundretEmployees = findFirstHundretEmployees();
printjson(firstHundretEmployees);




/*
 Find 1000
*/

function findFirstThousandEmployees() {
  const firstTenEmployees = db.TransportlineSystem.find().limit(1000);
  return firstTenEmployees.toArray();
}

const firstThousandEmployees = findFirstThousandEmployees();
printjson(firstThousandEmployees);




/*
 Update 10
*/
function updateTenEmployees() {
  let employees = db.TransportlineSystem.find().limit(10);

  employees.forEach(employee => {
    // Update the fields of the employee
    db.TransportlineSystem.updateOne(
      { "e_id": employee.e_id },
      {
        $set: {
          "e_firstname": "UpdatedFirstName",
          "e_lastname": "UpdatedLastName",
          "e_salary": 60000,
          "j_name": "UpdatedJob",
          "transportline.tl_name": "UpdatedLine",
          "transportline.stations.$[].st_name": "UpdatedStation"
        }
      }
    );
  });
}

updateTenEmployees();


/*
 Update 100
*/
function updateHundredEmployees() {
  let employees = db.TransportlineSystem.find().limit(100);

  employees.forEach(employee => {

    db.TransportlineSystem.updateOne(
      { "e_id": employee.e_id },
      {
        $set: {
          "e_firstname": "UpdatedFirstName",
          "e_lastname": "UpdatedLastName",
          "e_salary": 60000,
          "j_name": "UpdatedJob",
          "transportline.tl_name": "UpdatedLine",
          "transportline.stations.$[].st_name": "UpdatedStation"
        }
      }
    );
  });
}

updateHundredEmployees();

/*
 Update 1000
*/
function updateThousandEmployees() {
  let employees = db.TransportlineSystem.find().limit(1000);

  employees.forEach(employee => {
    // Update the fields of the employee
    db.TransportlineSystem.updateOne(
      { "e_id": employee.e_id },
      {
        $set: {
          "e_firstname": "UpdatedFirstName",
          "e_lastname": "UpdatedLastName",
          "e_salary": 60000,
          "j_name": "UpdatedJob",
          "transportline.tl_name": "UpdatedLine",
          "transportline.stations.$[].st_name": "UpdatedStation"
        }
      }
    );
  });
}

updateThousandEmployees();

/*
 Delete 10
*/

function deleteFirstTenEmployees() {
  let employeesToDelete = db.TransportlineSystem.find().limit(10);
  employeesToDelete.forEach(function(employee) {
    db.TransportlineSystem.deleteOne({ "e_id": employee.e_id });
  });
}

deleteFirstTenEmployees();

/*
 Delete 100
*/

function deleteFirstHundretEmployees() {
  let employeesToDelete = db.TransportlineSystem.find().limit(100);
  employeesToDelete.forEach(function(employee) {
    db.TransportlineSystem.deleteOne({ "e_id": employee.e_id });
  });
}

deleteFirstHundretEmployees();

/*
 Delete 1000
*/
function deleteFirstThousandEmployees() {
  let employeesToDelete = db.TransportlineSystem.find().limit(1000);
  employeesToDelete.forEach(function(employee) {
    db.TransportlineSystem.deleteOne({ "e_id": employee.e_id });
  });
}

deleteFirstThousandEmployees();