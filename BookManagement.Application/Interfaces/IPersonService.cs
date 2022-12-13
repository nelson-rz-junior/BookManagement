using BookManagement.Application.Dtos;
using BookManagement.Repository.Models;

namespace BookManagement.Application.Interfaces;

public interface IPersonService
{
    Task<PersonDto?> GetByIdAsync(Guid id);

    Task<IEnumerable<PersonDto>?> GetByNameAsync(string? firstName, string? lastName);

    Task<IEnumerable<PersonDto>> GetAllAsync();

    Task<PageList<PersonDto>?> GetAllAsync(PageParams pageParams);

    Task<PersonDto?> AddAsync(PersonDto entity);

    Task<PersonDto?> Update(PersonDto entity);

    Task<bool> Delete(Guid id);

}
