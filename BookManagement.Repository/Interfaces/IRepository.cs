using BookManagement.Domain.Base;
using System.Linq.Expressions;

namespace BookManagement.Repository.Interfaces;

public interface IRepository<T> where T: BaseEntity
{
    Task<T?> GetByIdAsync(Guid id);

    Task<IEnumerable<T>> GetAllAsync();

    Task<T?> AddAsync(T entity);

    Task<T?> Update(T entity);

    Task<bool> Delete(Guid id);
}
