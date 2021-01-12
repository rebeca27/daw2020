namespace daw_webapi.Contracts
{
    public static partial class ApiRoutes
    {
        public static class LocationRoutes
        {
            public const string GetAll = Base + "locations";
            public const string Get = Base + "locations/{locationId}";
            public const string Select = Base + "locationselect";
            public const string Create = Base + "locations";
            public const string Update = Base + "locations";
            public const string Delete = Base + "locations/{locationId}";
        }
    }
}
