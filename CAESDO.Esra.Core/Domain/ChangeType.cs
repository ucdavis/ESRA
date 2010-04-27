using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CAESArch.Core.Domain;

namespace CAESDO.Esra.Core.Domain
{
    [Serializable]
    public class ChangeType : DomainObject<ChangeType, int>
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
}
