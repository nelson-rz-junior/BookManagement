using AutoMapper;
using BookManagement.Application.Dtos;
using BookManagement.Domain;

namespace BookManagement.Application.Helpers;

public class BookManagementProfile: Profile
{
	public BookManagementProfile()
	{
		CreateMap<User, UserDto>().ReverseMap();
        CreateMap<Person, PersonDto>().ReverseMap();
        CreateMap<Book, BookDto>().ReverseMap();
    }
}
