using AutoMapper;
using BookManagement.Application.Dtos;
using BookManagement.Application.Interfaces;
using BookManagement.Domain;
using BookManagement.Repository.Interfaces;

namespace BookManagement.Application;

public class BookService : IBookService
{
    private readonly IBookRepository _bookRepository;

    private readonly IMapper _mapper;

    public BookService(IBookRepository bookRepository, IMapper mapper)
    {
        _bookRepository = bookRepository;
        _mapper = mapper;
    }

    public async Task<BookDto?> GetByIdAsync(Guid id)
    {
        try
        {
            var book = await _bookRepository.GetByIdAsync(id);

            if (book != null)
            {
                return _mapper.Map<BookDto?>(book);
            }

            return null;

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public async Task<IEnumerable<BookDto>> GetAllAsync()
    {
        try
        {
            var books = await _bookRepository.GetAllAsync();

            return _mapper.Map<IEnumerable<BookDto>>(books);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public async Task<BookDto?> AddAsync(BookDto entity)
    {
        try
        {
            var book = _mapper.Map<Book>(entity);

            var result = await _bookRepository.AddAsync(book);

            if (result != null)
            {
                return _mapper.Map<BookDto>(result);
            }

            return null;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public async Task<BookDto?> Update(BookDto entity)
    {
        try
        {
            if (entity == null)
            {
                return null;
            }

            var book = _mapper.Map<Book>(entity);
            var result = await _bookRepository.Update(book);

            if (result != null)
            {
                return _mapper.Map<BookDto>(result);
            }

            return null;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public async Task<bool> Delete(Guid id)
    {
        try
        {
            return await _bookRepository.Delete(id);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }
}
