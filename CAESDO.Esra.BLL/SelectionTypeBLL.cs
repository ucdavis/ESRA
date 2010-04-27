using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CAESDO.Esra.Core.DataInterfaces;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.Data;

namespace CAESDO.Esra.BLL
{
    public class SelectionTypeBLL : GenericBLL<SelectionType, int>
    {
        public static SelectionType GetByType(string type)
        {
            if (String.IsNullOrEmpty(type) || type.Equals("0"))
            {
               type = SelectionType.NONE;
            }

            return GetByProperty("Type", type);
        }
    }
}
