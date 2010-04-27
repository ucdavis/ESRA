using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CAESDO.Esra.Core.Domain
{

    [Serializable]
    public class UCDEmployeeID
    {
        protected string _EmployeeID;
        
        public virtual string EmployeeID
        {
            get { return _EmployeeID; }
            set { _EmployeeID = value; }
        }

        protected string _TC;

        public virtual string TC
        {
            get { return _TC; }
            set { _TC = value; }
        }
    
        public override int GetHashCode()
        {
            return Convert.ToInt32(_EmployeeID) ^ Convert.ToInt32(_TC);
        }

        public override bool Equals(object obj)
        {
            if (this == obj)
            {
                return true;
            }
            UCDEmployeeID key = obj as UCDEmployeeID;
            if (key == null)
            {
                return false;
            }
            if (this._EmployeeID != key._EmployeeID || this._TC != key._TC)
            {
                return false;
            }
            return true;
        }

        public override string ToString()
        {
            return _EmployeeID + _TC;
        }

        public UCDEmployeeID() { }

    }
}
