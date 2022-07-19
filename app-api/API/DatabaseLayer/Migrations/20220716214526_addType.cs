using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DatabaseLayer.Migrations
{
    public partial class addType : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Type",
                table: "Users",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.UpdateData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 2,
                column: "Type",
                value: 1);

            migrationBuilder.InsertData(
                table: "Users",
                columns: new[] { "UserId", "Email", "FirstName", "LastName", "Password", "Phone", "Type" },
                values: new object[] { 3, "ali@gmail.com", "ali", "salim", "345", "01548574125", 1 });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Users",
                keyColumn: "UserId",
                keyValue: 3);

            migrationBuilder.DropColumn(
                name: "Type",
                table: "Users");
        }
    }
}
