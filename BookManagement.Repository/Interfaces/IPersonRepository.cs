using BookManagement.Domain;
using BookManagement.Repository.Models;

namespace BookManagement.Repository.Interfaces;

public interface IPersonRepository: IRepository<Person>
{
    Task<IEnumerable<Person>> GetByName(string? firstName, string? lastName);

    Task<PageList<Person>> GetAllAsync(PageParams pageParams);
}
