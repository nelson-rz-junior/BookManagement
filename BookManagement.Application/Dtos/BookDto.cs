namespace BookManagement.Application.Dtos;

public class BookDto
{
    public Guid Id { get; set; }

    public string? Title { get; set; }

    public string? Author { get; set; }

    public decimal Price { get; set; }

    public DateTime LaunchDate { get; set; }
}
