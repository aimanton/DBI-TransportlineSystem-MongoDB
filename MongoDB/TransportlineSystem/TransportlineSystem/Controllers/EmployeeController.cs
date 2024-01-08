using System;
using Microsoft.AspNetCore.Mvc;
using TransportlineSystem.Services;
using TransportlineSystem.Models;


namespace TransportlineSystem.Controllers
{
    [Controller]
    [Route("api/[controller]")]
    public class EmployeeController : Controller
    {
        private readonly EmployeeService _employeeService;

        public EmployeeController(EmployeeService employeeService)
        {
            _employeeService = employeeService;
        }

        [HttpGet]
        public async Task<List<Employee>> GetAll()
        {
            return await _employeeService.GetAllAsync();
        }

        [HttpPost]
        public async Task<IActionResult> CreateEmp([FromBody] Employee employee)
        {
            await _employeeService.CreateEmp(employee);
            return CreatedAtAction(nameof(GetAll), new { id = employee.Id }, employee);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateEmp(string id, [FromBody] Employee updateEmployee)
        {
            await _employeeService.UpdateEmp(id, updateEmployee);
            return NoContent();

        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(string id)
        {

            await _employeeService.DeleteAsync(id);
            return NoContent();
        }

    }
}
