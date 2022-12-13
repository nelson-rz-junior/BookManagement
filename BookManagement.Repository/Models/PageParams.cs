namespace BookManagement.Repository.Models;

public class PageParams
{
    public const int MaxPageSize = 50;

    private int _PageSize = MaxPageSize;

    public int PageNumber { get; set; } = 1;

    public int PageSize
    {
        get 
        { 
            return _PageSize; 
        }
        set 
        {
            _PageSize = value > MaxPageSize ? MaxPageSize : value; 
        }
    }

    public string SearchTerm { get; set; } = string.Empty;

    public string SortDirection { get; set; } = string.Empty;
}