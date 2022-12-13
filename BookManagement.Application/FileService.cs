using BookManagement.Application.Interfaces;

namespace BookManagement.Application;

public class FileService: IFileService
{
    public byte[] GetPDFFile()
    {
        var path = Directory.GetCurrentDirectory();
        var fullPath = Path.Combine(path, "Files", "aspnet-life-cycles-events.pdf");
        return File.ReadAllBytes(fullPath);
    }
}
