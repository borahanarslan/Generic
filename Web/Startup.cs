using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;
using Business.ManagerApp;
using DataAccess.EntityFreamwork;
using DbLocalizationProvider.AdminUI.AspNetCore;
using DbLocalizationProvider.AdminUI.AspNetCore.Routing;
using DbLocalizationProvider.AspNetCore;
using DbLocalizationProvider.AspNetCore.ClientsideProvider.Routing;
using DbLocalizationProvider.Storage.SqlServer;
using Entities.Domain;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Localization;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;

namespace Web
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
            //services.AddTransient<UserManagerApp>();
            services.AddDbContext<DatabaseContext>(options =>
                options.UseSqlServer(Configuration.GetConnectionString("ConnectionStrings")));

            services.AddIdentity<ApplicationUser, IdentityRole>()
                .AddEntityFrameworkStores<DatabaseContext>()
                .AddDefaultTokenProviders();
            services
                .AddControllersWithViews()
                .AddMvcLocalization();

            services.AddRazorPages();
            services.AddRouting();

            var supportedCultures = new List<CultureInfo> { new CultureInfo("sv"), new CultureInfo("no"), new CultureInfo("en") };

            services.Configure<RequestLocalizationOptions>(opts =>
            {
                opts.DefaultRequestCulture = new RequestCulture("en");
                opts.SupportedCultures = supportedCultures;
                opts.SupportedUICultures = supportedCultures;
            });

            services.AddDbLocalizationProvider(_ =>
            {
                _.EnableInvariantCultureFallback = true;
                _.ScanAllAssemblies = true;
                _.FallbackCultures.Try(supportedCultures);
                _.UseSqlServer(Configuration["ConnectionStrings:SqlConStr"]);
            });

            services.AddDbLocalizationProviderAdminUI(_ =>
            {
                _.RootUrl = "/localization-admin";
                _.ShowInvariantCulture = true;
                _.ShowHiddenResources = false;
                _.DefaultView = ResourceListView.Tree;
            });
            services.AddControllersWithViews();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            var options = app.ApplicationServices.GetService<IOptions<RequestLocalizationOptions>>();
            app.UseRequestLocalization(options.Value);

            app.UseRouting();
            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseDbLocalizationProvider();
            app.UseDbLocalizationProviderAdminUI();
            app.UseDbLocalizationClientsideProvider();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute("default", "{controller=Home}/{action=Index}/{id?}");
                endpoints.MapRazorPages();

                endpoints.MapDbLocalizationAdminUI();
                endpoints.MapDbLocalizationClientsideProvider();
            });
        }
    }
}
