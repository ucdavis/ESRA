namespace Esra.Web.Models
{
    public class EsraBaseViewModel
    {
        public bool IsDepartmentUser { get; set; }

        public EsraBaseViewModel()
        {
            IsDepartmentUser = false;
        }
    }
}