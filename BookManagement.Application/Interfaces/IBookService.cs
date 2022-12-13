using BookManagement.Application.Dtos;

namespace BookManagement.Application.Interfaces;

public interface IBookService
{
    Task<BookDto?> GetByIdAsync(Guid id);

    Task<IEnumerable<BookDto>> GetAllAsync();

    Task<BookDto?> AddAsync(BookDto entity);

    Task<BookDto?> Update(BookDto entity);

    Task<bool> Delete(Guid id);
}
