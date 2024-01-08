$(document).ready(function () {
    updateEmployee();
    updateEmployeeFinal();
});

function updateEmployee() {
    $(document).on('click', '.btn-update', function () {

        var e_id = $(this).attr('data-id');

        document.getElementById('firstname').setAttribute("value", document.getElementById('f' + e_id).innerText);
        document.getElementById('lastname').setAttribute("value", document.getElementById('l' + e_id).innerText);
        document.getElementById('salary').setAttribute("value", document.getElementById('s' + e_id).innerText);
        document.getElementById('job').setAttribute("value", document.getElementById('j' + e_id).innerText);
        document.getElementById('transportlineName').setAttribute("value", document.getElementById('tn' + e_id).innerText);
        document.getElementById('btn-update').setAttribute("data-id", e_id);

        document.getElementById('btn-add').style.display = 'none';
        document.getElementById('btn-update').style.display = 'unset';

    });
}

function updateEmployeeFinal() {
    $(document).on('click', '.btn-update-final', function () {
        var e_id = $(this).attr('data-id');

        var formData = {
            employeeId: e_id,
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
        
        let url = "http://localhost:5297/api/Employee/" + e_id;
        
        $.ajax({
            url: url,
            type: 'PUT', 
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function () {
                console.log("Update successful");
            },
            error: function (xhr, textStatus, errorThrown) {
                console.error("Error updating entry:", errorThrown);
            }
        });

        document.getElementById('console').innerHTML += "<div class='purple'>{Updated}</div>";
        updateScroll();

        document.getElementById('firstname').removeAttribute("value");
        document.getElementById('lastname').removeAttribute("value");
        document.getElementById('salary').removeAttribute("value");
        document.getElementById('job').removeAttribute("value");
        document.getElementById('transportlineName').removeAttribute("value");

        document.getElementById('add-to-employees-form').reset();

        document.getElementById('btn-add').style.display = 'unset';
        document.getElementById('btn-update').style.display = 'none';

        for (var i = 0; i < 5; i++) {
            read();
        }

    });
}