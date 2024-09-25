% This function takes in an array of numbers and returns a matrix where
% each row is a diffrent permutation of the order of those numbers
% @author Andrew Dantone 

% Wrapper function for easier use
function Rolls_Mat = Create_Permutations(Rolls_List)
    Rolls_Mat = Recursive_Permutations(Rolls_List, []); 
end

% Helper function for Create Permutations, should only be called as a part
% of Create_Permutations
% This function works by taking each element in the array and adding it to
% a seperate output list, then recursively calling with that roll removed
% from the input list, then concatenating all of the results into one
% matrix and returning that
function Rolls_Mat = Recursive_Permutations(Rolls_List, Current_List)
    % Initialize with a zero, this should never return since the main
    % Sacred_Geometry function makes sure the starting rolls_list is not
    % empty
    Rolls_Mat = 0;
    
    % base case
    if isscalar(Rolls_List) %checks if there is only one number left,
        Rolls_Mat = cat(2, Current_List, Rolls_List); % adds our final 
    else %we arent at base case do the recursion      % number and returns
        for roll = 1 : length(Rolls_List)
            % add the roll to a temporary current list
            New_Current_List = cat(2, Current_List, Rolls_List(roll));
            % remove that roll from a temportary rolls list
            New_Rolls_List = cat(2, Rolls_List(1:(roll-1)), ...
                Rolls_List((roll+1):length(Rolls_List)));
            % recursively call and add that output to our final matrix
            if (Rolls_Mat == 0) %if we dont have any ourputs yet, replace 
                                % the output variable with the result 
                Rolls_Mat = Recursive_Permutations(New_Rolls_List, ...
                    New_Current_List);
            else % otherwise we do have output so add the recurive results 
                 % onto that output
                Rolls_Mat = cat(1,Rolls_Mat, ...
                  Recursive_Permutations(New_Rolls_List,New_Current_List));
            end

        end

    end

end