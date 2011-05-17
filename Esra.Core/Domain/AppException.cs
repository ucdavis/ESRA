namespace Esra.Core.Domain
{
    /*
    [AttributeIdentifier("Id.Column", Value = "AppExceptionID")]
    [AttributeIdentifier("Id.GeneratorClass", Value = "identity")]

    [Class(Table = "AppException")]
    public class AppException : DomainObject
    {
        [Property]
        public virtual int ApplicationID { get; set; }

        [Property]
        public virtual DateTime DateException { get; set; }

        [Property]
        public virtual string LoginID { get; set; }

        [Bag(0, Table = "Exceptions", Inverse = true)]
        [Key(1, Column = "AppExceptionID")]
        [OneToMany(2, ClassType = typeof(Exception))]
        public virtual IList<Exception> Exceptions { get; set; }

        public override bool IsValid(AppException entity)
        {
            //An app exception has to occur before yesterday (for testing)
            if (entity.DateException > DateTime.Now.Subtract(TimeSpan.FromDays(1)))
                return false;

            return base.IsValid(entity);
        }

        public AppException()
        {
        }
    }
     * */
}