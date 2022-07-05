using API_Layer.Repositories;
using API_Layer.Repositories.Interfaces;
using DatabaseLayer.Data;
using DatabaseLayer.Models;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

string Cors = "";

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
builder.Services.AddScoped<ICategoryInstructionRepository , CategoryInstructionRepository>();
builder.Services.AddScoped<IStatusRepository , StatusRepository>();


builder.Services.AddCors(options =>
{
    options.AddPolicy(Cors ,
    builder =>
    {
        builder.AllowAnyOrigin();
        builder.AllowAnyMethod();
        builder.AllowAnyHeader();
    });
});
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();
app.UseCors(Cors);
app.MapControllers();
app.UseStaticFiles();
app.Run();
