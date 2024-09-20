function [] = hsDefineInstanceV3(fileID, Identifier, Library, Cell, View)
% This function defines an instance 'Cell' in the SKILL code from any 'Library' that
% is defined in the cadence library manager. This can be used to later
% instantiate that instance in the code using its 'identifier'. Currently.
% the cellview selected is layout only, but that can be easily modified to
% select any kind of cell view (schematic, symbol, etc).

% Author: Haris Suhail, UCLA

    %CMD_STRING_1 = [Identifier,' = dbOpenCellViewByType("',Library,'" "',Cell,'" "layout")\n'];
    CMD_STRING_1 = sprintf("%s = dbOpenCellViewByType(""%s"" ""%s"" ""%s"") \n",Identifier, Library, Cell,View);
    fprintf(fileID, CMD_STRING_1);
end
