namespace daw_webapi.Contracts
{
    public static partial class ApiRoutes
    {
        public static class TicketTypeRoutes
        {
            public const string GetAll = Base + "tickettypes";
            public const string Get = Base + "tickettypes/{ticketTypeId}";
            public const string Select = Base + "tickettypeselect";
            public const string Create = Base + "tickettypes";
            public const string Update = Base + "tickettypes";
            public const string Delete = Base + "tickettypes/{ticketTypeId}";
        }
    }
}
