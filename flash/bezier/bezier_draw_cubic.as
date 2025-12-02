/* 
==========================
Cubic Bezier Drawing v1.1
==========================
recursive quadratic approximation 
with adjustable tolerance

March 4, 2004

Robert Penner
www.robertpenner.com

	MovieClip.drawBezier()
	MovieClip.drawBezierPts()
	MovieClip.curveToCubic()
	MovieClip.curveToCubicPts()

*/

////////////////////////////////////////////////////
// override drawing methods to store pen location
#include "drawing_api_core_extensions.as"

/////////////////////////////////////////////////////

Math.intersect2Lines = function (p1, p2, p3, p4) {
	var x1 = p1.x; var y1 = p1.y;
	var x4 = p4.x; var y4 = p4.y;

	var dx1 = p2.x - x1;
	var dx2 = p3.x - x4;
	if (!(dx1 || dx2)) return NaN;
	
	var m1 = (p2.y - y1) / dx1;
	var m2 = (p3.y - y4) / dx2;
	
	if (!dx1) {
		// infinity
		return { x:x1,
		         y:m2 * (x1 - x4) + y4 };

	} else if (!dx2) {
		// infinity
		return { x:x4,
		         y:m1 * (x4 - x1) + y1 };
	}
	var xInt = (-m2 * x4 + y4 + m1 * x1 - y1) / (m1 - m2);
	var yInt = m1 * (xInt - x1) + y1;
	return { x:xInt, y:yInt };
};

Math.midLine = function (a, b) {
	return { x:(a.x + b.x)/2, y:(a.y + b.y)/2 };
};

Math.bezierSplit = function (p0, p1, p2, p3) {
	var m = Math.midLine;
	var p01 = m (p0, p1);
	var p12 = m (p1, p2);
	var p23 = m (p2, p3);
	var p02 = m (p01, p12);
	var p13 = m (p12, p23);
	var p03 = m (p02, p13);
	return {
		b0:{a:p0,  b:p01, c:p02, d:p03},
		b1:{a:p03, b:p13, c:p23, d:p3 }  
	};
};

var MCP = MovieClip.prototype;

MCP.$cBez = function (a, b, c, d, k) {
	// find intersection between bezier arms
	var s = Math.intersect2Lines (a, b, c, d);
	// find distance between the midpoints
	var dx = (a.x + d.x + s.x * 4 - (b.x + c.x) * 3) * .125;
	var dy = (a.y + d.y + s.y * 4 - (b.y + c.y) * 3) * .125;
	// split curve if the quadratic isn't close enough
	if (dx*dx + dy*dy > k) {
		var halves = Math.bezierSplit (a, b, c, d);
		var b0 = halves.b0; var b1 = halves.b1;
		// recursive call to subdivide curve
		this.$cBez (a,     b0.b, b0.c, b0.d, k);
		this.$cBez (b1.a,  b1.b, b1.c, d,    k);
	} else {
		// end recursion by drawing quadratic bezier
		this.curveTo (s.x, s.y, d.x, d.y);
	}
};

MCP.drawBezierPts = function (p1, p2, p3, p4, tolerance) {
	if (tolerance == undefined) tolerance = 5;
	this.moveTo (p1.x, p1.y);
	this.$cBez (p1, p2, p3, p4, tolerance*tolerance);
};

MCP.drawBezier = function (x1, y1, x2, y2, x3, y3, x4, y4, tolerance) {
	this.drawBezierPts ({x:x1, y:y1},
						{x:x2, y:y2},
						{x:x3, y:y3},
						{x:x4, y:y4},
						tolerance);
};

MCP.curveToCubic = function (x1, y1, x2, y2, x3, y3, tolerance) {
	if (tolerance == undefined) tolerance = 5;
	this.$cBez (
		{x:this._xpen, y:this._ypen},
		{x:x1, y:y1},
		{x:x2, y:y2},
		{x:x3, y:y3},
		tolerance*tolerance );
};

MCP.curveToCubicPts = function (p1, p2, p3, tolerance) {
	if (tolerance == undefined) tolerance = 5;
	this.$cBez (
		{x:this._xpen, y:this._ypen},
		p1, p2, p3, tolerance*tolerance );
};

delete MCP;






