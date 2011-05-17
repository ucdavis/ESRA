namespace Esra.Core.Domain
{
    public static class ValidateBO<T>
    {
        /*
        public static bool isValid(T obj)
        {
            return new Validator.IsValid(obj);
        }

        public static ValidationResult GetValidationResults(T obj)
        {
            return GetValidationResults(obj);
        }

        public static string GetValidationResultsAsString(T obj)
        {
            StringBuilder ErrorString = new StringBuilder();

            foreach (ValidationResult r in GetValidationResults(obj))
            {
                ErrorString.AppendLine(string.Format("{0}, {1}", r.Key, r.Message));
            }

            return ErrorString.ToString();
        }

         * */
    }
}