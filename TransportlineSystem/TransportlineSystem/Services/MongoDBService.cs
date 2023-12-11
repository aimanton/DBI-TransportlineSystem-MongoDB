using TransportlineSystem.Models;
using Microsoft.Extensions.Options;
using MongoDB.Driver;
using MongoDB.Bson;

namespace TransportlineSystem.Services
{
    public class MongoDBService

    {
        private readonly IMongoCollection<Employee> _employeeCollection;

        public MongoDBService(IOptions<MongoDBSettings> mongoDBSettings)
        {
            MongoClient client = new MongoClient(mongoDBSettings.Value.ConnectionString);
            IMongoDatabase database = client.GetDatabase(mongoDBSettings.Value.DatabaseName);
            _employeeCollection = database.GetCollection<Employee>(mongoDBSettings.Value.CollectionName);
        }
    }
}
