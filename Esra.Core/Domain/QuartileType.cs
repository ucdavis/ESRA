using FluentNHibernate.Mapping;
using UCDArch.Core.DomainModel;

namespace Esra.Core.Domain
{
    public class QuartileType : DomainObject
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

    public class QuartileTypeMap : ClassMap<QuartileType>
    {
        public QuartileTypeMap()
        {
            Table("QuartileType");
            Id(x => x.Id, "QuartileTypeID")
               .UnsavedValue("0")
               .GeneratedBy.Identity();

            Map(x => x.Type);
            Map(x => x.ShortType);
            Map(x => x.Description);
        }
    }
}