using BookManagement.Application.Interfaces;

namespace BookManagement.API.Endpoints;

public static class FileEndpoints
{
    public static void MapFileEndpoints(this IEndpointRouteBuilder routes)
    {
        routes.MapGet("/api/file/get-pdf", async (IFileService fileService, HttpContext httpContext) =>
        {
            try
            {
                byte[] buffer = fileService.GetPDFFile();
                if (buffer != null)
                {
                    httpContext.Response.Headers.Add("content-type", "multipart/form-data");
                    httpContext.Response.Headers.Add("content-length", buffer.Length.ToString());
                    httpContext.Response.Headers.Add("content-disposition", "attachment;filename=aspnet-life-cycles-events.pdf");

                    await httpContext.Response.Body.WriteAsync(buffer);
                    await httpContext.Response.Body.FlushAsync();
                    await httpContext.Response.CompleteAsync();

                    return Results.Ok();
                }

                return Results.BadRequest();
            }
            catch (Exception ex)
            {
                return Results.Problem($"ERROR: GetPDFFile - {ex.Message}", statusCode: StatusCodes.Status500InternalServerError);
            }
        })
        .WithTags("File")
        .WithName("GetPDFFile")
        .Produces<byte[]>(StatusCodes.Status200OK)
        .Produces(StatusCodes.Status400BadRequest)
        .Produces(StatusCodes.Status500InternalServerError)
        .RequireAuthorization();
    }
}
