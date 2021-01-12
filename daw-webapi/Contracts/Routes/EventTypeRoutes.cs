namespace daw_webapi.Contracts
{
    public static partial class ApiRoutes
    {
        public static class EventTypeRoutes
        {
            public const string GetAll = Base + "types";
            public const string Get = Base + "types/{typeId}";
            public const string Select = Base + "typeselect";
            public const string Create = Base + "types";
            public const string Update = Base + "types";
            public const string Delete = Base + "types/{typeId}";
        }
    }
}
