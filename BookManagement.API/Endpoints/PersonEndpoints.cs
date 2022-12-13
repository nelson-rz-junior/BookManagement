using BookManagement.Application.Dtos;
using BookManagement.Application.Interfaces;
using BookManagement.Repository.Models;
using Microsoft.AspNetCore.Mvc;

namespace BookManagement.API.Endpoints;

public static class PersonEndpoints
{
    public static void MapPersonEndpoints(this IEndpointRouteBuilder routes)
    {
        routes.MapGet("/api/people/all", async (IPersonService personService) =>
        {
            var people = await personService.GetAllAsync();

            return Results.Ok(people);
        })
        .WithTags("Person")
        .WithName("GetPeople")
        .Produces<IEnumerable<PersonDto>>(StatusCodes.Status200OK)
        .RequireAuthorization();

        routes.MapGet("/api/people/find-by-id/{id}", async (IPersonService personService, string id) =>
        {
            if (!Guid.TryParse(id, out var personId))
            {
                return Results.BadRequest("Invalid GUID");
            }

            var person = await personService.GetByIdAsync(personId);

            return person == null ? Results.NotFound() : Results.Ok(person);
        })
        .WithTags("Person")
        .WithName("GetPersonById")
        .Produces(StatusCodes.Status404NotFound)
        .Produces<PersonDto>(StatusCodes.Status200OK)
        .RequireAuthorization();

        routes.MapGet("/api/people/find-by-name", async (IPersonService personService, [FromQuery] string? firstName, [FromQuery] string? lastName) =>
        {
            if (string.IsNullOrWhiteSpace(firstName) && string.IsNullOrWhiteSpace(lastName))
            {
                return Results.BadRequest("firstName OR lastName querystring must be filled");
            }

            var people = await personService.GetByNameAsync(firstName, lastName);

            return people == null || !people.Any() ? Results.NotFound() : Results.Ok(people);
        })
        .WithTags("Person")
        .WithName("GetPersonByName")
        .Produces(StatusCodes.Status404NotFound)
        .Produces<IEnumerable<PersonDto>>(StatusCodes.Status200OK)
        .RequireAuthorization();

        routes.MapGet("/api/people/find-all-paged/{pageNumber}/{pageSize}/{sortDirection}", 
            async (IPersonService personService, [FromQuery] string? searchTerm, int pageNumber, int pageSize, string sortDirection) =>
        {
            PageParams pageParams = new()
            {
                SearchTerm = searchTerm ?? "",
                SortDirection = sortDirection,
                PageSize = pageSize,
                PageNumber= pageNumber
            };

            var people = await personService.GetAllAsync(pageParams);

            return people == null || !people.Any() ? Results.NotFound() : Results.Ok(people);
        })
        .WithTags("Person")
        .WithName("GetPersonByPaged")
        .Produces(StatusCodes.Status404NotFound)
        .Produces<IEnumerable<PersonDto>>(StatusCodes.Status200OK)
        .RequireAuthorization();

        routes.MapPost("/api/people", async (IPersonService personService, PersonDto model) =>
        {
            var person = await personService.AddAsync(model);

            return person == null ? Results.BadRequest() : Results.Created($"/api/people/{person.Id}", person);
        })
        .WithTags("Person")
        .WithName("CreatePerson")
        .Produces(StatusCodes.Status400BadRequest)
        .Produces<PersonDto>(StatusCodes.Status201Created)
        .RequireAuthorization();

        routes.MapPut("/api/people", async (IPersonService personService, PersonDto model) =>
        {
            var person = await personService.Update(model);

            return person == null ? Results.BadRequest() : Results.Ok(person);
        })
        .WithTags("Person")
        .WithName("UpdatePerson")
        .Produces(StatusCodes.Status400BadRequest)
        .Produces<PersonDto>(StatusCodes.Status200OK)
        .RequireAuthorization();

        routes.MapDelete("/api/people/{id}", async (IPersonService personService, string id) =>
        {
            if (!Guid.TryParse(id, out var personId))
            {
                return Results.BadRequest("Invalid GUID");
            }

            var result = await personService.Delete(personId);

            return result ? Results.NoContent() : Results.BadRequest();
        })
        .WithTags("Person")
        .WithName("DeletePerson")
        .Produces(StatusCodes.Status400BadRequest)
        .Produces(StatusCodes.Status204NoContent)
        .RequireAuthorization();
    }
}
