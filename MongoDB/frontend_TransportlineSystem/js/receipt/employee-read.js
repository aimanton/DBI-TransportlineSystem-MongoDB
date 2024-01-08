$(document).ready(function () {
  read();
});

function read(){

  let url = 'http://localhost:5297/api/Employee';

  $.getJSON(url, (data) => {
    console.log(data)
    row = '';
    data.forEach((element) => {

      row += `<tr id=` + element.employeeId + `>
            <td id=f` + element.employeeId + `>` + element.firstname  + `</td>
            <td id=l` + element.employeeId + `>` + element.lastname +  `</td>
            <td id=s` + element.employeeId + `>` + element.salary + `</td>
            <td id=j` + element.employeeId + `>` + element.job + `</td>
            <td id=tn` + element.employeeId + `>` + element.transportline.transportlineName + `</td>
            <td>
              <button
                class='btn btn-warning btn-update'
                data-id='` + element.employeeId + `'
              >
              Update
              </button>
              <button
                class='btn btn-danger btn-delete'
                data-id='` + element.employeeId + `'
              >
              Delete
              </button>
            </td>
          </tr>`;
    });
    
    $('#tbody-file').empty().append(row);
  });

  
}
