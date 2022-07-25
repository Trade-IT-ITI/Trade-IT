using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DatabaseLayer.Migrations
{
    public partial class addingcityareaandseeddata : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Area",
                table: "Products");

            migrationBuilder.DropColumn(
                name: "City",
                table: "Products");

            migrationBuilder.AddColumn<int>(
                name: "AreaId",
                table: "Products",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "CityId",
                table: "Products",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "City",
                columns: table => new
                {
                    CityId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_City", x => x.CityId);
                });

            migrationBuilder.CreateTable(
                name: "Area",
                columns: table => new
                {
                    AreaId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    CityId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Area", x => x.AreaId);
                    table.ForeignKey(
                        name: "FK_Area_City_CityId",
                        column: x => x.CityId,
                        principalTable: "City",
                        principalColumn: "CityId");
                });

            migrationBuilder.InsertData(
                table: "Categories",
                columns: new[] { "CategoryId", "Name" },
                values: new object[] { 1, "Electronics" });

            migrationBuilder.InsertData(
                table: "City",
                columns: new[] { "CityId", "Name" },
                values: new object[,]
                {
                    { 1, "Cairo" },
                    { 2, "Giza" },
                    { 3, "Mansoura" }
                });

            migrationBuilder.InsertData(
                table: "Statuses",
                columns: new[] { "StatusId", "Name" },
                values: new object[,]
                {
                    { 1, "Staged" },
                    { 2, "Sold" }
                });

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "UserId", "FirstName", "LastName", "Phone" },
                values: new object[,]
                {
                    { 1, "Abdelrahman", "Ahmed", "01155661788" },
                    { 2, "Marwan", "Sayed", "01524556671" }
                });

            migrationBuilder.InsertData(
                table: "Area",
                columns: new[] { "AreaId", "CityId", "Name" },
                values: new object[,]
                {
                    { 1, 1, "Ain Shams" },
                    { 2, 1, "Al Mataryah" },
                    { 3, 2, "Al Haram" },
                    { 4, 2, "Imbaba" },
                    { 5, 3, "Samyah El Gamal St" },
                    { 6, 3, "AL Sadr Hospital" }
                });

            migrationBuilder.InsertData(
                table: "Subcategories",
                columns: new[] { "SubcategoryId", "CategoryId", "Name" },
                values: new object[,]
                {
                    { 1, 1, "Laptops" },
                    { 2, 1, "Mobiles" }
                });

            migrationBuilder.InsertData(
                table: "Products",
                columns: new[] { "ProductId", "AreaId", "CityId", "Descrioption", "PostDateTime", "Price", "RequestCount", "StatusId", "SubcategoryId", "Title", "UserId", "ViewsCount" },
                values: new object[] { 1, 2, 1, "Lenovo Ideapad 330 Laptop, Intel Core i3-7020U, 15.6 Inch, 1TB, 4GB RAM, DOS - Platinum Grey", new DateTime(2022, 6, 15, 0, 0, 0, 0, DateTimeKind.Unspecified), 8000.0, 2, 1, 1, "Lenovo Ideapad 330", 2, 20 });

            migrationBuilder.InsertData(
                table: "Products",
                columns: new[] { "ProductId", "AreaId", "CityId", "Descrioption", "PostDateTime", "Price", "RequestCount", "StatusId", "SubcategoryId", "Title", "UserId", "ViewsCount" },
                values: new object[] { 2, 1, 2, "Redmi Note 9 is equipped with a high-performance octa-core processor with a maximum clock speed of 3.0GHz, a GPU frequency of 1000MHz, for improved performance to provide you with a seamless gaming experience and implement your ideas.", new DateTime(2022, 6, 28, 0, 0, 0, 0, DateTimeKind.Unspecified), 3450.0, 10, 2, 2, "Redmi note 9", 1, 88 });

            migrationBuilder.InsertData(
                table: "ProductsImages",
                columns: new[] { "ProductImageId", "Name", "ProductId" },
                values: new object[,]
                {
                    { 1, "Lenovo-1.jpeg", 1 },
                    { 2, "Lenovo-2.jpeg", 1 },
                    { 3, "Lenovo-3.jpeg", 1 },
                    { 4, "Lenovo-4.jpeg", 1 },
                    { 5, "RedmiNote9-1.png", 2 },
                    { 6, "RedmiNote9-2.png", 2 },
                    { 7, "RedmiNote9-3.png", 2 }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Products_AreaId",
                table: "Products",
                column: "AreaId");

            migrationBuilder.CreateIndex(
                name: "IX_Products_CityId",
                table: "Products",
                column: "CityId");

            migrationBuilder.CreateIndex(
                name: "IX_Area_CityId",
                table: "Area",
                column: "CityId");

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Area_AreaId",
                table: "Products",
                column: "AreaId",
                principalTable: "Area",
                principalColumn: "AreaId");

            migrationBuilder.AddForeignKey(
                name: "FK_Products_City_CityId",
                table: "Products",
                column: "CityId",
                principalTable: "City",
                principalColumn: "CityId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Products_Area_AreaId",
                table: "Products");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_City_CityId",
                table: "Products");

            migrationBuilder.DropTable(
                name: "Area");

            migrationBuilder.DropTable(
                name: "City");

            migrationBuilder.DropIndex(
                name: "IX_Products_AreaId",
                table: "Products");

            migrationBuilder.DropIndex(
                name: "IX_Products_CityId",
                table: "Products");

            migrationBuilder.DeleteData(
                table: "ProductsImages",
                keyColumn: "ProductImageId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "ProductsImages",
                keyColumn: "ProductImageId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "ProductsImages",
                keyColumn: "ProductImageId",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "ProductsImages",
                keyColumn: "ProductImageId",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "ProductsImages",
                keyColumn: "ProductImageId",
                keyValue: 5);

            migrationBuilder.DeleteData(
                table: "ProductsImages",
                keyColumn: "ProductImageId",
                keyValue: 6);

            migrationBuilder.DeleteData(
                table: "ProductsImages",
                keyColumn: "ProductImageId",
                keyValue: 7);

            migrationBuilder.DeleteData(
                table: "Products",
                keyColumn: "ProductId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Products",
                keyColumn: "ProductId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Statuses",
                keyColumn: "StatusId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Statuses",
                keyColumn: "StatusId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Subcategories",
                keyColumn: "SubcategoryId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Subcategories",
                keyColumn: "SubcategoryId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Categories",
                keyColumn: "CategoryId",
                keyValue: 1);

            migrationBuilder.DropColumn(
                name: "AreaId",
                table: "Products");

            migrationBuilder.DropColumn(
                name: "CityId",
                table: "Products");

            migrationBuilder.AddColumn<string>(
                name: "Area",
                table: "Products",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "City",
                table: "Products",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}
