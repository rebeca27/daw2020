namespace daw_webapi.Contracts
{
    public static partial class ApiRoutes
    {
        public static class PersonXTicketRoutes
        {
            public const string GetAll = Base + "personxtickets";
            public const string Get = Base + "personxtickets/{personXTicketId}";
            public const string GetByCurrentPerson = Base + "personxtickets/currentperson";
            public const string Create = Base + "personxtickets";
            public const string Update = Base + "personxtickets";
            public const string Delete = Base + "personxtickets/{personXTicketId}";
        }
    }
}
