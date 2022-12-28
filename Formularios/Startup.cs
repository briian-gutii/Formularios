using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Formularios.Startup))]
namespace Formularios
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
