using BookManagement.Domain;

namespace BookManagement.Repository.Interfaces;

public interface IUserRepository: IRepository<User>
{
    Task<User?> GetByLogin(string login);
}
