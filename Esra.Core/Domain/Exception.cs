namespace Esra.Core.Domain
{
    /*
    [AttributeIdentifier("Id.Column", Value = "ExceptionID")]
    [AttributeIdentifier("Id.GeneratorClass", Value = "identity")]

    [Class(Table = "Exceptions")]
    public class Exception : DomainObject
    {
        [Property]
        public virtual string Message { get; set; }

        [Property]
        public virtual string FormattedException { get; set; }

        [ManyToOne(Column = "AppExceptionID", NotNull = true)]
        public virtual AppException AssociatedException { get; set; }

        public Exception()
        {
        }
    }
     * */
}