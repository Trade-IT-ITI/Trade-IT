using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DatabaseLayer.Migrations
{
    public partial class updateproductimagesseeddata : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
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

            migrationBuilder.UpdateData(
                table: "Products",
                keyColumn: "ProductId",
                keyValue: 5,
                column: "AreaId",
                value: 1);

            migrationBuilder.UpdateData(
                table: "Products",
                keyColumn: "ProductId",
                keyValue: 6,
                column: "AreaId",
                value: 4);

            migrationBuilder.UpdateData(
                table: "ProductsImages",
                keyColumn: "ProductImageId",
                keyValue: 1,
                column: "Name",
                value: "lenovo_x1.jpg");

            migrationBuilder.UpdateData(
                table: "ProductsImages",
                keyColumn: "ProductImageId",
                keyValue: 2,
                column: "Name",
                value: "lenovo_x1_2.jpg");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Products",
                keyColumn: "ProductId",
                keyValue: 5,
                column: "AreaId",
                value: 2);

            migrationBuilder.UpdateData(
                table: "Products",
                keyColumn: "ProductId",
                keyValue: 6,
                column: "AreaId",
                value: 3);

            migrationBuilder.UpdateData(
                table: "ProductsImages",
                keyColumn: "ProductImageId",
                keyValue: 1,
                column: "Name",
                value: "Lenovo-1.jpeg");

            migrationBuilder.UpdateData(
                table: "ProductsImages",
                keyColumn: "ProductImageId",
                keyValue: 2,
                column: "Name",
                value: "Lenovo-2.jpeg");

            migrationBuilder.InsertData(
                table: "ProductsImages",
                columns: new[] { "ProductImageId", "Name", "ProductId" },
                values: new object[,]
                {
                    { 3, "Lenovo-3.jpeg", 1 },
                    { 4, "Lenovo-4.jpeg", 1 },
                    { 5, "RedmiNote9-1.png", 2 },
                    { 6, "RedmiNote9-2.png", 2 },
                    { 7, "RedmiNote9-3.png", 2 }
                });
        }
    }
}
