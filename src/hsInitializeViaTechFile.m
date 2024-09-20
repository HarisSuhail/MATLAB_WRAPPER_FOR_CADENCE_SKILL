function [] = hsInitializeViaTechFile(fileID)
% PDK dependent initialization of via stacks.

% Author: Haris Suhail, UCLA

% techFile=techGetTechFile(cv)
% constraintGroupId = cstFindConstraintGroupIn(techFile "virtuosoDefaultSetup")
% myViaOptions = viaGetViaOptions(constraintGroupId)
%myViaOptions~>createInRoute = nil
CMD_STRING_1 = "techFile=techGetTechFile(cv)\n";
CMD_STRING_2 = 'constraintGroupId = cstFindConstraintGroupIn(techFile "virtuosoDefaultSetup")\n';
CMD_STRING_3 = "myViaOptions = viaGetViaOptions(constraintGroupId)\n";
CMD_STRING_4 = "myViaOptions~>createInRoute = nil\n";
fprintf(fileID, CMD_STRING_1);
fprintf(fileID, CMD_STRING_2);
fprintf(fileID, CMD_STRING_3);
fprintf(fileID, CMD_STRING_4);
end

