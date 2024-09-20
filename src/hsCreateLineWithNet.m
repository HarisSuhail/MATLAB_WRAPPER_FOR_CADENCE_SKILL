function []  = hsCreateLineWithNet(fileID,x_start, y_start, x_end, y_end, MetalLayerName, MetalWidth,NetName)
% Creates a metal line from (x_start, y_start) to (x_end, y_end) with a
% width of 'MetalWidth' and in the metal layer named 'MetalLayerName' (name is PDK
% dependent ). Once the metal is created, set connectivity to net
% 'NetName'. For example, 'NetName' of VDD will set connectivity of the
% trace fo VDD in the cadence layout editor.

% Author: Haris Suhail, UCLA

    %CMD_STRING_1 = ['objId = dbCreatePath(cv list(',MetalLayerName,' "drawing") list(',num2str(x_start),':',+num2str(y_start),' ',num2str(x_end),':',num2str(y_end),') ',num2str(MetalWidth),')\n'];
    CMD_STRING_1 = sprintf('objId = dbCreatePath(cv list("%s" "drawing") list(%.4f:%.4f %.4f:%.4f) %.4f)\n', ...
        MetalLayerName, x_start, y_start, x_end, y_end, MetalWidth);
    CMD_STRING_2 = 'objId~>lxStickyNet=t\n';
    CMD_STRING_3 = sprintf("parentNet = dbMakeNet(cv ""%s"" )\n", NetName);
    CMD_STRING_4 = 'dbAddFigToNet(objId parentNet)\n';
    CMD_STRING_5 = 'dbAddFigToFigGroup(dbGetFigGroupByName(cv GroupName) objId)\n';

    fprintf(fileID, CMD_STRING_1);
    fprintf(fileID, CMD_STRING_2);
    fprintf(fileID, CMD_STRING_3);
    fprintf(fileID, CMD_STRING_4);
    fprintf(fileID, CMD_STRING_5);
end

