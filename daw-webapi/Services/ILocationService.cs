using daw_webapi.Contracts.Responses;
using daw_webapi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Services
{
    public interface ILocationService
    {
        Task<Location> GetLocationById(long id);
        Task<IReadOnlyList<SelectItemResponse>> GetLocationSelect();
        Task<IList<Location>> GetLocations();
        Task CreateLocation(Location location);
        Task UpdateLocation(Location location);
        Task DeleteLocation(Location location);
    }
}
