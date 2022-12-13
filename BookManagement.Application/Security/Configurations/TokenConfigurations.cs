namespace BookManagement.Application.Security.Configurations;

public class TokenConfigurations
{
    public string? Audience { get; set; }

    public string? Issuer { get; set; }

    public int ExpirationSeconds { get; set; }
}
