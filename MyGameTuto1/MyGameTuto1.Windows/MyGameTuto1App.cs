using SiliconStudio.Paradox.Engine;

namespace MyGameTuto1
{
    class MyGameTuto1App
    {
        static void Main(string[] args)
        {
            using (var game = new Game())
            {
                game.Run();
            }
        }
    }
}
