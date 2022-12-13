using AutoMapper;
using BookManagement.Application.Dtos;
using BookManagement.Application.Interfaces;
using BookManagement.Domain;
using BookManagement.Repository.Interfaces;
using BookManagement.Repository.Models;

namespace BookManagement.Application;

public class PersonService: IPersonService
{
    private readonly IPersonRepository _personRepository;

    private readonly IMapper _mapper;

    public PersonService(IPersonRepository personRepository, IMapper mapper)
    {
        _personRepository = personRepository;
        _mapper = mapper;
    }

    public async Task<PersonDto?> GetByIdAsync(Guid id)
    {
        try
        {
            var person = await _personRepository.GetByIdAsync(id);

            if (person != null)
            {
                return _mapper.Map<PersonDto?>(person);
            }

            return null;

        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public async Task<IEnumerable<PersonDto>?> GetByNameAsync(string? firstName, string? lastName)
    {
        try
        {
            var people = await _personRepository.GetByName(firstName, lastName);

            if (people != null)
            {
                return _mapper.Map<IEnumerable<PersonDto>>(people);
            }

            return null;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public async Task<IEnumerable<PersonDto>> GetAllAsync()
    {
        try
        {
            var people = await _personRepository.GetAllAsync();

            return _mapper.Map<IEnumerable<PersonDto>>(people);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public async Task<PageList<PersonDto>?> GetAllAsync(PageParams pageParams)
    {
        try
        {
            var people = await _personRepository.GetAllAsync(pageParams);

            if (people != null)
            {
                var result = _mapper.Map<PageList<PersonDto>>(people);

                result.CurrentPage = people.CurrentPage;
                result.TotalPages = people.TotalPages;
                result.PageSize = people.PageSize;
                result.TotalCount = people.TotalCount;

                return result;
            }

            return null;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public async Task<PersonDto?> AddAsync(PersonDto entity)
    {
        try
        {
            var person = _mapper.Map<Person>(entity);

            var result = await _personRepository.AddAsync(person);

            if (result != null)
            {
                return _mapper.Map<PersonDto>(result);
            }

            return null;
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }

    public async Task<PersonDto?> Update(PersonDto entity)
    {
        try
        {
            if (entity == null)
            {
                return null;
            }

            var person = _mapper.Map<Person>(entity);
            var result = await _personRepository.Update(person);

            if (result != null)
            {
                return _mapper.Map<PersonDto>(result);
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
            return await _personRepository.Delete(id);
        }
        catch (Exception ex)
        {
            throw new Exception(ex.Message);
        }
    }
}
