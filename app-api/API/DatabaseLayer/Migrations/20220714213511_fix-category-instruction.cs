using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DatabaseLayer.Migrations
{
    public partial class fixcategoryinstruction : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_CategoriesInstructions",
                table: "CategoriesInstructions");

            migrationBuilder.DropColumn(
                name: "InsturctionId",
                table: "CategoriesInstructions");

            migrationBuilder.AlterColumn<int>(
                name: "InstructionId",
                table: "CategoriesInstructions",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddPrimaryKey(
                name: "PK_CategoriesInstructions",
                table: "CategoriesInstructions",
                columns: new[] { "CategoryId", "InstructionId" });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_CategoriesInstructions",
                table: "CategoriesInstructions");

            migrationBuilder.AlterColumn<int>(
                name: "InstructionId",
                table: "CategoriesInstructions",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<int>(
                name: "InsturctionId",
                table: "CategoriesInstructions",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddPrimaryKey(
                name: "PK_CategoriesInstructions",
                table: "CategoriesInstructions",
                columns: new[] { "CategoryId", "InsturctionId" });
        }
    }
}
