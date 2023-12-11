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
        private readonly MongoDBService _mongoDBService;

        public EmployeeController(MongoDBService mongoDBService) 
        { 
           _mongoDBService = mongoDBService;    
        
        }

        [HttpGet]
        public async Task<List<Employee>> GetAll() { }

        [HttpPost]

        public async Task<IActionResult> Post([FromBody] Employee employee) { }
    }
}
