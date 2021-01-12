using Microsoft.EntityFrameworkCore.Migrations;

namespace daw_webapi.Migrations
{
    public partial class AddedEventEventTypeEventGenreEventTypeXEventGenre : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "EventGenres",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(nullable: true),
                    Deleted = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EventGenres", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "EventTypes",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(nullable: true),
                    Deleted = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EventTypes", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "EventParents",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(nullable: true),
                    EventTypeId = table.Column<long>(nullable: false),
                    EventGenreId = table.Column<long>(nullable: false),
                    Description = table.Column<string>(nullable: true),
                    Deleted = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EventParents", x => x.Id);
                    table.ForeignKey(
                        name: "FK_EventParents_EventGenres_EventGenreId",
                        column: x => x.EventGenreId,
                        principalTable: "EventGenres",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_EventParents_EventTypes_EventTypeId",
                        column: x => x.EventTypeId,
                        principalTable: "EventTypes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "EventTypeXEventGenres",
                columns: table => new
                {
                    Id = table.Column<long>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    EventTypeId = table.Column<long>(nullable: false),
                    EventGenreId = table.Column<long>(nullable: false),
                    Deleted = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_EventTypeXEventGenres", x => x.Id);
                    table.ForeignKey(
                        name: "FK_EventTypeXEventGenres_EventGenres_EventGenreId",
                        column: x => x.EventGenreId,
                        principalTable: "EventGenres",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_EventTypeXEventGenres_EventTypes_EventTypeId",
                        column: x => x.EventTypeId,
                        principalTable: "EventTypes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_EventParents_EventGenreId",
                table: "EventParents",
                column: "EventGenreId");

            migrationBuilder.CreateIndex(
                name: "IX_EventParents_EventTypeId",
                table: "EventParents",
                column: "EventTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_EventTypeXEventGenres_EventGenreId",
                table: "EventTypeXEventGenres",
                column: "EventGenreId");

            migrationBuilder.CreateIndex(
                name: "IX_EventTypeXEventGenres_EventTypeId",
                table: "EventTypeXEventGenres",
                column: "EventTypeId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "EventParents");

            migrationBuilder.DropTable(
                name: "EventTypeXEventGenres");

            migrationBuilder.DropTable(
                name: "EventGenres");

            migrationBuilder.DropTable(
                name: "EventTypes");
        }
    }
}
