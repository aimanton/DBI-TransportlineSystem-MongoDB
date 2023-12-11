using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;

namespace TransportlineSystem.Models
{

    public class Employee
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; }
        [BsonElement("e_id")]
        public int EmployeeId { get; set; }

        [BsonElement("e_firstname")]
        public string Firstname { get; set; } 
        [BsonElement("e_lastname")]
        public string Lastname { get; set; } 
        [BsonElement("e_salary")]
        public double Salary { get; set; } 
        [BsonElement("j_name")]
        public string Job {  get; set; } 
        [BsonElement("j_start_Date")]
        public DateTime StartDate { get; set; }
        [BsonElement("j_end_Date")]
        public DateTime EndDate { get; set; }
        [BsonElement("transportline")]
        public Transportlines Transportline { get; set; }

        /* 
        public Employee Clone() {
         var clone = this.MemberwiseClone();
            return (Employee)clone;
        }
        */
    }
    public class Transportlines
    {
        [BsonElement("tl_id")]
        public int Id { get; set; }
        [BsonElement("tl_name")]
        public string TransportlineName { get; set; }
        [BsonElement("stations")]
        public IEnumerable<Station> Stations { get; set; }
    }
    public class Station
    {
        [BsonElement("st_id")]
        public int Id { get; set; }
        [BsonElement("st_name")]
        public string StationName { get; set; }
        [BsonElement("district")]
        public string District { get; set; }

    }
}
