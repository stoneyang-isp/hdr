
function [FileList] = createFileList(FilePath,FileList,FileExt,verbose)
dirList = dir(FilePath);
ridx = strcmp({dirList.name},'.') | strcmp({dirList.name},'..');
dirList(ridx) = [];
FileList2 = {};
if size(dirList,2) ~= 0
    for listing = 1:size(dirList,1)
        current_Path = [FilePath '/' dirList(listing).name];
        typed_path = current_Path; #regexprep(current_Path,'/','/');
        if verbose
            fprintf(['Looking at:' typed_path '\n']);
        end
        if any(strcmp(FileExt, dirList(listing).name(end-2:end)))
            FileList2{end+1, 1} = current_Path;
        end
    end
FileList = FileList2;
end