using TransportlineSystem.Models;
using Microsoft.Extensions.Options;
using MongoDB.Driver;
using MongoDB.Bson;

namespace TransportlineSystem.Services
{
    public class EmployeeService

    {
        private readonly IMongoCollection<Employee> _employeeCollection;

        public EmployeeService(IOptions<MongoDBSettings> mongoDBSettings)
        {
            MongoClient client = new MongoClient(mongoDBSettings.Value.ConnectionString);
            IMongoDatabase database = client.GetDatabase(mongoDBSettings.Value.DatabaseName);
            _employeeCollection = database.GetCollection<Employee>(mongoDBSettings.Value.CollectionName);
        }

        public async Task<List<Employee>> GetAllAsync()
        {
            var employees = await _employeeCollection.Find(new BsonDocument()).ToListAsync();
            return employees;
        }

        public async Task CreateEmp(Employee employee)
        {
            await _employeeCollection.InsertOneAsync(employee);
            return;
        }

        public async Task UpdateEmp(string id, Employee updateEmployee)
        {
            FilterDefinition<Employee> filter = Builders<Employee>.Filter.Eq("EmployeeId", id);
            UpdateDefinition<Employee> update = Builders<Employee>.Update
                .Set("e_firstname", updateEmployee.Firstname)
                .Set("e_lastname", updateEmployee.Lastname)
                .Set("j_name", updateEmployee.Job)
                .Set("e_salary", updateEmployee.Salary)
                .Set("transportline.tl_name", updateEmployee.Transportline.TransportlineName);
            await _employeeCollection.UpdateManyAsync(filter, update);
            return;
        }

        public async Task DeleteAsync(string id)
        {
            FilterDefinition<Employee> filter = Builders<Employee>.Filter.Eq("EmployeeId", id);
            await _employeeCollection.DeleteOneAsync(filter);
            return;

        }



    }

} 