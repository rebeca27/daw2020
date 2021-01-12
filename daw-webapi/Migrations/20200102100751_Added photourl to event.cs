using Microsoft.EntityFrameworkCore.Migrations;

namespace daw_webapi.Migrations
{
    public partial class Addedphotourltoevent : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "PhotoURL",
                table: "EventParents",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "PhotoURL",
                table: "EventParents");
        }
    }
}
