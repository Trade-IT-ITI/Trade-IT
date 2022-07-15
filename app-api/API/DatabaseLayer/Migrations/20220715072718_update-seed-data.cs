using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DatabaseLayer.Migrations
{
    public partial class updateseeddata : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "ProductsImages",
                keyColumn: "ProductImageId",
                keyValue: 1,
                column: "Name",
                value: "lenovo1.jpg");

            migrationBuilder.UpdateData(
                table: "ProductsImages",
                keyColumn: "ProductImageId",
                keyValue: 2,
                column: "Name",
                value: "lenovo2.jpg");

            migrationBuilder.InsertData(
                table: "ProductsImages",
                columns: new[] { "ProductImageId", "Name", "ProductId" },
                values: new object[,]
                {
                    { 3, "152419-review-hands-on-redmi-note-9-image1-rr6mm2jbpp.jpg", 2 },
                    { 4, "nacon-gaming-chair-blue-pcch-310-bl.jpg", 3 },
                    { 5, "New-Summer-Children-shirts-Printing-Anchor-pattern-Cotton-100-Short-sleeved-Boy-s-shirts-Fit-for.jpg", 4 },
                    { 6, "16828269_35035155_300.jpg", 5 },
                    { 7, "c827e760-197a-4dde-83fe-2975d46017de_large.jpg", 6 }
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
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
    }
}
