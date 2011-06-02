using System;
using FluentNHibernate.Mapping;
using UCDArch.Core.DomainModel;

namespace Esra.Core.Domain
{
    [Serializable]
    public class ChangeType : DomainObject
    {
        private string _type;

        // i.e. Career, etc.
        public virtual string Type
        {
            get { return _type; }
            set { _type = value; }
        }

        private string _shortType;

        // i.e. CAR.
        public virtual string ShortType
        {
            get { return _shortType; }
            set { _shortType = value; }
        }

        private string _description;

        public virtual string Description
        {
            get { return _description; }
            set { _description = value; }
        }

        public ChangeType()
        {
        }
    }

    public class ChangeTypeMap : ClassMap<ChangeType>
    {
        public ChangeTypeMap()
        {
            Table("ChangeType");
            Id(x => x.Id, "ChangeTypeID")
               .UnsavedValue("0")
               .GeneratedBy.Identity();

            Map(x => x.Type);
            Map(x => x.ShortType);
            Map(x => x.Description);
        }
    }
}