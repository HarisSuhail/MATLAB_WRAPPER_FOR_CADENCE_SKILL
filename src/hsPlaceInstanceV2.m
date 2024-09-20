function [] = hsPlaceInstanceV2(fileID, InstName, X, Y, ROTATION)
% Place instance that is recognized by the identifier, 'InstName', at
% location ('X', 'Y') with a 'ROTATION'

% Author: Haris Suhail, UCLA

     %CMD_STRING_1 = ['objId = dbCreateInst(cv ',InstName,' nil list(',num2str(X),' ',num2str(Y),') "R0" 1)\n'];
     %CMD_STRING_2 = '';
     CMD_STRING_1 = sprintf("objId = dbCreateInst(cv %s nil list(%4.4f %4.4f) ""%s"" 1)\n",InstName, X, Y, ROTATION);
     CMD_STRING_2 = sprintf("dbAddFigToFigGroup(dbGetFigGroupByName(cv GroupName) objId)\n");
     fprintf(fileID, CMD_STRING_1);
     fprintf(fileID, CMD_STRING_2);
end
