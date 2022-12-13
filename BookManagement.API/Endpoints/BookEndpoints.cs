using BookManagement.Application.Dtos;
using BookManagement.Application.Interfaces;

namespace BookManagement.API.Endpoints;

public static class BookEndpoints
{
    public static void MapBookEndpoints(this IEndpointRouteBuilder routes)
    {
        routes.MapGet("/api/books/all", async (IBookService bookService) =>
        {
            try
            {
                var books = await bookService.GetAllAsync();

                return Results.Ok(books);
            }
            catch (Exception ex)
            {
                return Results.Problem($"ERROR: GetBooks - {ex.Message}", statusCode: StatusCodes.Status500InternalServerError);
            }
        })
        .WithTags("Book")
        .WithName("GetBooks")
        .Produces<IEnumerable<BookDto>>(StatusCodes.Status200OK)
        .Produces(StatusCodes.Status500InternalServerError)
        .RequireAuthorization();

        routes.MapGet("/api/books/find-by-id/{id}", async (IBookService bookService, string id) =>
        {
            try
            {
                if (!Guid.TryParse(id, out var bookId))
                {
                    return Results.BadRequest("Invalid GUID");
                }

                var book = await bookService.GetByIdAsync(bookId);

                return book == null ? Results.NotFound() : Results.Ok(book);
            }
            catch (Exception ex)
            {
                return Results.Problem($"ERROR: GetBookById - {ex.Message}", statusCode: StatusCodes.Status500InternalServerError);
            }
        })
        .WithTags("Book")
        .WithName("GetBookById")
        .Produces(StatusCodes.Status400BadRequest)
        .Produces(StatusCodes.Status404NotFound)
        .Produces<BookDto>(StatusCodes.Status200OK)
        .Produces(StatusCodes.Status500InternalServerError)
        .RequireAuthorization();

        routes.MapPost("/api/books", async (IBookService bookService, BookDto model) =>
        {
            try
            {
                var book = await bookService.AddAsync(model);

                return book == null ? Results.BadRequest() : Results.Created($"/api/books/{book.Id}", book);
            }
            catch (Exception ex)
            {
                return Results.Problem($"ERROR: CreateBook - {ex.Message}", statusCode: StatusCodes.Status500InternalServerError);
            }
        })
        .WithTags("Book")
        .WithName("CreateBook")
        .Produces(StatusCodes.Status400BadRequest)
        .Produces<BookDto>(StatusCodes.Status201Created)
        .Produces(StatusCodes.Status500InternalServerError)
        .RequireAuthorization();

        routes.MapPut("/api/books", async (IBookService bookService, BookDto model) =>
        {
            try
            {
                var book = await bookService.Update(model);

                return book == null ? Results.BadRequest() : Results.Ok(book);
            }
            catch (Exception ex)
            {
                return Results.Problem($"ERROR: UpdateBook - {ex.Message}", statusCode: StatusCodes.Status500InternalServerError);
            }
        })
        .WithTags("Book")
        .WithName("UpdateBook")
        .Produces(StatusCodes.Status400BadRequest)
        .Produces<BookDto>(StatusCodes.Status200OK)
        .Produces(StatusCodes.Status500InternalServerError)
        .RequireAuthorization();

        routes.MapDelete("/api/books/{id}", async (IBookService bookService, string id) =>
        {
            try
            {
                if (!Guid.TryParse(id, out var bookId))
                {
                    return Results.BadRequest("Invalid GUID");
                }

                var result = await bookService.Delete(bookId);

                return result ? Results.NoContent() : Results.BadRequest();
            }
            catch (Exception ex)
            {
                return Results.Problem($"ERROR: DeleteBook - {ex.Message}", statusCode: StatusCodes.Status500InternalServerError);
            }
        })
        .WithTags("Book")
        .WithName("DeleteBook")
        .Produces(StatusCodes.Status204NoContent)
        .Produces(StatusCodes.Status400BadRequest)
        .Produces(StatusCodes.Status500InternalServerError)
        .RequireAuthorization();
    }
}
