using API_Layer.Repositories;
using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Data;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

//builder.Services.AddControllers();

builder.Services.AddControllers()
   .AddNewtonsoftJson(x => x.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore);

builder.Services.AddEndpointsApiExplorer();

builder.Services.AddSwaggerGen();

//builder.Services.AddDbContextPool<AppDbContext>(options =>
builder.Services.AddDbContext<AppDbContext>(options =>
{
    options.UseSqlServer(builder.Configuration.GetConnectionString("app-connection"));
});
builder.Services.AddScoped<IProductRepository , ProductRepository>();
builder.Services.AddScoped<ICategoryRepository , CategoryRepository>();
builder.Services.AddScoped<ISubcategoryRepository , SubcategoryRepository>();
builder.Services.AddScoped<IInstructionRepository , InstructionRepository>();
builder.Services.AddScoped<IFavouriteRepository , FavouriteRepository>();
builder.Services.AddScoped<ICityRepository , CityRepository>();
builder.Services.AddScoped<IAreaRepository , AreaRepository>();
builder.Services.AddScoped<IProductsDetailsRepository , ProductsDetailsRepository>();
builder.Services.AddScoped<ICategoryInstructionRepository , CategoryInstructionRepository>();
builder.Services.AddScoped<IStatusRepository , StatusRepository>();
builder.Services.AddScoped<IUserRepository , UserRepository>();

builder.Services.AddCors(options =>
{
    options.AddDefaultPolicy(
    builder =>
    {
        builder.AllowAnyOrigin();
        builder.AllowAnyMethod();
        builder.AllowAnyHeader();
    });
});

builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
{
    options.RequireHttpsMetadata = false;
    options.SaveToken = true;
    options.TokenValidationParameters = new TokenValidationParameters()
    {
        ValidateIssuer = true ,
        ValidateAudience = true ,
        ValidAudience = builder.Configuration["Jwt:Audience"] ,
        ValidIssuer = builder.Configuration["Jwt:Issuer"] ,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]))
    };
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseStaticFiles();

app.UseCors();

app.UseAuthentication();

app.UseAuthorization();

app.MapControllers();

app.Run();

