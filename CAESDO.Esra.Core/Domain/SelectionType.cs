using System;
using System.Collections.Generic;
using System.Text;

namespace CAESDO.Esra.Core.Domain
{
    public class SelectionType : DomainObject<SelectionType, int>
    {
        public static readonly string NONE = "None";

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

        public SelectionType()
        {

        }
    }
}
