using FluentNHibernate.Mapping;
using UCDArch.Core.DomainModel;

namespace Esra.Core.Domain
{
    public class PayRateType : DomainObject
    {
        //public virtual int id { get { return Id; } }

        private string _Type;

        // i.e. Hourly, Annually, Monthly.
        public virtual string Type
        {
            get { return _Type; }
            set { _Type = value; }
        }

        private string _ShortType;

        // i.e. Hr, Annual, Month.
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

        public PayRateType()
        {
        }
    }

    public class PayRateTypeMap : ClassMap<PayRateType>
    {
        public PayRateTypeMap()
        {
            Table("PayRateType");

            Id(x => x.Id, "PayRateTypeID")
                .UnsavedValue("0")
                .GeneratedBy.Identity();

            Map(x => x.Type);
            Map(x => x.ShortType);
            Map(x => x.Description);
        }
    }
}