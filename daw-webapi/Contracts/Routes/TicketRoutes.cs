namespace daw_webapi.Contracts
{
    public static partial class ApiRoutes
    {
        public static class TicketRoutes
        {
            public const string GetTicketsByEventId = Base + "tickets/event/{eventId}";
            public const string GetAll = Base + "tickets";
            public const string Get = Base + "tickets/{ticketId}";
            public const string Create = Base + "tickets";
            public const string Update = Base + "tickets";
            public const string Delete = Base + "tickets/{ticketId}";
        }
    }
}
