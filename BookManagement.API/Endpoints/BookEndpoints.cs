using BookManagement.Application.Dtos;
using BookManagement.Application.Interfaces;

namespace BookManagement.API.Endpoints;

public static class BookEndpoints
{
    public static void MapBookEndpoints(this IEndpointRouteBuilder routes)
    {
        routes.MapGet("/api/books/all", async (IBookService bookService) =>
        {
            var books = await bookService.GetAllAsync();

            return Results.Ok(books);
        })
        .WithTags("Book")
        .WithName("GetBooks")
        .Produces<IEnumerable<BookDto>>(StatusCodes.Status200OK)
        .RequireAuthorization();

        routes.MapGet("/api/books/find-by-id/{id}", async (IBookService bookService, string id) =>
        {
            if (!Guid.TryParse(id, out var bookId))
            {
                return Results.BadRequest("Invalid GUID");
            }

            var book = await bookService.GetByIdAsync(bookId);

            return book == null ? Results.NotFound() : Results.Ok(book);
        })
        .WithTags("Book")
        .WithName("GetBookById")
        .Produces(StatusCodes.Status400BadRequest)
        .Produces(StatusCodes.Status404NotFound)
        .Produces<BookDto>(StatusCodes.Status200OK)
        .RequireAuthorization();

        routes.MapPost("/api/books", async (IBookService bookService, BookDto model) =>
        {
            var book = await bookService.AddAsync(model);

            return book == null ? Results.BadRequest() : Results.Created($"/api/books/{book.Id}", book);
        })
        .WithTags("Book")
        .WithName("CreateBook")
        .Produces(StatusCodes.Status400BadRequest)
        .Produces<BookDto>(StatusCodes.Status201Created)
        .RequireAuthorization();

        routes.MapPut("/api/books", async (IBookService bookService, BookDto model) =>
        {
            var book = await bookService.Update(model);

            return book == null ? Results.BadRequest() : Results.Ok(book);
        })
        .WithTags("Book")
        .WithName("UpdateBook")
        .Produces(StatusCodes.Status400BadRequest)
        .Produces<BookDto>(StatusCodes.Status200OK)
        .RequireAuthorization();

        routes.MapDelete("/api/books/{id}", async (IBookService bookService, string id) =>
        {
            if (!Guid.TryParse(id, out var bookId))
            {
                return Results.BadRequest("Invalid GUID");
            }

            var result = await bookService.Delete(bookId);

            return result ? Results.NoContent() : Results.BadRequest();
        })
        .WithTags("Book")
        .WithName("DeleteBook")
        .Produces(StatusCodes.Status204NoContent)
        .Produces(StatusCodes.Status400BadRequest)
        .RequireAuthorization();
    }
}
