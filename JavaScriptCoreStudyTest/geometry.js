var euclideanDistance = function(p1,p2) {
    var xDelta = p2.x - p1.x;
    var yDelta = p2.y - p1.y;
    return Math.sqrt(xDelta * xDelta + yDelta * yDelta);
};

var midpoint = function(p1, p2) {
    log("p1.x = " + p1.x + " p1.y =" + p1.y);
    log("p2.x = " + p2.x + " p2.y =" + p2.y);
    var xDelta = (p2.x - p1.x) / 2;
    var yDelta = (p2.y - p1.y) / 2;
    return MyPoint.makePointWithXY(p1.x + xDelta, p1.y + yDelta);
};
