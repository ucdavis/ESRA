using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CAESDO.Esra.Core.DataInterfaces;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.Data;

namespace CAESDO.Esra.BLL
{
    public class TitleBLL : GenericBLL<Title, int>
    {

        public static Title GetByTitleCode(int id)
        {
            Title retval = null;

            if (id > 0)
            {

                retval = GetByID(id);
            }

            return retval;
        }
    }
}
