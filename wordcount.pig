wc  = load 'worcount.txt' as (line:chararray);
wc1 = FOREACH wc GENERATE TOKENIZE(line,' ');
wc2 = FOREACH wc1 GENERATE FLATTEN(bag_of_tokenTuples_from_line);
wc3 = group wc2 by token;
wc4 = FOREACH wc3 generate group,COUNT(wc2.token);