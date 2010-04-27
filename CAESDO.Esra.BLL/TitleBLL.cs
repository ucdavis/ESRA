using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CAESDO.Esra.Core.DataInterfaces;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.Data;

namespace CAESDO.Esra.BLL
{
    public class TitleBLL : GenericBLL<Title, string>
    {

        public static Title GetByTitleCode(string id)
        {
            Title retval = null;

            if (String.IsNullOrEmpty(id) == false && id.Equals("0") == false)
            {
                retval = GetByID(id);
            }

            return retval;
        }
    }
}
