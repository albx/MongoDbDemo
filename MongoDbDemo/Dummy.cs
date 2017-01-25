using System;

namespace MongoDbDemo
{
    public class Dummy
    {
        public int Id { get; set; }

        public string Value { get; set; }

        public DateTime Date { get; set; }

        public override string ToString()
        {
            return $"[{Id}] {Value} {Date.ToString()}";
        }
    }
}
