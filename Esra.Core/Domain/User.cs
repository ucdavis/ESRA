using System;
using System.Collections.Generic;
using FluentNHibernate.Mapping;
using UCDArch.Core.DomainModel;

namespace Esra.Core.Domain
{
    [Serializable]
    public class User : DomainObject
    {
        //private IList<Login> _LoginIDs;

        //public virtual IList<Login> LoginIDs
        //{
        //    get { return _LoginIDs; }
        //    set { _LoginIDs = value; }
        //}

        private string _LoginID;

        public virtual string LoginID
        {
            get { return _LoginID; }
            set { _LoginID = value; }
        }

        private string _Email;

        public virtual string Email
        {
            get { return _Email; }
            set { _Email = value; }
        }

        private string _Phone;

        public virtual string Phone
        {
            get { return _Phone; }
            set { _Phone = value; }
        }

        private string _FirstName;

        public virtual string FirstName
        {
            get { return _FirstName; }
            set { _FirstName = value; }
        }

        private string _LastName;

        public virtual string LastName
        {
            get { return _LastName; }
            set { _LastName = value; }
        }

        private string _FullName;

        public virtual string FullName
        {
            get { return (String.IsNullOrEmpty(_FullName) ? _LastName + ", " + _FirstName : _FullName); }
            set { _FullName = value; }
        }

        private string _EmployeeID;

        public virtual string EmployeeID
        {
            get { return _EmployeeID; }
            set { _EmployeeID = value; }
        }

        private string _StudentID;

        public virtual string StudentID
        {
            get { return _StudentID; }
            set { _StudentID = value; }
        }

        private string _UserImage;

        public virtual string UserImage
        {
            get { return _UserImage; }
            set { _UserImage = value; }
        }

        private string _SID;

        public virtual string SID
        {
            get { return _SID; }
            set { _SID = value; }
        }

        //private bool _Inactive;

        //public virtual bool Inactive
        //{
        //    get { return _Inactive; }
        //    set { _Inactive = value; }
        //}

        private Guid _UserKey;

        public virtual Guid UserKey
        {
            get { return _UserKey; }
            set { _UserKey = value; }
        }

        private IList<Unit> _Units;

        public virtual IList<Unit> Units
        {
            get { return _Units; }
            set { _Units = value; }
        }

        private IList<Roles> _Roles;

        public virtual IList<Roles> Roles
        {
            get { return _Roles; }
            set { _Roles = value; }
        }

        /// <summary>
        /// This is in order to demo an "entitled" user as a department user.
        /// </summary>
        public virtual bool IsDepartmentUser { get; set; }

        public static List<string> FindUCDKerberosIDs(string NameToMatch)
        {
            throw new System.NotImplementedException();
        }

        public User()
        {
            IsDepartmentUser = false;
        }
    }

    public class UserMap : ClassMap<User>
    {
        public UserMap()
        {
            Table("Catbert3_vUsers");

            Id(x => x.Id, "UserID")
                .UnsavedValue("0")
                .GeneratedBy.Identity();

            Map(x => x.LoginID);
            Map(x => x.Email);
            Map(x => x.Phone);
            Map(x => x.FirstName);
            Map(x => x.LastName);
            Map(x => x.EmployeeID);
            Map(x => x.StudentID);
            Map(x => x.UserImage);
            Map(x => x.SID);
            Map(x => x.UserKey);

            HasManyToMany(x => x.Units)
                .Table("Catbert3_vUserUnit")
                .AsBag()
                .ParentKeyColumn("UserID")
                .ChildKeyColumn("UnitID");

            HasManyToMany(x => x.Roles)
                .Table("Catbert3_vUserRoles")
                .AsBag()
                .ParentKeyColumn("UserID")
                .ChildKeyColumn("RoleID");
        }
    }
}