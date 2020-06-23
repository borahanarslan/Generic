using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using DataAccess.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace DataAccess.EntityFreamwork
{
    public class Repository<T> : RepositoryBase, IDataAccess<T> where T : class
    {
        //private readonly ApplicationDbContext Context =new ApplicationDbContext(new DbContextOptions<ApplicationDbContext>());
        private readonly DbSet<T> _objectSet;
        public Repository()
        {

            _objectSet = _context.Set<T>();
        }
        public List<T> List()
        {
            return _objectSet.ToList();
        }

        public IQueryable<T> ListQueryable()
        {
            return _objectSet.AsQueryable<T>();
        }

        public List<T> List(Expression<Func<T, bool>> where)
        {
            return _objectSet.Where(where).ToList();
        }

        public int Insert(T obj)
        {
            _objectSet.Add(obj);

            return Save();
        }
        public IEnumerable<T> SqlQuery(string query)
        {
            return (_objectSet.FromSqlRaw(query).AsEnumerable() ?? throw new InvalidOperationException()).ToList();
        }

        public int Update(T obj)
        {
            return Save();
        }
        public int Delete(T obj)
        {
            _objectSet.Remove(obj);
            return Save();
        }

        public int Save()
        {
            return _context.SaveChanges();
        }

        public T Find(Expression<Func<T, bool>> where)
        {
            return _objectSet.FirstOrDefault(where);
        }

        public int ExecuteWithStoreProcedure(string qery)
        {
            return _context.Database.ExecuteSqlRaw(qery);
        }

    }
}
