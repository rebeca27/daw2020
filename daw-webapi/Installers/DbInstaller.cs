using daw_webapi.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace daw_webapi.Installers
{
    public class DbInstaller : IInstaller
    {
        public void InstallServices(IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<DataContext>(options =>
                options.UseSqlServer(
                    configuration.GetConnectionString("DefaultConnection")));
            services.AddIdentity<IdentityUser<long>, IdentityRole<long>>()
                .AddEntityFrameworkStores<DataContext>()
                .AddDefaultTokenProviders();

            //services.AddScoped<IPostService, PostService>();
        }
    }
}
