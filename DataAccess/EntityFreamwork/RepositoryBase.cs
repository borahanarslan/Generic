
using Microsoft.EntityFrameworkCore;

namespace DataAccess.EntityFreamwork
{
    public class RepositoryBase
    {
        protected DatabaseContext _context;
        protected object LockSync = new object();
        protected RepositoryBase()
        {
            CreateContext();
        }
        private void CreateContext()
        {
            if (_context == null)
            {
                lock (LockSync)
                {
                    _context ??= new DatabaseContext(new DbContextOptions<DatabaseContext>());
                }

            }
        }
    }
}