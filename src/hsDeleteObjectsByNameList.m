function [] = hsDeleteObjectsByNameList(fileID, CutObjectNameList)
% Deletes all objects that have been created in layout and are included in
% the 'CutObjectNameList'. The list holds the identifiers of the objects to
% be deleted.
    for index = 1:length(CutObjectNameList)
        objName = CutObjectNameList(index);
        string = sprintf(' dbDeleteObject(%s)\n',objName);
        fprintf(fileID, string );
    end
end