using daw_webapi.Contracts.Responses;
using daw_webapi.Data;
using daw_webapi.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Services
{
    public class LocationService : ILocationService
    {
        readonly DataContext _dataContext;
        public LocationService(DataContext dataContext)
        {
            _dataContext = dataContext;
        }
        public async Task CreateLocation(Location location)
        {
            location.Deleted = false;
            await _dataContext.AddAsync(location);
            await _dataContext.SaveChangesAsync();
        }

        public async Task DeleteLocation(Location location)
        {
            location.Deleted = true;
            _dataContext.Update(location);
            await _dataContext.SaveChangesAsync();
        }

        public async Task<IList<Location>> GetLocations()
        {
            return await _dataContext.Locations.Where(x => !x.Deleted).ToListAsync();
        }

        public async Task<Location> GetLocationById(long id)
        {
            return await _dataContext.Locations
                .Where(x => x.Id == id && !x.Deleted).SingleOrDefaultAsync();
        }

        public async Task UpdateLocation(Location location)
        {
            _dataContext.Update(location);
            await _dataContext.SaveChangesAsync();
        }

        public async Task<IReadOnlyList<SelectItemResponse>> GetLocationSelect()
        {
            return await _dataContext.Locations.Where(x => !x.Deleted).Select(x => new SelectItemResponse { Label = x.Name, Value = x.Id }).ToListAsync();
        }
    }
}
