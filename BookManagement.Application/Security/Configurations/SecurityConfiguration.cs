using Microsoft.IdentityModel.Tokens;
using System.Security.Cryptography;

namespace BookManagement.Application.Security.Configurations;

public class SecurityConfigurations
{
	public SecurityKey Key { get; }

	public SigningCredentials SigningCredentials { get; }

	public SecurityConfigurations()
	{
		using (var provider = new RSACryptoServiceProvider(2048))
		{
			Key = new RsaSecurityKey(provider.ExportParameters(true));
		}

		SigningCredentials = new SigningCredentials(Key, SecurityAlgorithms.RsaSha512Signature);
	}
}
