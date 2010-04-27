function ExportToExcel() {
    PageMethods.ExportToExcel(ExportToExcelOnComplete)

    return false;
}

function ExportToExcelOnComplete() {
    var win = window.open('ExportToExcel.aspx', 'ExportToExcel'); // Do not put spaces in the second parameter
}