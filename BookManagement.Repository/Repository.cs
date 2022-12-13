using BookManagement.Domain.Base;
using BookManagement.Repository.Context;
using BookManagement.Repository.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace BookManagement.Repository;

public class Repository<T> : IRepository<T> where T : BaseEntity
{
    private readonly AppDbContext _context;

    private DbSet<T> _dbSet;

    public Repository(AppDbContext context)
    {
        _context = context;
        _dbSet = _context.Set<T>();
    }

    public async Task<T?> GetByIdAsync(Guid id)
    {
        return await _dbSet.FindAsync(id);
    }

    public async Task<IEnumerable<T>> GetAllAsync()
    {
        return await _dbSet.AsNoTracking().ToListAsync();
    }

    public async Task<T?> AddAsync(T entity)
    {
        await _dbSet.AddAsync(entity);

        if (await _context.SaveChangesAsync() > 0)
        {
            return entity;
        }

        return null;
    }

    public async Task<T?> Update(T entity)
    {
        var currentEntity = await _dbSet.FindAsync(entity.Id);
        if (currentEntity != null)
        {
            _context.Entry(currentEntity).CurrentValues.SetValues(entity);

            if (await _context.SaveChangesAsync() > 0)
            {
                return currentEntity;
            }
        }

        return null;
    }

    public async Task<bool> Delete(Guid id)
    {
        var entity = await _dbSet.FindAsync(id);
        if (entity != null)
        {
            _dbSet.Remove(entity);
            return await _context.SaveChangesAsync() > 0;
        }

        return false;
    }
}
