function [] = hsPlaceInstance(fileID, InstName, X, Y)
% Place instance that is recognized by the identifier, 'InstName', at
% location ('X', 'Y')

% Author: Haris Suhail, UCLA

     CMD_STRING_1 = ['objId = dbCreateInst(cv ',InstName,' nil list(',num2str(X),' ',num2str(Y),') "R0" 1)\n'];
     CMD_STRING_2 = 'dbAddFigToFigGroup(dbGetFigGroupByName(cv GroupName) objId)\n';
     fprintf(fileID, CMD_STRING_1);
     fprintf(fileID, CMD_STRING_2);
end
