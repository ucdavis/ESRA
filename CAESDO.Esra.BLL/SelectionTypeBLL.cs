using System;
using CAESDO.Esra.Core.Domain;

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
