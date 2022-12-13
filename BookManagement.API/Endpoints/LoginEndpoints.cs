using BookManagement.Application.Dtos;
using BookManagement.Application.Interfaces;

namespace BookManagement.API.Endpoints;

public static class LoginEndpoints
{
    public static void MapLoginEndpoints(this IEndpointRouteBuilder routes)
    {
        routes.MapPost("/api/login", async (ILoginService loginService, UserDto model) =>
        {
            try
            {
                var result = await loginService.Login(model);

                return result == null ? Results.BadRequest() : Results.Ok(result);
            }
            catch (Exception ex)
            {
                return Results.Problem($"ERROR: Authenticate - {ex.Message}", statusCode: StatusCodes.Status500InternalServerError);
            }
        })
        .WithTags("Login")
        .WithName("Authenticate")
        .Produces(StatusCodes.Status400BadRequest)
        .Produces<UserDto>(StatusCodes.Status200OK)
        .Produces(StatusCodes.Status500InternalServerError)
        .AllowAnonymous();
    }
}
