namespace daw_webapi.Contracts
{
    public static partial class ApiRoutes
    {
        public static class IdentityRoutes
        {
            public const string Login = Base + "identity/login";

            public const string Register = Base + "identity/register";

            public const string Refresh = Base + "identity/refresh";

            public const string AddRoles = Base + "identity/addroles";

            public const string GetPersons = Base + "identity/persons";

            public const string Delete = Base + "identity/deleteperson/{personId}";
        }
    }
}
