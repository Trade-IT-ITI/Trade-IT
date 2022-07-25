using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DatabaseLayer.Migrations
{
    public partial class addcityareadbsets : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Area_City_CityId",
                table: "Area");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_Area_AreaId",
                table: "Products");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_City_CityId",
                table: "Products");

            migrationBuilder.DropPrimaryKey(
                name: "PK_City",
                table: "City");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Area",
                table: "Area");

            migrationBuilder.RenameTable(
                name: "City",
                newName: "Cities");

            migrationBuilder.RenameTable(
                name: "Area",
                newName: "Areas");

            migrationBuilder.RenameIndex(
                name: "IX_Area_CityId",
                table: "Areas",
                newName: "IX_Areas_CityId");

            migrationBuilder.AlterColumn<int>(
                name: "ViewsCount",
                table: "Products",
                type: "int",
                nullable: true,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldDefaultValue: 0);

            migrationBuilder.AlterColumn<int>(
                name: "RequestCount",
                table: "Products",
                type: "int",
                nullable: true,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldDefaultValue: 0);

            migrationBuilder.AddPrimaryKey(
                name: "PK_Cities",
                table: "Cities",
                column: "CityId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Areas",
                table: "Areas",
                column: "AreaId");

            migrationBuilder.AddForeignKey(
                name: "FK_Areas_Cities_CityId",
                table: "Areas",
                column: "CityId",
                principalTable: "Cities",
                principalColumn: "CityId");

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Areas_AreaId",
                table: "Products",
                column: "AreaId",
                principalTable: "Areas",
                principalColumn: "AreaId");

            migrationBuilder.AddForeignKey(
                name: "FK_Products_Cities_CityId",
                table: "Products",
                column: "CityId",
                principalTable: "Cities",
                principalColumn: "CityId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Areas_Cities_CityId",
                table: "Areas");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_Areas_AreaId",
                table: "Products");

            migrationBuilder.DropForeignKey(
                name: "FK_Products_Cities_CityId",
                table: "Products");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Cities",
                table: "Cities");

            migrationBuilder.DropPrimaryKey(
                name: "PK_Areas",
                table: "Areas");

            migrationBuilder.RenameTable(
                name: "Cities",
                newName: "City");

            migrationBuilder.RenameTable(
                name: "Areas",
                newName: "Area");

            migrationBuilder.RenameIndex(
                name: "IX_Areas_CityId",
                table: "Area",
                newName: "IX_Area_CityId");

            migrationBuilder.AlterColumn<int>(
                name: "ViewsCount",
                table: "Products",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true,
                oldDefaultValue: 0);

            migrationBuilder.AlterColumn<int>(
                name: "RequestCount",
                table: "Products",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true,
                oldDefaultValue: 0);

            migrationBuilder.AddPrimaryKey(
                name: "PK_City",
                table: "City",
                column: "CityId");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Area",
                table: "Area",
                column: "AreaId");

            migrationBuilder.AddForeignKey(
                name: "FK_Area_City_CityId",
                table: "Area",
                column: "CityId",
                principalTable: "City",
                principalColumn: "CityId");

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
    }
}
