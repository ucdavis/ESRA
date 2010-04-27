using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CAESDO.Esra.Core.Domain
{
    public class ApptType : DomainObject<ApptType, int>
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
}
