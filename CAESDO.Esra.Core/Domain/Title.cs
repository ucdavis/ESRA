﻿using System;
using System.Collections.Generic;
using CAESArch.Core.Domain;

namespace CAESDO.Esra.Core.Domain
{
    [Serializable]
    public class Title : DomainObject<Title, string>
    {
        private string _TitleCode;
        // i.e. 9614, etc.
        public virtual string TitleCode
        {
            get { return _TitleCode; }
            set { _TitleCode = value; }
        }

        private string _PayrollTitle;
        // aka Name, i.e. STAFF RESEARCH ASSOCIATE IV --SUPERVISOR, etc.
        public virtual string PayrollTitle
        {
            get { return _PayrollTitle; }
            set { _PayrollTitle = value; }
        }

        private string _AbbreviatedName;
        // i.e. SRA IV - SUPERVISOR, etc.
        public virtual string AbbreviatedName
        {
            get { return _AbbreviatedName; }
            set { _AbbreviatedName = value; }
        }

        private IList<SalaryScale> _SalaryScales;

        public virtual IList<SalaryScale> SalaryScales
        {
            get { return _SalaryScales; }
            set { _SalaryScales = value; }
        }

        //private string _SalaryGrade;

        //public virtual string SalaryGrade
        //{
        //    get { return _SalaryGrade; }
        //    set { _SalaryGrade = value; }
        //}

        //private string _BargainingCode;
        //// i.e. 99, TX, etc.
        //public virtual string BargainingCode
        //{
        //    get { return _BargainingCode; }
        //    set { _BargainingCode = value; }
        //}

        public virtual string TitleCode_Name
        {
            get { return _TitleCode + " - " + _AbbreviatedName; }
        }

        public virtual string PayrollTitle_TitleCode
        {
            get { return _AbbreviatedName + " (" + _TitleCode + ")"; }
        }

        public Title()
        {

        }
    }
}
