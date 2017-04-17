clear;clc;

full_data = import_data('output2.xlsx');

attr_col_to_keep = [1:6,8,9, 26:57, 60:64, 66, 68:83, 85];

raw_data = full_data(2:end, attr_col_to_keep);
raw_data(:,1) = num2cell([1:length(raw_data)]');
raw_attr = full_data(1,attr_col_to_keep);

full_addr = raw_data(:,3);

addr_split = cellfun(@(x) strsplit(x, ','), full_addr, 'UniformOutput', false);

addr = cell(length(addr_split), 1);
zip_code = {};

for i = 1:length(addr_split)
    
    addr_val = strsplit(addr_split{i}{1}, ' ');
    addr_str ='';
    for j = 1:length(addr_val)-1
        addr_str = strcat(addr_str, {' '}, addr_val(j));
    end
    
    addr(i) = addr_str;
    if length(addr_split{i}) == 2
        txt = addr_split{i}{2};
        zip_code = [zip_code; str2num(txt(4:end))];
    else
        zip_code = [zip_code; 0];
    end
    
end

data = [raw_data(:,1:2), addr, zip_code, raw_data(:, 4:end)];
attr = [raw_attr(1:2), 'address', 'zip_code', raw_attr(4:end)]; 

am1 = find(cellfun(@(x) strcmp(x,'American (New)'), attr));

am2 = find(cellfun(@(x) strcmp(x,'American (Traditional)'), attr));

am = num2cell(cellfun(@(x, y) x | y, data(:,am1), data(:,am2)));

if am1 < am2
    data2 = [data(:, 1:am1-1), am, data(:, am1+1:am2-1), data(:, am2+1:end)];
    attr2 = [attr(1:am1-1), 'American', attr(am1+1:am2-1), attr(am2+1:end)];
else
    data2 = [data(:, 1:am2-1), am, data(:, am2+1:am1-1), data(:, am1+1:end)];
    attr2 = [attr(1:am2-1), 'American', attr(am2+1:am1-1), attr(am1+1:end)];
end

alcohol = find(cellfun(@(x) strcmp(x,'Alcohol'), attr2));

for i = 1:length(data2)
   if strcmp(data2{i, alcohol}, 'full_bar')
      data2{i,alcohol} = 1;
   elseif strcmp(data2{i, alcohol}, 'none')
       data2{i,alcohol} = 0;
   end
end

wifi = find(cellfun(@(x) strcmp(x, 'Wi_Fi'), attr2));

for i = 1:length(data2)
   if strcmp(data2{i, wifi}, 'no')
       data2{i, wifi} = 0;
   elseif strcmp(data2{i, alcohol}, 'free')
       data2{i, wifi} = 1;
   end
end

smoking = find(cellfun(@(x) strcmp(x, 'Smoking'), attr2));

for i = 1:length(data2)
   if strcmp(data2{i, smoking}, 'no')
       data2{i, smoking} = 0;
   elseif strcmp(   data2{i, smoking}, 'outdoor')
       data2{i, smoking} = 1;
   end
end

categ_start = find(cellfun(@(x) strcmp(x,'Fast Food'), attr));

rest_categs = cell(length(data2), 3);

for i = 1:length(rest_categs)
    count = 1;
    for j = categ_start:length(attr2)
        if data2{i,j} == 1
            rest_categs{i, count} = attr2{j};
            count = count+1;
        end
        if count == 4
            break;
        end
    end
    if count ~= 4
        for j = count:3
            rest_categs{i,j} = [];
        end
    end
end
attr = [attr2(1:categ_start-1), 'type1', 'type2', 'type3'];
data_cut = data2(:,1:categ_start-1);
data = [data_cut,rest_categs];
data = [cell(1, length(attr));data];
data = cellfun(@remove_NA, data, 'UniformOutput', false);

% restaurant_attr = {'business_id', 'name', 'Alcohol', 'Price_Range', 'stars', 'type1', 'type2', 'type3', 'Delivery' 'Attire', 'Take_Out'};
% indices1 = [];
% for i = 1:length(restaurant_attr)
%     indices1 = [indices1; find(cellfun(@(x) strcmp(x,restaurant_attr{i}), attr))];   
% end
indices1 = [1,7:8,10:length(attr)];
restaurant_data = data(:, indices1);

location_attr = {'address', 'zip_code', 'latitude', 'longitude', 'city', 'state'};
indices2 = [];
for i = 1:length(location_attr)
    indices2 = [indices2; find(cellfun(@(x) strcmp(x,location_attr{i}), attr))];   
end
location_data = data(:, indices2);

restaurant_at_attr = {'business_id', 'address','zip_code'};
indices3 = [];
for i = 1:length(restaurant_at_attr)
    indices3 = [indices3; find(cellfun(@(x) strcmp(x,restaurant_at_attr{i}), attr))];   
end
restaurant_at_data = data(:, indices3);

xlswrite('restaurant_data.xls', restaurant_data);
xlswrite('location_data.xls', location_data);
xlswrite('restaurant_at_data.xls', restaurant_at_data);

