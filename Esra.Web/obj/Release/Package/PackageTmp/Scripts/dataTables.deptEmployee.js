jQuery.fn.dataTableExt.oSort['deptEmployee-asc'] = function (a, b) {
    var blankRow = "zzzzz";
    var x = a;
    if (a == undefined || a.trim().length == 0) {
        x = blankRow;
    }
    var y = b;
    if (b == undefined || b.trim().length == 0) {
        y = blankRow;
    }

    if (x == blankRow && y == blankRow) {
        return 0;
    }
    else if (x == blankRow) {
        return 1;
    }
    else {
        return naturalSort(x, y);
    }
};

jQuery.fn.dataTableExt.oSort['deptEmployee-desc'] = function (a, b) {
    var blankRow = "zzzzz";
    var x = a;
    if (a == undefined || a.trim().length == 0) {
        x = blankRow;
    }
    var y = b;
    if (b == undefined || b.trim().length == 0) {
        y = blankRow;
    }

    if (x == blankRow && y == blankRow) {
        return 0;
    }
    else if (x == blankRow) {
        return 1;
    }
    else if (y == blankRow) {
        return -1;
    }
    else {
        return naturalSort(x, y) * -1;
    }
};