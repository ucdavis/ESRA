﻿using CAESArch.Data.NHibernate;
using CAESDO.Esra.Test.ViewSetup;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using NHibernate.Cfg;

namespace CAESDO.Esra.Test
{
    public abstract class DatabaseTestBase
    {
        [TestInitialize]
        public void CreateDataBase()
        {
            Configuration config = new Configuration().Configure();
            //Create the DB using the schema export
            new NHibernate.Tool.hbm2ddl.SchemaExport(config).Execute(false, true, false, NHibernateSessionManager.Instance.GetSession().Connection, null);
            LoadData();
        }

        public virtual void LoadData()
        {
            EmployeeViewSetup.InsertEmployees();
        }
    }
}