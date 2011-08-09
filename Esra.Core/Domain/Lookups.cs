using System;
using FluentNHibernate.Mapping;
using UCDArch.Core.DomainModel;

namespace Esra.Core.Domain
{
    public class Login : DomainObjectWithTypedId<string>
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

    public class LoginMap : ClassMap<Login>
    {
        public LoginMap()
        {
            Table("Catbert3_vLogin");

            Id(x => x.Id, "LoginID")
                .UnsavedValue("empty")
                .GeneratedBy.Assigned();

            References(x => x.User, "UserID")
                .Not.Nullable();
        }
    }

    [Serializable]
    public class Unit : DomainObject
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
            get
            {
                if (!String.IsNullOrEmpty(_PPSCode))
                    return _PPSCode.Trim();

                return _PPSCode;
            }
            set { _PPSCode = value; }
        }

        private string _FISCode;

        public virtual string FISCode
        {
            get
            {
                if (!String.IsNullOrEmpty(_FISCode))
                    return _FISCode.Trim();

                return _FISCode;
            }
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

        private string _DeansOfficeSchoolCode;

        public virtual string DeansOfficeSchoolCode
        {
            get { return _DeansOfficeSchoolCode; }
            set { _DeansOfficeSchoolCode = value; }
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

    public class UnitMap : ClassMap<Unit>
    {
        public UnitMap()
        {
            Table("Catbert3_vUnit");

            Id(x => x.Id, "UnitID")
                .UnsavedValue("0")
                .GeneratedBy.Assigned();

            Map(x => x.FullName);
            Map(x => x.ShortName);
            Map(x => x.PPSCode);
            Map(x => x.FISCode);
            Map(x => x.SchoolCode);
            Map(x => x.DeansOfficeSchoolCode);

            ReadOnly();
        }
    }

    [Serializable]
    public class Roles : DomainObject
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

    public class RolesMap : ClassMap<Roles>
    {
        public RolesMap()
        {
            Table("Catbert3_vRoles");

            Id(x => x.Id, "RoleID")
                .UnsavedValue("0")
                .GeneratedBy.Assigned();

            Map(x => x.Role);
        }
    }
}