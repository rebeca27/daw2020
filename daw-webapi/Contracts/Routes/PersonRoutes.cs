using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Contracts
{
    public static partial class ApiRoutes
    {
        public static class PersonRoutes
        {
            public const string GetPersons = Base + "persons";

            public const string Get = Base + "personbyuserid";

            public const string Delete = Base + "persons/delete/{personId}";
        }
    }
}
