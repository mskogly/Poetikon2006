/* 
    ========================================
  ====== Extensions for Core Drawing API ======
    ========================================

v1.1
March 4, 2004

Robert Penner
www.robertpenner.com

*/

var MCP = MovieClip.prototype;

// prevents an infinite recursion bug if this script is run twice in a movie
if (MCP.f6moveTo == null) {
	
	MCP.f6moveTo = MCP.moveTo;
	MCP.moveTo = function (x, y) {
		this.f6moveTo (x, y);
		this._xpen = this._xpenStart = x;
		this._ypen = this._ypenStart = y;
	};
	
	MCP.f6lineTo = MCP.lineTo;
	MCP.lineTo = function (x, y) {
		this.f6lineTo (x, y);
		this._xpen = x;
		this._ypen = y;
	};
	
	MCP.f6curveTo = MCP.curveTo;
	MCP.curveTo = function (cx, cy, ax, ay) {
		this.f6curveTo (cx, cy, ax, ay);
		this._xpen = ax;
		this._ypen = ay;
	};
	
	// initalize coordinates to 0
	MCP._xpen = MCP._ypen = MCP._xpenStart = MCP._ypenStart = 0;
	// hide these properties from for..in loops
	ASSetPropFlags (MCP, null, 1);

} // end if
//-------------------------------------------

// alternate methods for giving color values--red, green, blue separated
MCP.lineStyle2 = function (thick, r, g, b, alpha) {
	var col = r << 16 | g << 8 | b;
	if (alpha == undefined) alpha = 100;
	this.lineStyle (thick, col, alpha);	
};

MCP.beginFill2 = function (r, g, b, alpha) {
	var col = r << 16 | g << 8 | b;
	if (alpha == undefined) alpha = 100;
	this.beginFill (col, alpha);	
};

delete MCP;
