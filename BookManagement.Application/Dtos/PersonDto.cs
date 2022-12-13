namespace BookManagement.Application.Dtos;

public class PersonDto
{
    public Guid Id { get; set; }

    public string? FirstName { get; set; }

    public string? LastName { get; set; }

    public string? Address { get; set; }

    public string? Gender { get; set; }
}
