using System;
using System.Collections.Generic;
using System.Text;
using System.ComponentModel;
using CAESDO.Esra.Core.DataInterfaces;
using CAESDO.Esra.Core.Domain;
using CAESDO.Esra.Data;

namespace CAESDO.Esra.BLL
{
    public class SRAEmployeeBLL : GenericBLL<SRAEmployee, string>
    {
        public static void UpdateRecord(SRAEmployee record)
        {
            using (var ts = new TransactionScope())
            {
                EnsurePersistent(ref record);
                ts.CommittTransaction();
            }
        }        
    }
}
