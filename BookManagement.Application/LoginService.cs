using BookManagement.Application.Dtos;
using BookManagement.Application.Interfaces;
using BookManagement.Application.Security;
using BookManagement.Application.Security.Configurations;
using BookManagement.Repository.Interfaces;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Principal;

namespace BookManagement.Application;

public class LoginService: ILoginService
{
    private readonly IUserRepository _userRepository;

    private readonly SecurityConfigurations _securityConfigurations;

    private readonly TokenConfigurations _tokenConfigurations;

    public LoginService(IUserRepository userRepository, SecurityConfigurations securityConfigurations, IOptions<TokenConfigurations> tokenConfigurations)
	{
		_userRepository = userRepository;
		_securityConfigurations = securityConfigurations;
		_tokenConfigurations = tokenConfigurations.Value;
	}

	public async Task<SignInResult> Login(UserDto model)
	{
		bool credentialsIsValid = false;

		if (model != null && !string.IsNullOrWhiteSpace(model.Login))
		{
			var user = await _userRepository.GetByLogin(model.Login);
			credentialsIsValid = user != null && user.AccessKey == model.AccessKey;
		}

		if (credentialsIsValid)
		{
			ClaimsIdentity claimsIdentity = new(
				new GenericIdentity(model.Login, "Login"),
				new[]
				{
					new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
					new Claim(JwtRegisteredClaimNames.UniqueName, model.Login)
				}
			);

			DateTime createDate = DateTime.Now;
			DateTime expirationDate = createDate.AddSeconds(_tokenConfigurations.ExpirationSeconds);

			var handler = new JwtSecurityTokenHandler();
			var token = CreateToken(claimsIdentity, createDate, expirationDate, handler);

			return new SignInResult
			{
				Autenticated = true,
				Created = createDate.ToString("yyyy-MM-dd HH:mm:ss"),
				Expiration = expirationDate.ToString("yyyy-MM-dd HH:mm:ss"),
				AccessToken = token,
				Message = "OK"
			};
		}

        return new SignInResult
        {
            Autenticated = false,
            Message = "Failed to authenticate"
        };
    }

	private string CreateToken(ClaimsIdentity claimsIdentity, DateTime createDate, DateTime expirationDate, JwtSecurityTokenHandler handler)
	{
		var securityToken = handler.CreateToken(new SecurityTokenDescriptor
		{
			Issuer = _tokenConfigurations.Issuer,
			Audience = _tokenConfigurations.Audience,
			SigningCredentials = _securityConfigurations.SigningCredentials,
			Subject = claimsIdentity,
			NotBefore = createDate,
			Expires = expirationDate
		});

		var token = handler.WriteToken(securityToken);

		return token;
	}
}
