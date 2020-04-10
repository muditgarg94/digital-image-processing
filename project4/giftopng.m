
function giftopng(imageList)

    for i = 1 : numel(imageList)
        I = imread(imageList{i});
        [~, fileName, extension] = fileparts(imageList{i});
        imwrite(I,[fileName,'.png']);
    end

end