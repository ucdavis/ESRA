using System;
using System.Web.Mvc;
using Esra.Core.Domain;
using Esra.Web.Resources;
using UCDArch.Web.Attributes;
using UCDArch.Web.Controller;

namespace Esra.Web.Controllers
{
    [Version(MajorVersion = 2)]
    [Authorize]
    public class ApplicationController : SuperController
    {
        protected static SchoolEmployees AllEmployees { get; set; }

        /// <summary>
        /// A department user is a person whose one and only role is USER.
        ///
        /// First we check to see if we are trying to emulate a particular user role,
        /// which is indicated by the KEY_IS_DEPARTMENT_USER being present in the session.
        ///
        /// If the KEY_IS_DEPARTMENT_USER is not present, then we use the normal role membership
        /// provider role checking.
        /// </summary>
        /// <returns>true if the user is only a departmental user; false otherwise.</returns>
        protected static bool IsDepartmentUser
        {
            get
            {
                bool retval = true;  // default on the side of more restrictive user visibility.

                bool? isDepartmentUser = System.Web.HttpContext.Current.Session[GlobalConstants.KEY_IS_DEPARTMENT_USER] as Boolean?;

                if (isDepartmentUser != null)
                {
                    retval = (bool)isDepartmentUser;
                }
                else
                {
                    var user = System.Web.HttpContext.Current.User;

                    if (user != null)
                    {
                        if ((user.IsInRole(GlobalConstants.ROLE_ADMIN) ||
                            user.IsInRole(GlobalConstants.ROLE_DO_USER)) ||
                            user.IsInRole(GlobalConstants.ROLE_REVIEWER))
                        {
                            retval = false;
                        }
                    }
                }
                return retval;
            }
        }
    }
}