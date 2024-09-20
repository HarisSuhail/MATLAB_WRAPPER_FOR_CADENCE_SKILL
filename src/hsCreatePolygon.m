function [PolygonID] = hsCreatePolygon(fileID, PolyIDNum, x1, y1, x2, y2, Layer)
% Create a rectangle from bottom left point of ('x1','y1') to top right
% point of ('x2','y2') in layer 'Layer' and give it an ID number of
% 'PolyIDNum'

% Author: Haris Suhail, UCLA
    objID = sprintf("POLYGON_ID_%d", PolyIDNum);
    PolygonID = objID;
    CMD_DATA = sprintf("%s = dbCreatePolygon(cv list(""%s"" ""drawing"") list(%.3f:%.3f %.3f:%.3f %.3f:%.3f %.3f:%.3f %.3f:%.3f))\n" ...
        , objID, Layer, x1, y1, x2, y1, x2, y2, x1, y2, x1, y1);
    fprintf(fileID, CMD_DATA );
    %CMD_STRING_2 = 'dbAddFigToFigGroup(dbGetFigGroupByName(cv GroupName) objId)\n';
    CMD_STRING_2 = sprintf("dbAddFigToFigGroup(dbGetFigGroupByName(cv GroupName) %s)\n", PolygonID);
    fprintf(fileID, CMD_STRING_2);
end