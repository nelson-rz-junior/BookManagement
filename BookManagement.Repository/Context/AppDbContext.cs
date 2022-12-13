using BookManagement.Domain;
using Microsoft.EntityFrameworkCore;

namespace BookManagement.Repository.Context;

public class AppDbContext : DbContext
{
	public AppDbContext(DbContextOptions<AppDbContext> options): base(options)
	{
	}

	public DbSet<Book> Books => Set<Book>();

    public DbSet<User> Users => Set<User>();

    public DbSet<Person> Persons => Set<Person>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder
           .Entity<Book>()
           .Property(u => u.Id)
           .HasDefaultValueSql("NEWSEQUENTIALID()");

        modelBuilder
           .Entity<User>()
           .Property(u => u.Id)
           .HasDefaultValueSql("NEWSEQUENTIALID()");

        modelBuilder
            .Entity<Person>()
            .Property(u => u .Id)
            .HasDefaultValueSql("NEWSEQUENTIALID()");
    }
}
