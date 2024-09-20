function [] = hsCreateCrossConnection(fileID, xstart, ystart, xpitch, ypitch, vertMetal, ...
    horiMetal, vertWidth, horiWidth, xleftlim, xrightlim, ybotlim, ytoplim, numXLines, numYlines)
% Create a metal stack with via connections. Preferred metal directions 
% should be followed (e.g. even layers horizontal, odd vertical, or vice
% versa).
% fileID - File to write the skill code to
% xstart - Where the first veritcal metal's x-location starts
% ystart - Where the first horizontal metal's y-location starts
% xpitch - Vertical Metal Pitch
% ypitch - Horizontal Metal Pitch
% vertMetal - Name of vertical metal (PDK dependent)
% horiMetal - Name of horizontal metal (PDK dependent)
% vertWidth - Width of vertical metal 
% horiWidth - Width of horizontal metal 
% xleftlim - x left limit to stop drawing
% xrightlim - x right limit to stop drawing
% ybotlim - y bottom limit to stop drawing
% ytoplim - y top limit to stop drawing
% numXLines - Number of vertical metal lines
% numYlines - Number of horizontal metal lines

% Author: Haris Suhail, UCLA

CurrentXPoint = xstart;
Pitch = xpitch;
MetalTraceName = vertMetal;
MetalTraceWidth = vertWidth;
Y1 = ybotlim;
Y2 = ytoplim;
NumMetalLines = numXLines;
for i = 1:NumMetalLines
hsCreateLine(fileID, ...
    CurrentXPoint, ...
    Y1, ...
    CurrentXPoint, ...
    Y2, ...
    MetalTraceName, ...
    MetalTraceWidth);
    CurrentXPoint = CurrentXPoint + Pitch;
end

%function [] = hsCreateCrossConnection(fileID, xstart, ystart, xpitch, ypitch, vertMetal, ...
%    horiMetal, vertWidth, horiWidth, xleftlim, xrightlim, ybotlim, ytoplim, numXLines, numYlines)
%M2
CurrentYPoint = ystart;
Pitch = ypitch;
MetalTraceName = horiMetal;
MetalTraceWidth = horiWidth;
X1 = xleftlim;
X2 = xrightlim;
NumMetalLines = numYlines;
for i = 1:NumMetalLines
hsCreateLine(fileID, ...
    X1, ...
    CurrentYPoint, ...
    X2, ...
    CurrentYPoint, ...
    MetalTraceName, ...
    MetalTraceWidth);
    CurrentYPoint = CurrentYPoint + Pitch;
end

BotMet = vertMetal;
BotWidth = vertWidth;
TopMet = horiMetal;
TopWidth = horiWidth;
X = xstart;
Y = ystart;
NumX = numXLines;
NumY = numYlines;
for XINDEX = 1:NumX
    for YINDEX = 1:NumY
        XPOS = X + ((XINDEX-1)*xpitch);
        YPOS = Y + ((YINDEX-1)*ypitch);
        if mod(YINDEX,2) == 1
            if mod(XINDEX,2) == 1
                skip =  0;
            else
                skip =  1;
            end
        else
            if mod(XINDEX,2) == 1
                skip =  1;
            else
                skip =  0;
            end
        end
        if skip ~= 1
            hsPlaceViaInArea(fileID, ...
                XPOS, ...
                YPOS, ...
                BotWidth, ... %hori
                TopWidth, ... $verti
                BotMet, ...
                TopMet);
        end
    end

end
