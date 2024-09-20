function [] = hsCreateCutsWithIgnore(fileID,CreatedObjectName, Layer ,PolygonToCut,CutObjectNameList, CutIgnoreList)

% Creates cuts in the main polygon, "PolygonToCut", by cutting out from it the
% sub-polygons in the list, "CutObjectNameList". For example, a number of smaller holes
% can be cut out from a metal sheet. 'CutIgnoreList' is a list of objects
% that will be a subset of objects in 'CutObjectNameList'. These objects
% will be ignored, and will not be cut out from the main polygon.
% This is useful for power grids and mimcapacitors. The final cut object is created in the specified 'Layer'.
% 'fileID' is where the resultant SKILL Code is written to.

% Author: Haris Suhail, UCLA


String1 = [CreatedObjectName,'= dbLayerAndNot(cv list(',Layer,' "drawing") list(FistPolygon) list('];
String1 = sprintf("%s = dbLayerAndNot(cv list(""%s"" ""drawing"") list(%s) list(", CreatedObjectName,Layer,PolygonToCut );
 fprintf(fileID, String1 );
for index = 1:length(CutObjectNameList)
    if ismember(CutObjectNameList(index),CutIgnoreList)
        continue;
    end
    objName = CutObjectNameList(index);
    fprintf(fileID, objName );
    fprintf(fileID, ' ' );
end
    fprintf(fileID, '))\n' );

    
    CMD_STRING_2 = sprintf('foreach(POLY_OBJECT %s\n',CreatedObjectName);
    CMD_STRING_3 = 'dbAddFigToFigGroup(dbGetFigGroupByName(cv GroupName) POLY_OBJECT)\n';
    CMD_STRING_4 = ')\n';
    fprintf(fileID, CMD_STRING_2 );
    fprintf(fileID, CMD_STRING_3 );
    fprintf(fileID, CMD_STRING_4 );
end