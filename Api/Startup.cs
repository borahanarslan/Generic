using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Business.ManagerApp;
using DataAccess.DataAccess;
using DataAccess.EntityFreamwork;
using Entities.Domain;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //services.AddDbContext<DatabaseContext>(options =>
            //   {
            //       options.UseSqlServer(Configuration["ConnectionStrings:SqlConStr"].ToString(), o =>
            //       {
            //           o.MigrationsAssembly("DataAccess");
            //       });
            //   });
            services.AddTransient<UserManagerApp>();
            services.AddDbContext<DatabaseContext>(options =>
               options.UseSqlServer(Configuration.GetConnectionString("ConnectionStrings")));

           services.AddIdentity<ApplicationUser, IdentityRole>()
               .AddEntityFrameworkStores<DatabaseContext>()
               .AddDefaultTokenProviders();
            services.AddControllers();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
