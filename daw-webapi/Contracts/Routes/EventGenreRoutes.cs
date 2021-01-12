namespace daw_webapi.Contracts
{
    public static partial class ApiRoutes
    {
        public static class EventGenreRoutes
        {
            public const string GetAll = Base + "genres";
            public const string Get = Base + "genres/{genreId}";
            public const string Select = Base + "genreselect";
            public const string Create = Base + "genres";
            public const string Update = Base + "genres";
            public const string Delete = Base + "genres/{genreId}";
        }
    }
}
