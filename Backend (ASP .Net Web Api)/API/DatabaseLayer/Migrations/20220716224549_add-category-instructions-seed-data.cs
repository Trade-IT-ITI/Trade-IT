using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DatabaseLayer.Migrations
{
    public partial class addcategoryinstructionsseeddata : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "Instructions",
                columns: new[] { "InstructionId", "Text" },
                values: new object[,]
                {
                    { 1, "you should meet product's owner in a public place" },
                    { 2, "it would be better if you brought someone with you to witness selling process" },
                    { 3, "check product's battery before buying" },
                    { 4, "make sure the cloth have no cuts" },
                    { 5, "check the screen well" }
                });

            migrationBuilder.InsertData(
                table: "CategoriesInstructions",
                columns: new[] { "CategoryId", "InstructionId" },
                values: new object[,]
                {
                    { 1, 1 },
                    { 1, 2 },
                    { 1, 3 },
                    { 1, 5 },
                    { 2, 1 },
                    { 2, 2 },
                    { 3, 1 },
                    { 3, 2 },
                    { 3, 4 }
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "CategoriesInstructions",
                keyColumns: new[] { "CategoryId", "InstructionId" },
                keyValues: new object[] { 1, 1 });

            migrationBuilder.DeleteData(
                table: "CategoriesInstructions",
                keyColumns: new[] { "CategoryId", "InstructionId" },
                keyValues: new object[] { 1, 2 });

            migrationBuilder.DeleteData(
                table: "CategoriesInstructions",
                keyColumns: new[] { "CategoryId", "InstructionId" },
                keyValues: new object[] { 1, 3 });

            migrationBuilder.DeleteData(
                table: "CategoriesInstructions",
                keyColumns: new[] { "CategoryId", "InstructionId" },
                keyValues: new object[] { 1, 5 });

            migrationBuilder.DeleteData(
                table: "CategoriesInstructions",
                keyColumns: new[] { "CategoryId", "InstructionId" },
                keyValues: new object[] { 2, 1 });

            migrationBuilder.DeleteData(
                table: "CategoriesInstructions",
                keyColumns: new[] { "CategoryId", "InstructionId" },
                keyValues: new object[] { 2, 2 });

            migrationBuilder.DeleteData(
                table: "CategoriesInstructions",
                keyColumns: new[] { "CategoryId", "InstructionId" },
                keyValues: new object[] { 3, 1 });

            migrationBuilder.DeleteData(
                table: "CategoriesInstructions",
                keyColumns: new[] { "CategoryId", "InstructionId" },
                keyValues: new object[] { 3, 2 });

            migrationBuilder.DeleteData(
                table: "CategoriesInstructions",
                keyColumns: new[] { "CategoryId", "InstructionId" },
                keyValues: new object[] { 3, 4 });

            migrationBuilder.DeleteData(
                table: "Instructions",
                keyColumn: "InstructionId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "Instructions",
                keyColumn: "InstructionId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "Instructions",
                keyColumn: "InstructionId",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "Instructions",
                keyColumn: "InstructionId",
                keyValue: 4);

            migrationBuilder.DeleteData(
                table: "Instructions",
                keyColumn: "InstructionId",
                keyValue: 5);
        }
    }
}
