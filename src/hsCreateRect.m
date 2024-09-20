function [PolygonID] = hsCreateRect(fileID, PolyIDNum, X, Y, W, H, Layer)
% Create a rectangle centered at ('X','Y') with width and height 'W','H'
% in layer 'Layer' and give it an ID number of 'PolyIDNum'

% Author: Haris Suhail, UCLA
    x1 = X - (W/2);
    y1 = Y - (H/2);
    x2 = X + (W/2);
    y2 = Y + (H/2);

    objID = sprintf("RECT_ID_%d", PolyIDNum);
    PolygonID = objID;
    CMD_DATA = sprintf("%s = dbCreatePolygon(cv list(""%s"" ""drawing"") list(%.3f:%.3f %.3f:%.3f %.3f:%.3f %.3f:%.3f %.3f:%.3f))\n" ...
        , objID, Layer, x1, y1, x2, y1, x2, y2, x1, y2, x1, y1);
    fprintf(fileID, CMD_DATA );
    %CMD_STRING_2 = 'dbAddFigToFigGroup(dbGetFigGroupByName(cv GroupName) objId)\n';
    CMD_STRING_2 = sprintf("dbAddFigToFigGroup(dbGetFigGroupByName(cv GroupName) %s)\n", PolygonID);
    fprintf(fileID, CMD_STRING_2);
end