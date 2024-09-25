% Preform a Depth First Search through all the possible combinations
% of numbers, Rolls_Mat, where each row is the set of inputs in a diffrent
% order and the matrix contains all possible permutations.
% In order to find a way to get to one of three constant prime numbers,
% Targets
% This function is only expected to be called during the use of
% Sacred_Geometry.m and as such may not work if used in other conditions
% @author Andrew Dantone
function Is_Path = Depth_First_Search(Rolls_Mat, Targets)
    % Determines if there is a path to any of the Target
    Is_Path = false;
    for row = 1 : size(Rolls_Mat,2) %iterate through each row
        % if we have yet to find a path, continue the search
        if(Is_Path ~= true)
            % if this function finds a path it will print it, so we only
            % need to keep track of if it did or did not find a path using
            % a boolean
            Is_Path = Has_Path(Rolls_Mat(row, :), Targets, "init");
        end
    end
    % Matlab automatically returns Is_Path for us
end