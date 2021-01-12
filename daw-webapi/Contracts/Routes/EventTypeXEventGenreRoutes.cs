namespace daw_webapi.Contracts
{
    public static partial class ApiRoutes
    {
        public static class EventTypeXEventGenreRoutes
        {
            public const string GetAll = Base + "typexgenres";
            public const string Get = Base + "typexgenres/{typeXGenreId}";
            public const string Select = Base + "typexgenreselect/{typeId}";
            public const string Create = Base + "typexgenres";
            public const string Update = Base + "typexgenres";
            public const string Delete = Base + "typexgenres/{typeXGenreId}";
        }
    }
}
