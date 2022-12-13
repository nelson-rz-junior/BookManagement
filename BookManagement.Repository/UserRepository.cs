using BookManagement.Domain;
using BookManagement.Repository.Context;
using BookManagement.Repository.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace BookManagement.Repository;

public class UserRepository : Repository<User>, IUserRepository
{
    private readonly AppDbContext _context;

    public UserRepository(AppDbContext context) : base(context)
    {
        _context = context;
    }

    public Task<User?> GetByLogin(string login)
    {
        return _context.Users.AsNoTracking()
            .FirstOrDefaultAsync(u => u.Login.ToLower() == login.ToLower());
    }
}
