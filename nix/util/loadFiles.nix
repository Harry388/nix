let
    attrsToList = attrs: map (name: { inherit name; value = attrs.${name}; }) (builtins.attrNames attrs);
    flatten = list: builtins.foldl' (acc: elem: acc ++ elem) [] list;
    hasSuffix = suffix: content:
        let
            lenSuffix = builtins.stringLength suffix;
            lenContent = builtins.stringLength content;
        in
        lenContent >= lenSuffix && builtins.substring (lenContent - lenSuffix) lenContent content == suffix;
    hasPrefix = prefix: content:
        let
            lenPrefix = builtins.stringLength prefix;
            lenContent = builtins.stringLength content;
        in
        lenContent >= lenPrefix && builtins.substring 0 lenPrefix content == prefix;

    loadFile = path: file: args:
        let
            filePath = path + "/${file}";
            value = import filePath;
        in
        {
            name = builtins.replaceStrings [ ".nix" ] [ "" ] file;
            value = if builtins.isFunction value && ! builtins.isNull args then value args else value;
        };

    loadAsList = path: args:
        let
            children = builtins.readDir path;
            childrenAsList = attrsToList children;
            fileChildren = builtins.filter
                (child: child.value == "regular" && (hasSuffix ".nix" child.name) && (! hasPrefix "_" child.name))
                childrenAsList;
            directoryChildren = builtins.filter
                (child: child.value == "directory")
                childrenAsList;
        in
        (map
            (child: loadFile path child.name args)
            fileChildren)
        ++ flatten
            (map
                (child: loadAsList (path + "/${child.name}") args)
                directoryChildren);

    loadAsListShallow = path: args:
        let
            children = builtins.readDir path;
            childrenAsList = attrsToList children;
            filteredChildren = builtins.filter
                (child: (child.value == "regular" && (hasSuffix ".nix" child.name) && (! hasPrefix "_" child.name)) || (child.value == "directory"))
                childrenAsList;
        in
        (map
            (child: loadFile path child.name args)
            filteredChildren);
in
path: { shallow ? false, args ? null }:

let
    loader = if shallow then loadAsListShallow else loadAsList;
in
builtins.listToAttrs (loader path args)
