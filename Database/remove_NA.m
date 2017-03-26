function out = remove_NA(x)
    if strcmp(x, 'NA')
        out = [];
    else
        out = x;
end