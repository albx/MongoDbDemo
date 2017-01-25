using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MongoDbDemo
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                var repo = new MongoRepository();
                var model = new Dummy
                {
                    Id = 1,
                    Value = "Test",
                    Date = DateTime.Now
                };

                repo.Save(model);
                var models = repo.All<Dummy>();

                foreach (var m in models)
                {
                    Console.WriteLine(m.ToString());
                }
                
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            Console.ReadLine();
        }
    }
}
