using System;
using System.Reflection;

namespace CAESDO.Esra.Test
{
    public class EntityIdSetter
    {
        /// <summary>
        /// Uses reflection to set the Id of an object
        /// </summary>
        public static void SetIdOf<IdT>(object entity, IdT id)
        {
            // Set the data property reflectively
            PropertyInfo idProperty = entity.GetType().GetProperty("ID",
                                                                   BindingFlags.Public | BindingFlags.Instance | BindingFlags.NonPublic);

            if (idProperty == null) throw new ArgumentException("idProperty could not be found");

            idProperty.SetValue(entity, id, null);
        }
    }
}