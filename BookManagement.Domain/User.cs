using BookManagement.Domain.Base;

namespace BookManagement.Domain;

public class User: BaseEntity
{
    public string? Login { get; set; }

    public string? AccessKey { get; set; }
}
