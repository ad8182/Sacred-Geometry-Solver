% Used to calculate the correct order of operations for the Sacred Geometry
% Feat in Pathfinder 1e
% @author Andrew Dantone
function Sacred_Geometry()
    %
    % Get user input of the spell level we are looking for and assign the 
    % appropriate prime constants
    %
    Target_Level = input("What is the effective spell level after" + ...
        " the metamagic is applied?\n", "s");
    switch Target_Level
        case '1'
            Target_Constants = [3, 5, 7];
        case '2'
            Target_Constants = [11, 13, 17];
        case '3'
            Target_Constants = [19, 23, 29];
        case '4'
            Target_Constants = [31, 37, 41];
        case '5'
            Target_Constants = [43, 47, 53];
        case '6'
            Target_Constants = [59, 61, 67];
        case '7'
            Target_Constants = [71, 73, 79];
        case '8'
            Target_Constants = [83, 89, 97];
        case '9'
            Target_Constants = [101, 103, 107];
        % if the input is anything else but a number from 1-9 terminate 
        % and print the error message
        otherwise
            error("Please Input a number from 1 to 9");
    end
    % Print out the Target Prime Constants
    fprintf("Target Constants: %d, %d, %d\n", ...
        Target_Constants(1),Target_Constants(2),Target_Constants(3));
    %
    % Get the list of d6 rolls to use to find one of our target constants
    % the ammount of d6's rolled is variable from character to character
    % but a minimun of 2 are required
    %
    Getting_Rolls = true;
    Rolls_List = [];
    Current_Roll = 1;
    while(Getting_Rolls == true)
        Rolls_Input = input("Please Input the result of the next" + ...
            " d6, or press enter to finish.\n", "s");
        % if size is 0 then they want to finish inputting rolls
        if(size(Rolls_Input) == 0)
            Getting_Rolls = false;
        % Check that we have a valid input
        elseif(    Rolls_Input == "1" || Rolls_Input == "2" ...
                || Rolls_Input == "3" || Rolls_Input == "4" ...
                || Rolls_Input == "5" || Rolls_Input == "6")
            % TODO: time test if this is better
            % % % % Dynamically make a new space if we are out of room
            % % % if(Current_Roll > length(Rolls_List))
            % % %     new_array = zeros(1, length(Rolls_List)+1);
            % % %     for roll = 1 : length(Rolls_List)
            % % %         new_array(roll) = Rolls_List(roll);
            % % %     end
            % % %     Rolls_List = new_array;
            % % % end
            % % % % add the inputted roll and increment our spot
            % % % Rolls_List(Current_Roll) = str2num(Rolls_Input); %#ok<ST2NM>
            Rolls_List = cat(2, Rolls_List, str2num(Rolls_Input)); %#ok<ST2NM>
            Current_Roll = Current_Roll + 1;
        else % incorrect input, ignore it
            fprintf("Please only input a number that could" + ...
                " result from a d6.\n" + ...
                "Or press enter with no input to finish.\n");
        end
    end    
    % if they diddnt give enough rolls terminate with error message
    if(length(Rolls_List) < 2)
        error("At least 2 rolls are required to use Sacred Geometry")
    end
    % print out the list of inputted rolls for the user
    fprintf("List of rolls:")
    for roll = 1 : length(Rolls_List)
        if(roll == 1)
            fprintf(" %d", Rolls_List(roll));
        else
            fprintf(", %d", Rolls_List(roll));
        end
    end
    fprintf("\n");

    %
    % Now we must figure out if we can create one of the target constants
    % using all of the rolls in the Rolls_List, we must use each number
    % exactaly once and we can add, subtract, multiply, or divide them in
    % any order we please, so first we calculate each possible permutation
    % of the values, then check if they can create the target constants
    %
    
    % Make a matrix containing each permutation
    Rolls_Mat = Create_Permutations(Rolls_List);
    % Tests that matrix vs our target constants
    Path_To_Target = Depth_First_Search(Rolls_Mat, Target_Constants);
    if( Path_To_Target == false )
        fprintf("There is no way to get to %d, %d, or %d" + ...
            " using these numbers,\nSacred Geometry fails here.\n", ...
        Target_Constants(1),Target_Constants(2),Target_Constants(3));
    else
        % if successful then the Depth_First_Search function will print 
        % our path for us [Not implemented yet]
        fprintf( "Sacred Geometry succeeds here.\n");
    end
end