function [] = hsCreatePin(fileID, PinName, X, Y, W, H, Layer, Direction)
% Create a pin called 'PinName' centered at ('X', 'Y') with a width and
% height of 'W' and 'H' respectively, in the layer called 'Layer'. Pin
% direction (input, output, etc)is specified by 'Direction'.

% Author: Haris Suhail, UCLA
x1 = X - W/2;
x2 = X + W/2;
y1 = Y - H/2;
y2 = Y + H/2;
CMD1 = sprintf('pinFig = dbCreateRect(cv list("%s" "pin") list(%.3f:%.3f %.3f:%.3f))\n', Layer, x1, y1, x2, y2);
CMD2 = sprintf('labelObj = dbCreateLabel(cv list("%s" "pin") %.3f:%.3f "%s" "centerRight" "R0" "roman" 0.1)\n', Layer, X, Y, PinName);
CMD3 = 'dbAddFigToFigGroup(dbGetFigGroupByName(cv GroupName) pinFig)\n';
CMD4 = 'dbAddFigToFigGroup(dbGetFigGroupByName(cv GroupName) labelObj)\n';
CMD5 = sprintf("net = dbMakeNet(cv ""%s"")\n", PinName);
CMD6 = sprintf("pin = dbCreatePin(net pinFig)\n");
CMD7 = sprintf("pin~>term~>direction=""%s""\n", Direction); %"inputOutput"
fprintf(fileID, CMD1);
fprintf(fileID, CMD2);
fprintf(fileID, CMD3);
fprintf(fileID, CMD4);
fprintf(fileID, CMD5);
fprintf(fileID, CMD6);
fprintf(fileID, CMD7);
end