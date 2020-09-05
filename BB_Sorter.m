function Final_Sort = BB_Sorter(nums)
% This function sorts a numeric data set into ascending order.
% 
% 
% Define Variables...
%   nums        - Input array to sort
%   ii          - Indexing variable
%   min_pointer - Pointer to current minimum value
%   jj          - Indexing variable
%   nvals       - number of values in the array nums(i.e., number of numbers
%                 to be sorted)
%   Final_Sort  - sorted output array
%   temp        - Temp holder of numeric value, used to facilitate the
%                 swapping during sort as new "lowest" numbers are found
%
%
% --- START OF FUNCTION ---
%
% Determine the length of the Numeric Array to be Sorted...
nvals = length(nums);
%
% Sort the  Numeric Array
for ii = 1:nvals-1
    min_pointer = ii;           % Assign current minimum value position
                                % location to the "minimum value"
                                % location pointer, min_pointer
    for jj = ii+1:nvals
        if nums(jj) < nums(min_pointer)     % Test current minimum value
                                            % against other numbers
            min_pointer = jj;           % If test passes, assign new
                                        % minimum value position location
                                        % to the "minimum value" location
                                        % pointer
        end
    end
    if ii ~= min_pointer                        % Provided ii does not
        temp              = nums(ii);           % equal the current
        nums(ii)          = nums(min_pointer);  % min-pointer position
        nums(min_pointer) = temp;               % location number, we
    end                                         % swap nums(min_pointer)
end                                             % and nums(ii)
%
% Return Sorted Numeric Array to Main Program
Final_Sort = nums;
%
% --- END OF FUNCTION ---


