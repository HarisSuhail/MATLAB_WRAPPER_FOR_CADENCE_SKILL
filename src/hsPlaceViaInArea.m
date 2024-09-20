function [] = hsPlaceViaInArea(fileID, X, Y, W, H, TopMetal, BottomMetal)
%  Autogenerate vias between 'TopMetal' and 'BottomMetal'
% X and Y are the center location of via
% W and H are the width and height of via array.

% Author: Haris Suhail, UCLA


X1 = X - (W/2);
X2 = X + (W/2);
Y1 = Y - (H/2);
Y2 = Y + (H/2);
CMD_STRING_1 = sprintf(['VIA_LIST = viaGenerateViasInArea(cv list(''(%.3f %.3f) ''(%.3f %.3f) ''(%.3f %.3f) ''(%.3f %.3f)) ' ...
    'myViaOptions ?topAndBottomLayers list("%s" "%s"))\n'], X1, Y1, X1, Y2, X2, Y2, X2, Y1, TopMetal,BottomMetal);
CMD_STRING_2 = 'foreach(VIA_OBJECT VIA_LIST\n';
CMD_STRING_3 = 'dbAddFigToFigGroup(dbGetFigGroupByName(cv GroupName) VIA_OBJECT)\n';
CMD_STRING_4 = ')\n';
fprintf(fileID, CMD_STRING_1);
fprintf(fileID, CMD_STRING_2);
fprintf(fileID, CMD_STRING_3);
fprintf(fileID, CMD_STRING_4);
end
