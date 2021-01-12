namespace daw_webapi.Contracts
{
    public static partial class ApiRoutes
    {
        public static class EventParentRoutes
        {
            public const string GetAll = Base + "events";
            public const string Get = Base + "events/{eventId}";
            public const string Select = Base + "eventselect";
            public const string Create = Base + "events";
            public const string Update = Base + "events";
            public const string Delete = Base + "events/{eventParentId}";
        }
    }
}
