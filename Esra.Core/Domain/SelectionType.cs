using FluentNHibernate.Mapping;
using UCDArch.Core.DomainModel;

namespace Esra.Core.Domain
{
    public class SelectionType : DomainObject
    {
        public static readonly string NONE = "None";

        public enum Types : int { NONE = 0, MIN = 1, FIRST = 2, MID = 3, THIRD = 4, MAX = 5, LM_WAS = 6, LM_MID = 7, COLLEGE_AVG = 8, CAMPUS_AVG = 9, STEP = 10 };

        private string _Type;

        // i.e. Minimum, First, Mid Point, Third, Maximum, Labor Market Weighted Average Salary, Labor Market Mid, etc.
        public virtual string Type
        {
            get { return _Type; }
            set { _Type = value; }
        }

        private string _ShortType;

        // i.e. Min, 1st, Mid, 3rd, Max, LM WAS, LM Mid, etc.
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

        private string _SortOrder;

        public virtual string SortOrder
        {
            get { return _SortOrder; }
            set { _SortOrder = value; }
        }

        public SelectionType()
        {
        }
    }

    public class SelectionTypeMap : ClassMap<SelectionType>
    {
        public SelectionTypeMap()
        {
            Table("SelectionType");
            Id(x => x.Id, "SelectionTypeID")
               .UnsavedValue("0")
               .GeneratedBy.Identity();

            Map(x => x.Type);
            Map(x => x.ShortType);
            Map(x => x.Description);
            Map(x => x.SortOrder);
        }
    }
}