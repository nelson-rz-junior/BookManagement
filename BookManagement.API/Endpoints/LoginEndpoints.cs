using BookManagement.Application.Dtos;
using BookManagement.Application.Interfaces;

namespace BookManagement.API.Endpoints;

public static class LoginEndpoints
{
    public static void MapLoginEndpoints(this IEndpointRouteBuilder routes)
    {
        routes.MapPost("/api/login", async (ILoginService loginService, UserDto model) =>
        {
            var result = await loginService.Login(model);

            return result == null ? Results.BadRequest() : Results.Ok(result);
        })
        .WithTags("Login")
        .WithName("Authenticate")
        .Produces(StatusCodes.Status400BadRequest)
        .Produces<UserDto>(StatusCodes.Status200OK)
        .AllowAnonymous();
    }
}
