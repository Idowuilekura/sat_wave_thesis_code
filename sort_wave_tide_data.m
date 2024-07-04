function [data_matrix_sorted] = sort_wave_tide_data(data_vector, time_reference)
    [dates, sortIdx] = sort(time_reference);

    data_vector  = reshape(data_vector, [size(data_vector,2), size(data_vector,1)]);

    data_matrix_sorted = [];
    for i = 1:size(data_vector,2)
       
        values_to_sort = data_vector(:,i);
        values = values_to_sort(sortIdx);
        % disp(size(values))

        data_matrix_sorted = [data_matrix_sorted, values];
    end
    % disp(size(time_reference(sortIdx)))
    time_reference_sorted = time_reference(sortIdx);
    time_reference_sorted_reshape = reshape(time_reference_sorted, [size(time_reference_sorted,2), size(time_reference_sorted,1)]);
    % disp(size(time_reference_sorted_reshape))
    data_matrix_sorted = [data_matrix_sorted, time_reference_sorted_reshape];
    

end