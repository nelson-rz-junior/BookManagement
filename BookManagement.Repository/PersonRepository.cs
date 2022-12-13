using BookManagement.Domain;
using BookManagement.Repository.Context;
using BookManagement.Repository.Interfaces;
using BookManagement.Repository.Models;
using Microsoft.EntityFrameworkCore;

namespace BookManagement.Repository;

public class PersonRepository : Repository<Person>, IPersonRepository
{
    private readonly AppDbContext _context;

    public PersonRepository(AppDbContext context) : base(context)
    {
        _context = context;
    }

    public async Task<IEnumerable<Person>> GetByName(string? firstName, string? lastName)
    {
        IQueryable<Person> query = _context.Persons.AsNoTracking();

        if (!string.IsNullOrWhiteSpace(firstName))
        {
            query = query
                .Where(p => p.FirstName.ToLower().Contains(firstName.ToLower()));
        }

        if (!string.IsNullOrWhiteSpace(lastName))
        {
            query = query
                .Where(p => p.LastName.ToLower().Contains(lastName.ToLower()));
        }

        return await query.ToListAsync();
    }

    public async Task<PageList<Person>> GetAllAsync(PageParams pageParams)
    {
        IQueryable<Person> query = _context.Persons.AsNoTracking();

        if (!string.IsNullOrWhiteSpace(pageParams.SearchTerm))
        {
            query = query.Where(p => p.FirstName.ToLower().Contains(pageParams.SearchTerm.ToLower()));
        }

        if (!string.IsNullOrWhiteSpace(pageParams.SortDirection))
        {
            if (pageParams.SortDirection.Equals("ASC", StringComparison.OrdinalIgnoreCase))
            {
                query = query.OrderBy(p => p.FirstName);
            }
            else if (pageParams.SortDirection.Equals("DESC", StringComparison.OrdinalIgnoreCase))
            {
                query = query.OrderByDescending(p => p.FirstName);
            }
        }

        return await PageList<Person>.CreateAsync(query, pageParams.PageNumber, pageParams.PageSize);
    }
}
