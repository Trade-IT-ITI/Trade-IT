using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DatabaseLayer.Migrations
{
    public partial class addmoreseeddata : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Categories",
                columns: new[] { "CategoryId", "Name" },
                values: new object[] { 2, "Furniture" });

            migrationBuilder.InsertData(
                table: "Categories",
                columns: new[] { "CategoryId", "Name" },
                values: new object[] { 3, "Clothes" });

            migrationBuilder.InsertData(
                table: "Subcategories",
                columns: new[] { "SubcategoryId", "CategoryId", "Name" },
                values: new object[,]
                {
                    { 3, 2, "Chairs" },
                    { 4, 3, "Children" },
                    { 5, 3, "Men" },
                    { 6, 3, "Women" },
                    { 7, 3, "Boys" },
                    { 8, 3, "Girls" }
                });

            migrationBuilder.InsertData(
                table: "Products",
                columns: new[] { "ProductId", "AreaId", "CityId", "Descrioption", "PostDateTime", "Price", "RequestCount", "StatusId", "SubcategoryId", "Title", "UserId", "ViewsCount" },
                values: new object[,]
                {
                    { 3, 3, 3, "new gaming chair 2022 model", new DateTime(2022, 5, 12, 0, 0, 0, 0, DateTimeKind.Unspecified), 6500.0, 5, 1, 3, "Gaming Chair ITop 220", 2, 60 },
                    { 4, 4, 3, "children shirt small and medium sizes", new DateTime(2022, 6, 28, 0, 0, 0, 0, DateTimeKind.Unspecified), 50.0, 3, 1, 4, "children shirt", 2, 110 },
                    { 5, 5, 1, "boys t-shirt medium and large sizes", new DateTime(2022, 1, 13, 0, 0, 0, 0, DateTimeKind.Unspecified), 100.0, 1, 2, 7, "boys t-shirt", 1, 90 },
                    { 6, 6, 2, "girls dress medium and large sizes", new DateTime(2021, 12, 5, 0, 0, 0, 0, DateTimeKind.Unspecified), 250.0, 0, 2, 8, "girls dress", 1, 5 }
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Products",
                keyColumn: "ProductId",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Products",
                keyColumn: "ProductId",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "Products",
                keyColumn: "ProductId",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "Products",
                keyColumn: "ProductId",
                keyValue: 6);

            migrationBuilder.DeleteData(
                table: "Subcategories",
                keyColumn: "SubcategoryId",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "Subcategories",
                keyColumn: "SubcategoryId",
                keyValue: 6);

            migrationBuilder.DeleteData(
                table: "Subcategories",
                keyColumn: "SubcategoryId",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Subcategories",
                keyColumn: "SubcategoryId",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "Subcategories",
                keyColumn: "SubcategoryId",
                keyValue: 7);

            migrationBuilder.DeleteData(
                table: "Subcategories",
                keyColumn: "SubcategoryId",
                keyValue: 8);

            migrationBuilder.DeleteData(
                table: "Categories",
                keyColumn: "CategoryId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Categories",
                keyColumn: "CategoryId",
                keyValue: 3);
        }
    }
}
