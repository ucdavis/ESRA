using System;
using CAESArch.Core.Domain;

namespace CAESDO.Esra.Core.Domain
{
    [Serializable]
    public class EmployeeChanges : DomainObject<EmployeeChanges, int>
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
}
