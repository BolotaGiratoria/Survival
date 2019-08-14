///arg object
///arg grid
var _object = argument0;
var _grid = argument1;

var _top_right = _grid[# (_object.bbox_right-1) div CELLWIDTH, _object.bbox_top div CELLHEIGHT] == VOID;
var _top_left = _grid[# _object.bbox_left div CELLWIDTH, _object.bbox_top div CELLHEIGHT] == VOID;
var _bottom_right = _grid[# (_object.bbox_right-1) div CELLWIDTH, (_object.bbox_bottom-1) div CELLHEIGHT] == VOID;
var _bottom_left = _grid[# _object.bbox_left div CELLWIDTH, (_object.bbox_bottom-1) div CELLHEIGHT] == VOID;


return _top_right || _top_left || _bottom_right || _bottom_left;