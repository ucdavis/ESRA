using System;
using FluentNHibernate.Mapping;
using UCDArch.Core.DomainModel;

namespace Esra.Core.Domain
{
    [Serializable]
    public class EmployeeChanges : DomainObject
    {
        public virtual string EmployeeID { get; set; }

        public virtual Employee Employee { get; set; }

        public virtual Title Title { get; set; }

        public virtual User User { get; set; }

        public virtual ChangeType ChangeType { get; set; }

        public virtual DateTime DateChanged { get; set; }

        public virtual string Comments { get; set; }

        public EmployeeChanges()
        {
        }
    }

    public class EmployeeChangesMap : ClassMap<EmployeeChanges>
    {
        public EmployeeChangesMap()
        {
            Id(x => x.Id, "EmployeeChangesID")
               .UnsavedValue("0")
               .GeneratedBy.Identity();

            Map(x => x.EmployeeID, "FkEmployee").Not.Insert().Not.Update();
            References(x => x.Employee, "FkEmployee").ForeignKey("PkEmployee");
            References(x => x.Title, "TitleCode").ForeignKey("TitleCode");
            References(x => x.User, "UserID").ForeignKey("UserID");
            References(x => x.ChangeType, "ChangeTypeID").ForeignKey("ChangeTypeID");
            Map(x => x.DateChanged);
            Map(x => x.Comments);
        }
    }
}