using BookManagement.Application.Dtos;
using BookManagement.Application.Security;

namespace BookManagement.Application.Interfaces;

public interface ILoginService
{
    Task<SignInResult> Login(UserDto model);
}
