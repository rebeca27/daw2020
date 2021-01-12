using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Contracts.Requests
{
    public class UserSetRoleRequest
    {
        public long UserId { get; set; }
        public long RoleId { get; set; }
    }
}
