var toDelete = ds_list_find_index(global.levels, room);
if (toDelete != -1) ds_list_delete(global.levels, toDelete);

var size = ds_list_size(global.levels);
if (size == 0) scrPopulateLevels();
size = ds_list_size(global.levels);

var level = irandom_range(0, size - 1);

return global.levels[| level];