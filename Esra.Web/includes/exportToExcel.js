function ExportToExcel(propertyName, ascending, titleCodesString, pkEmployeeID, departmentsString) {
    PageMethods.ExportToExcel(propertyName, ascending, titleCodesString, pkEmployeeID, departmentsString, ExportToExcelOnComplete)

    return false;
}

function ExportToExcelOnComplete() {
    var win = window.open('ExportToExcel.aspx', 'ExportToExcel'); // Do not put spaces in the second parameter
}