using BookManagement.Domain;
using BookManagement.Repository.Context;
using BookManagement.Repository.Interfaces;

namespace BookManagement.Repository;

public class BookRepository : Repository<Book>, IBookRepository
{
    public BookRepository(AppDbContext context) : base(context)
    {
    }
}
