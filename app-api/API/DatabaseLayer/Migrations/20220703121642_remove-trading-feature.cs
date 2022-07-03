using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DatabaseLayer.Migrations
{
    public partial class removetradingfeature : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ProductsBuyOptions");

            migrationBuilder.DropTable(
                name: "BuyOptions");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "BuyOptions",
                columns: table => new
                {
                    BuyOptionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BuyOptions", x => x.BuyOptionId);
                });

            migrationBuilder.CreateTable(
                name: "ProductsBuyOptions",
                columns: table => new
                {
                    ProductId = table.Column<int>(type: "int", nullable: false),
                    BuyOptionId = table.Column<int>(type: "int", nullable: false),
                    SubcategoryId = table.Column<int>(type: "int", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Price = table.Column<double>(type: "float", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ProductsBuyOptions", x => new { x.ProductId, x.BuyOptionId });
                    table.ForeignKey(
                        name: "FK_ProductsBuyOptions_BuyOptions_BuyOptionId",
                        column: x => x.BuyOptionId,
                        principalTable: "BuyOptions",
                        principalColumn: "BuyOptionId",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ProductsBuyOptions_Products_ProductId",
                        column: x => x.ProductId,
                        principalTable: "Products",
                        principalColumn: "ProductId",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ProductsBuyOptions_Subcategories_SubcategoryId",
                        column: x => x.SubcategoryId,
                        principalTable: "Subcategories",
                        principalColumn: "SubcategoryId");
                });

            migrationBuilder.CreateIndex(
                name: "IX_ProductsBuyOptions_BuyOptionId",
                table: "ProductsBuyOptions",
                column: "BuyOptionId");

            migrationBuilder.CreateIndex(
                name: "IX_ProductsBuyOptions_SubcategoryId",
                table: "ProductsBuyOptions",
                column: "SubcategoryId");
        }
    }
}
