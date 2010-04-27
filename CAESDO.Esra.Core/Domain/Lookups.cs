using System;
using CAESArch.Core.Domain;

namespace CAESDO.Esra.Core.Domain
{
    public class Login : DomainObject<Login, string>
    {
        private User _User;

        public virtual User User
        {
            get { return _User; }
            set { _User = value; }
        }

        public Login()
        {
        }
    }

    [Serializable]
    public class Unit : DomainObject<Unit, int>
    {
        private string _ShortName;

        public virtual string ShortName
        {
            get { return _ShortName; }
            set { _ShortName = value; }
        }

        private string _FullName;

        public virtual string FullName
        {
            get { return _FullName; }
            set { _FullName = value; }
        }

        private string _PPSCode;

        public virtual string PPSCode
        {
            get { return _PPSCode; }
            set { _PPSCode = value; }
        }

        private string _FISCode;

        public virtual string FISCode
        {
            get { return _FISCode; }
            set { _FISCode = value; }
        }

        private int _UnitID;

        public virtual int UnitID
        {
            get { return _UnitID; }
            set { _UnitID = value; }
        }

        private int _SchoolCode;

        public virtual int SchoolCode
        {
            get { return _SchoolCode; }
            set { _SchoolCode = value; }
        }

        //private bool _Inactive;

        //public virtual bool Inactive
        //{
        //    get { return _Inactive; }
        //    set { _Inactive = value; }
        //}

        public Unit()
        {

        }
    }

    [Serializable]
    public class Roles : DomainObject<Roles, int>
    {
        private string _Role;

        public virtual string Role
        {
            get { return _Role; }
            set { _Role = value; }
        }

        private int _RoleID;

        public virtual int RoleID
        {
            get { return _RoleID; }
            set { _RoleID = value; }
        }

        //private bool _Inactive;

        //public virtual bool Inactive
        //{
        //    get { return _Inactive; }
        //    set { _Inactive = value; }
        //}

        public Roles()
        {

        }
    }
}
