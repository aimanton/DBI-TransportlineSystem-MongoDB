id = 0;

function submitForm() {
  var formData = {
      employeeId: id,
      firstname: document.getElementById('firstname').value,
      lastname: document.getElementById('lastname').value,
      salary: document.getElementById('salary').value,
      job: document.getElementById('job').value,
      transportline: {
          id: 0,
          transportlineName: document.getElementById('transportlineName').value,
          stations: [
              {
                  id: 0,
                  stationName: "U1",
                  district: "1.Bezirk"
              }
          ]
      }
  };
  
  id++;

  fetch('http://localhost:5297/api/Employee', {
      method: 'POST',
      headers: {
          'Content-Type': 'application/json'
      },
      body: JSON.stringify(formData)
  })
  .then(response => response.json())
  .then(data => {
      console.log('Success:', data);
  })
  .catch(error => {
      console.error('Error:', error);
  });

  document.getElementById('firstname').removeAttribute("value");
document.getElementById('lastname').removeAttribute("value");
document.getElementById('salary').removeAttribute("value");
document.getElementById('job').removeAttribute("value");
document.getElementById('transportlineName').removeAttribute("value");

document.getElementById('add-to-employees-form').reset();

  for(var i=0; i<10; i++){
    read();
  }
}