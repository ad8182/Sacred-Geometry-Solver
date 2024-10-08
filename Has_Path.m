% This function takes a list of numbers and performs all possible
% permutations of addition, subtraction, multiplication, and division in an
% attempt to get to one of the Target numbers.
% This is a helper function for Depth_First_Search.m and is expected to be
% called with a validated rolls and target list and a string initial value
% for total, which will be changed into a number value when needed since
% matlab has mutable varable types.
% @author Andrew Dantone
function Is_Path = Has_Path(Rolls_List, Targets, Total)
    %Base Case
    if isempty(Rolls_List)
        if(Total == Targets(1) || ...
           Total == Targets(2) || ...
           Total == Targets(3))
            Is_Path = true;
        else
            Is_Path = false;
        end
    % special case if the starting length is 2 becuase that will break the 
    % recursion
    elseif isa(Total, "string") && length(Rolls_List) == 2 
        %Calculate each possible result
        Result = [  Rolls_List(1) + Rolls_List(2) ...
                    Rolls_List(1) - Rolls_List(2) ...
                    Rolls_List(1) * Rolls_List(2) ...
                    Rolls_List(1) / Rolls_List(2) ];
        %Check if any of them match
        if(Result(1) == Targets(1) || ...
           Result(1) == Targets(2) || ...
           Result(1) == Targets(3) || ...
           Result(2) == Targets(1) || ...
           Result(2) == Targets(2) || ...
           Result(2) == Targets(3) || ...
           Result(3) == Targets(1) || ...
           Result(3) == Targets(2) || ...
           Result(3) == Targets(3) || ...
           Result(4) == Targets(1) || ...
           Result(4) == Targets(2) || ...
           Result(4) == Targets(3))
            Is_Path = true;
        else
            Is_Path = false;
        end
    %
    % Recurse by popping the first roll in the list then adding, 
    % subtracting, multiplying, and dividing that number with the total
    % this continues until we have used all the numbers in the list since
    % we MUST use all of the rolled numbers, then if any match our targets
    % return true
    %
    else 
        %If its the first call we need to pop one extra since we initialize total
        %as the first number rolled
        Pop_Ammount = 2;
        if isa(Total, "string")
            Total = Rolls_List(1);
            Pop_Ammount = 3;    
        end

        %Pop the used number(s) from the array
        Popped_Rolls_List = [];
        for num = Pop_Ammount : length(Rolls_List)
            Popped_Rolls_List = cat(2, Popped_Rolls_List, Rolls_List(num));
        end

        % go through each possible math function recursively, if we hit a
        % target number using each rolled number, 
        % skip the rest of the recursion to save time
        path1 = false;
        path2 = false;
        path3 = false;
        path4 = false;
        for symbol = [1 2 3 4]
            switch symbol
                case 1 % addition
                    if Has_Path(Popped_Rolls_List, Targets , Total + Rolls_List(1))
                        path1 = true;
                        continue;
                    end
                case 2 % subtraction
                    if Has_Path(Popped_Rolls_List, Targets , Total - Rolls_List(1))
                        path2 = true;
                        continue;
                    end
                case 3 % multiplication
                    if Has_Path(Popped_Rolls_List, Targets , Total * Rolls_List(1))
                        path3 = true;
                        continue;
                    end
                case 4 % division
                    if Has_Path(Popped_Rolls_List, Targets , Total / Rolls_List(1))
                        path4 = true;
                        continue;
                    end
            end
        end
        %If any hit a target then return true, else return false
        if (path1 == true || path2 == true || path3 == true || path4 == true)
            Is_Path = true;
        else
            Is_Path = false;
        end
    end
end
