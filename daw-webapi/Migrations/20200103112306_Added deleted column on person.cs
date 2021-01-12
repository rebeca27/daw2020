using Microsoft.EntityFrameworkCore.Migrations;

namespace daw_webapi.Migrations
{
    public partial class Addeddeletedcolumnonperson : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<bool>(
                name: "Deleted",
                table: "Persons",
                nullable: false,
                defaultValue: false);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Deleted",
                table: "Persons");
        }
    }
}
