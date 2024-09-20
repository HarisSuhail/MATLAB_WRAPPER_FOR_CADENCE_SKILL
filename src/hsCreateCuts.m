function [] = hsCreateCuts(fileID,CreatedObjectName, Layer ,PolygonToCut,CutObjectNameList)
% Creates cuts in the main polygon, "PolygonToCut", by cutting out from it the
% sub-polygons in the list, "CutObjectNameList". For example, a number of smaller holes
% can be cut out from a metal sheet. This is useful for power grids and mim
% capacitors. The final cut object is created in the specified 'Layer'.
% 'fileID' is where the resultant SKILL Code is written to.

% Author: Haris Suhail, UCLA

String1 = [CreatedObjectName,'= dbLayerAndNot(cv list(',Layer,' "drawing") list(FistPolygon) list('];
String1 = sprintf("%s = dbLayerAndNot(cv list(""%s"" ""drawing"") list(%s) list(", CreatedObjectName,Layer,PolygonToCut );
 fprintf(fileID, String1 );
for index = 1:length(CutObjectNameList)
    objName = CutObjectNameList(index);
    fprintf(fileID, objName );
    fprintf(fileID, ' ' );
end
    fprintf(fileID, '))\r' );

    
    CMD_STRING_2 = sprintf('foreach(POLY_OBJECT %s\n',CreatedObjectName);
    CMD_STRING_3 = 'dbAddFigToFigGroup(dbGetFigGroupByName(cv GroupName) POLY_OBJECT)\n';
    CMD_STRING_4 = ')\n';
    fprintf(fileID, CMD_STRING_2 );
    fprintf(fileID, CMD_STRING_3 );
    fprintf(fileID, CMD_STRING_4 );
end