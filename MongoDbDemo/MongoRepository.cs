using MongoDB.Driver;
using System.Configuration;
using System.Linq;

namespace MongoDbDemo
{
    public class MongoRepository
    {
        private MongoClient client;

        private string dbName;

        public MongoRepository()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["MongoConnection"].ConnectionString;

            client = new MongoClient(connectionString);
            dbName = "Test";
        }

        public IQueryable<T> All<T>() where T : class
        {
            var database = client.GetDatabase(dbName);
            return database.GetCollection<T>(nameof(T)).AsQueryable();
        }

        public void Save<T>(T model) where T : class
        {
            var database = client.GetDatabase(dbName);
            var collection = database.GetCollection<T>(nameof(T));

            collection.InsertOne(model);
        }
    }
}
