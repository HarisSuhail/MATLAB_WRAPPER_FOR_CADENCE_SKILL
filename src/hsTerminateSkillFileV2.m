function [] = hsTerminateSkillFileV2(fileID, config_MOVE_TO_QUARTER)
% Project specific - Terminates skill files and moves all generated objects
% to a 'Quadrant'. This function is not general and will probably not be
% useful to you, except as an example.

% Author: Haris Suhail, UCLA


VERSION  = 2;
if VERSION == 1
    fprintf(fileID, 'dbMoveFig(dbGetFigGroupByName(cv GroupName) nil list(1962.36:2042.46 "R0"))\n');
end
if VERSION == 2
    switch config_MOVE_TO_QUARTER
        case "Q1"
            XSHIFT = 1962.36;
            YSHIFT = 2042.46;
            ROTATION = "R0";
        case "Q2"
            XSHIFT = 1962.36;
            YSHIFT = 2042.46;
            ROTATION = "MX";
        case "Q3"
            XSHIFT = 1962.36;
            YSHIFT = 2042.46;
            ROTATION = "MY";
        case "Q4"
            XSHIFT = 1962.1885+0.172-0.0005;
            YSHIFT = 2042.46;
            ROTATION = "R180";
        otherwise 
    end
    NewCommand = sprintf("dbMoveFig(dbGetFigGroupByName(cv GroupName) nil list(%.04f:%.04f ""%s""))\n",XSHIFT, YSHIFT, ROTATION);
    fprintf(fileID, NewCommand);
end

%fprintf(fileID, ');\n');
end