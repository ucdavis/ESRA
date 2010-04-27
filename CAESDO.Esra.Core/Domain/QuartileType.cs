using CAESArch.Core.Domain;

namespace CAESDO.Esra.Core.Domain
{
    public class QuartileType : DomainObject<QuartileType, int>
    {
        private string _Type;
        // i.e. Minimum, First, Mid Point, Third, Maximum.
        public virtual string Type
        {
            get { return _Type; }
            set { _Type = value; }
        }

        private string _ShortType;
        // i.e. Min, 1st, Mid, 3rd, Max.
        public virtual string ShortType
        {
            get { return _ShortType; }
            set { _ShortType = value; }
        }

        private string _Description;

        public virtual string Description
        {
            get { return _Description; }
            set { _Description = value; }
        }

        public QuartileType()
        {

        }
    }
}
