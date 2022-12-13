using System.Text.Json;

namespace BookManagement.API.Extensions;

public static class Pagination
{
    public static void AddPagination(this HttpResponse response, int currentPage, int itemsPerPage, int totalItems, int totalPages)
    {
        var pagination = new { currentPage, itemsPerPage, totalItems, totalPages };

        var options = new JsonSerializerOptions
        {
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase
        };

        response.Headers.Add("Pagination", JsonSerializer.Serialize(pagination, options));
        response.Headers.Add("Access-Control-Expose-Headers", "Pagination");
    }
}
