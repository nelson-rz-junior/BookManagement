namespace BookManagement.Application.Security;

public class SignInResult
{
    public bool Autenticated { get; set; }

    public string Created { get; set; } = string.Empty;

    public string Expiration { get; set; } = string.Empty;

    public string AccessToken { get; set; } = string.Empty;

    public string? Message { get; set; }
}
