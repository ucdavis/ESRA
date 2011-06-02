using System;
using FluentNHibernate.Mapping;
using UCDArch.Core.DomainModel;

namespace Esra.Core.Domain
{
    [Serializable]
    public class ApptType : DomainObject
    {
        private string _Type;

        // i.e. Career, etc.
        public virtual string Type
        {
            get { return _Type; }
            set { _Type = value; }
        }

        private string _ShortType;

        // i.e. CAR.
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

        public ApptType()
        {
        }
    }

    public class ApptTypeMap : ClassMap<ApptType>
    {
        public ApptTypeMap()
        {
            Table("ApptType");
            Id(x => x.Id, "ApptTypeID")
                .UnsavedValue("0")
                .GeneratedBy.Identity();

            Map(x => x.Type);
            Map(x => x.ShortType);
            Map(x => x.Description);
        }
    }
}