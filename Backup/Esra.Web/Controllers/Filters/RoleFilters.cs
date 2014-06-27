using System;
using System.Web.Mvc;

namespace Esra.Web.Controllers.Filters
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class AdminOnlyAttribute : AuthorizeAttribute
    {
        public AdminOnlyAttribute()
        {
            Roles = RoleNames.Admin;    //Set the roles prop to a comma delimited string of allowed roles
        }
    }

    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class UserOnlyAttribute : AuthorizeAttribute
    {
        public UserOnlyAttribute()
        {
            Roles = RoleNames.User;    //Set the roles prop to a comma delimited string of allowed roles
        }
    }

    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class AnyoneWithRoleAttribute : AuthorizeAttribute
    {
        public AnyoneWithRoleAttribute()
        {
            Roles = RoleNames.Admin + "," + RoleNames.DOUser + "," + RoleNames.Reviewer + "," + RoleNames.User;    //Set the roles prop to a comma delimited string of allowed roles
        }
    }

    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class UserAdminOnlyAttribute : AuthorizeAttribute
    {
        public UserAdminOnlyAttribute()
        {
            Roles = RoleNames.ManageAll + "," + RoleNames.SchoolAdmin;    //Set the roles prop to a comma delimited string of allowed roles
        }
    }

    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class ReviewerOnlyAttribute : AuthorizeAttribute
    {
        public ReviewerOnlyAttribute()
        {
            Roles = RoleNames.Reviewer;    //Set the roles prop to a comma delimited string of allowed roles
        }
    }

    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class DeansOfficeOnlyAttribute : AuthorizeAttribute
    {
        public DeansOfficeOnlyAttribute()
        {
            Roles = RoleNames.DOUser;    //Set the roles prop to a comma delimited string of allowed roles
        }
    }
}