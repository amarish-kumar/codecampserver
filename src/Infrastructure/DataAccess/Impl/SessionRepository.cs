using CodeCampServer.Core.Domain;
using CodeCampServer.Core.Domain.Model;
using Tarantino.Infrastructure.Commons.DataAccess.ORMapper;

namespace CodeCampServer.Infrastructure.DataAccess.Impl
{
	public class SessionRepository : KeyedRepositoryBase<Session>, ISessionRepository
	{
		public SessionRepository(ISessionBuilder sessionFactory) : base(sessionFactory)
		{
		}
	}
}